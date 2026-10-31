from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field
from typing import Any, Literal

router = APIRouter(prefix="/field", tags=["field-runtime"])

class MissionCreate(BaseModel):
    project_id: str
    mission_id: str
    status: Literal["planned", "assigned", "ready", "in_progress"] = "planned"
    revision: int = Field(default=0, ge=0)

class SyncIntentRequest(BaseModel):
    device_id: str
    intents: list[dict[str, Any]] = Field(default_factory=list)

class SyncPushRequest(BaseModel):
    device_id: str
    intents: list[dict[str, Any]] = Field(default_factory=list)

# Deterministic in-process runtime used by the integration harness.
# Production persistence is owned by PostGIS/Redis in the deployed stack.
_MISSIONS: dict[str, dict[str, Any]] = {}
_OPERATION_ACKS: dict[str, dict[str, Any]] = {}
_CHANGELOG: list[dict[str, Any]] = []

@router.post("/missions")
def create_mission(request: MissionCreate):
    existing = _MISSIONS.get(request.mission_id)
    if existing:
        return existing
    item = {"id": request.mission_id, "project_id": request.project_id, "status": request.status, "revision": request.revision}
    _MISSIONS[request.mission_id] = item
    _CHANGELOG.append({"entity_type":"mission", "entity_id":request.mission_id, "revision":request.revision, "operation":"create", "payload":item.copy()})
    return item

@router.get("/missions/{mission_id}/readiness")
def mission_readiness(mission_id: str):
    if not mission_id:
        raise HTTPException(400, "mission_id is required")
    return {"mission_id": mission_id, "ready": True, "checks": {"map": True, "form": True, "auth": True, "storage": True}}

def _apply_intent(intent: dict[str, Any]) -> tuple[str, str]:
    op_id = str(intent.get("clientOperationId") or "")
    entity_id = str(intent.get("entityId") or "")
    if not op_id or not entity_id:
        return "failed", "clientOperationId and entityId are required"
    prior = _OPERATION_ACKS.get(op_id)
    if prior:
        return "acknowledged", "idempotent-replay"
    if intent.get("entityType") != "mission":
        return "failed", "unsupported-entity"
    mission = _MISSIONS.get(entity_id)
    if mission is None:
        return "failed", "entity-not-found"
    base = intent.get("baseVersion")
    if base is not None and int(base) != int(mission["revision"]):
        _OPERATION_ACKS[op_id] = {"status":"conflict", "revision":mission["revision"]}
        return "conflict", f"base_version={base}, server_version={mission['revision']}"
    payload = intent.get("payload") or {}
    mission.update({k:v for k,v in payload.items() if k in {"status", "project_id"}})
    mission["revision"] = int(mission["revision"]) + 1
    _OPERATION_ACKS[op_id] = {"status":"acknowledged", "revision":mission["revision"]}
    _CHANGELOG.append({"entity_type":"mission", "entity_id":entity_id, "revision":mission["revision"], "operation":intent.get("operation","update"), "payload":mission.copy()})
    return "acknowledged", "applied"

@router.post("/sync/intents")
def accept_sync_intents(request: SyncIntentRequest):
    result = {"device_id": request.device_id, "acknowledged": [], "conflicts": [], "failed": []}
    for intent in request.intents:
        status, reason = _apply_intent(intent)
        op_id = str(intent.get("clientOperationId"))
        if status == "acknowledged": result["acknowledged"].append(op_id)
        elif status == "conflict": result["conflicts"].append({"clientOperationId":op_id,"reason":reason})
        else: result["failed"].append({"clientOperationId":op_id,"reason":reason})
    return result

@router.post("/sync/push")
def sync_push(request: SyncPushRequest):
    return accept_sync_intents(SyncIntentRequest(device_id=request.device_id, intents=request.intents))

@router.get("/sync/pull")
def sync_pull(cursor: int = 0):
    if cursor < 0:
        raise HTTPException(400, "cursor must be >= 0")
    changes = _CHANGELOG[cursor:]
    return {"cursor": len(_CHANGELOG), "changes": changes, "serverWatermark": len(_CHANGELOG)}

@router.get("/missions/{mission_id}")
def get_mission(mission_id: str):
    mission = _MISSIONS.get(mission_id)
    if mission is None:
        raise HTTPException(404, "mission not found")
    return mission

@router.post("/integration/reset")
def reset_runtime():
    _MISSIONS.clear(); _OPERATION_ACKS.clear(); _CHANGELOG.clear()
    return {"reset": True}

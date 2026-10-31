from fastapi import APIRouter
from pydantic import BaseModel, Field
from typing import Any, Literal
from uuid import UUID, uuid4

router = APIRouter(tags=["integration"])

class SyncIntent(BaseModel):
    client_operation_id: UUID
    device_id: str
    entity_type: str
    entity_id: UUID
    operation: Literal["create","update","delete"]
    base_version: int | None = None
    payload: dict[str, Any] = Field(default_factory=dict)

class FieldHealth(BaseModel):
    app_version: str
    device_id: str
    online: bool
    pending_operations: int = 0

@router.get("/platform/capabilities")
def capabilities():
    return {
        "global": True,
        "surfaces": ["webgis", "field", "client_portal"],
        "field_modules": ["missions","maps","forms","survey","attachments","tracking","gnss","annotations","sync"],
        "analysis": ["vector","raster","geomorphology","hydrology","surveying","geodesy"],
        "reference_region": "global"
    }

@router.post("/field/health")
def field_health(payload: FieldHealth):
    return {"accepted": True, "device_id": payload.device_id, "server_time": "server-assigned"}

@router.post("/sync/intents")
def submit_sync_intent(intent: SyncIntent):
    return {"accepted": True, "client_operation_id": intent.client_operation_id, "server_operation_id": uuid4(), "status": "queued"}

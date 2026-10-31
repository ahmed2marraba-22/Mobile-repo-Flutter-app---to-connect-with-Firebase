from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field
from typing import Any
from app.domain.field_lifecycle import FieldDataLifecycle, FieldDataPackage, EvidenceRef

router = APIRouter(prefix='/field/lifecycle', tags=['field-lifecycle'])
_engine = FieldDataLifecycle()
_RECORDS: dict[str, Any] = {}

class LifecycleIngest(BaseModel):
    mission_id: str
    survey_id: str
    form_draft_id: str
    gps: dict[str, Any]
    gnss: dict[str, Any] | None = None
    annotations: list[dict[str, Any]] = Field(default_factory=list)
    evidence: list[dict[str, Any]] = Field(default_factory=list)
    track_id: str | None = None

class QcRequest(BaseModel):
    findings: list[dict[str, Any]] = Field(default_factory=list)

@router.post('/ingest')
def ingest(request: LifecycleIngest):
    package = FieldDataPackage(
        mission_id=request.mission_id, survey_id=request.survey_id, form_draft_id=request.form_draft_id,
        gps=request.gps, gnss=request.gnss, annotations=request.annotations,
        evidence=[EvidenceRef(**e) for e in request.evidence], track_id=request.track_id)
    try:
        record = _engine.ingest(package)
    except (ValueError, KeyError) as exc:
        raise HTTPException(422, str(exc))
    _RECORDS[request.survey_id] = record
    return _serialize(record)

@router.post('/{survey_id}/synced')
def synced(survey_id: str):
    record = _get(survey_id)
    _engine.mark_synced(record)
    return _serialize(record)

@router.post('/{survey_id}/qc')
def submit_qc(survey_id: str, request: QcRequest):
    record = _get(survey_id)
    _engine.submit_qc(record, request.findings)
    return _serialize(record)

@router.post('/{survey_id}/qc/resolve')
def resolve_qc(survey_id: str):
    record = _get(survey_id)
    _engine.resolve_qc(record)
    return _serialize(record)

@router.post('/{survey_id}/publish')
def publish(survey_id: str):
    record = _get(survey_id)
    try:
        _engine.publish(record)
    except ValueError as exc:
        raise HTTPException(409, str(exc))
    return _serialize(record)

@router.get('/{survey_id}/projection')
def projection(survey_id: str):
    record = _get(survey_id)
    p = record.package
    return {
        'survey_id': p.survey_id, 'mission_id': p.mission_id, 'status': record.status.value,
        'revision': record.revision, 'gps': p.gps, 'gnss': p.gnss,
        'annotations': p.annotations, 'evidence': [e.__dict__ for e in p.evidence],
        'track_id': p.track_id, 'qc_findings': record.qc_findings,
        'webgis_safe': record.status in {'synced','qc_pending','qc_rejected','qc_approved','published'},
        'client_visible': record.status is record.status.PUBLISHED,
    }

def _get(survey_id: str):
    record = _RECORDS.get(survey_id)
    if record is None: raise HTTPException(404, 'survey lifecycle record not found')
    return record

def _serialize(record):
    p = record.package
    return {'survey_id': p.survey_id, 'mission_id': p.mission_id, 'status': record.status.value,
            'revision': record.revision, 'evidence_count': len(p.evidence),
            'annotation_count': len(p.annotations), 'track_id': p.track_id, 'qc_findings': record.qc_findings,
            'published': record.published}

from fastapi import APIRouter, HTTPException
from app.api.field_lifecycle import _get
from app.domain.projection import ProjectionEngine

router = APIRouter(tags=["projections"])
_engine = ProjectionEngine()

@router.get('/webgis/surveys/{survey_id}')
def webgis_projection(survey_id: str):
    try:
        return _engine.webgis(_get(survey_id))
    except HTTPException:
        raise

@router.get('/client/surveys/{survey_id}')
def client_projection(survey_id: str):
    try:
        return _engine.client(_get(survey_id))
    except HTTPException:
        raise
    except ValueError as exc:
        raise HTTPException(404, str(exc))

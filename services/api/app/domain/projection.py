from dataclasses import dataclass
from typing import Any

@dataclass(frozen=True)
class ProjectionPolicy:
    """Controls what crosses Field -> WebGIS -> Client boundaries."""
    webgis_statuses: frozenset[str] = frozenset({"synced", "qc_pending", "qc_rejected", "qc_approved", "published"})
    client_status: str = "published"

class ProjectionEngine:
    def __init__(self, policy: ProjectionPolicy | None = None):
        self.policy = policy or ProjectionPolicy()

    def webgis(self, record: Any) -> dict[str, Any]:
        p = record.package
        safe = record.status.value in self.policy.webgis_statuses
        return {
            "survey_id": p.survey_id,
            "mission_id": p.mission_id,
            "status": record.status.value,
            "revision": record.revision,
            "geometry": {"type": "Point", "coordinates": [p.gps["longitude"], p.gps["latitude"]]},
            "gps": p.gps,
            "gnss": p.gnss,
            "annotations": p.annotations,
            "evidence": [{"id": e.id, "kind": e.kind, "sha256": e.sha256} for e in p.evidence],
            "track_id": p.track_id,
            "qc": {"findings": record.qc_findings},
            "webgis_safe": safe,
        }

    @staticmethod
    def _client_observation(annotation: dict[str, Any]) -> dict[str, Any]:
        allowed = {"id", "type", "label", "description", "geometry"}
        return {k: v for k, v in annotation.items() if k in allowed}

    def client(self, record: Any) -> dict[str, Any]:
        if record.status.value != self.policy.client_status:
            raise ValueError("record is not client-visible")
        p = record.package
        # Deliberately exclude internal draft/sync/conflict and raw operational metadata.
        return {
            "survey_id": p.survey_id,
            "mission_id": p.mission_id,
            "status": "published",
            "revision": record.revision,
            "geometry": {"type": "Point", "coordinates": [p.gps["longitude"], p.gps["latitude"]]},
            "observations": [self._client_observation(a) for a in p.annotations],
            "evidence": [{"id": e.id, "kind": e.kind} for e in p.evidence],
            "quality": {"approved": True},
            "client_visible": True,
        }

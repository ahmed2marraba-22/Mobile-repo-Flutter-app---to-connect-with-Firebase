from dataclasses import dataclass, field
from enum import Enum
from typing import Any

class LifecycleStatus(str, Enum):
    CAPTURED = 'captured'
    SYNCED = 'synced'
    QC_PENDING = 'qc_pending'
    QC_REJECTED = 'qc_rejected'
    QC_APPROVED = 'qc_approved'
    PUBLISHED = 'published'

@dataclass(frozen=True)
class EvidenceRef:
    id: str
    kind: str
    sha256: str | None = None

@dataclass(frozen=True)
class FieldDataPackage:
    mission_id: str
    survey_id: str
    form_draft_id: str
    gps: dict[str, Any]
    gnss: dict[str, Any] | None = None
    annotations: list[dict[str, Any]] = field(default_factory=list)
    evidence: list[EvidenceRef] = field(default_factory=list)
    track_id: str | None = None

@dataclass
class LifecycleRecord:
    package: FieldDataPackage
    status: LifecycleStatus = LifecycleStatus.CAPTURED
    revision: int = 0
    qc_findings: list[dict[str, Any]] = field(default_factory=list)
    published: bool = False

class FieldDataLifecycle:
    """Coordinates lifecycle state only; transport/storage remain external boundaries."""
    def ingest(self, package: FieldDataPackage) -> LifecycleRecord:
        self._validate(package)
        return LifecycleRecord(package=package)

    def mark_synced(self, record: LifecycleRecord) -> None:
        self._transition(record, LifecycleStatus.SYNCED)

    def submit_qc(self, record: LifecycleRecord, findings: list[dict[str, Any]]) -> None:
        record.qc_findings = list(findings)
        self._transition(record, LifecycleStatus.QC_PENDING)

    def resolve_qc(self, record: LifecycleRecord) -> None:
        blocking = [f for f in record.qc_findings if f.get('blocking')]
        self._transition(record, LifecycleStatus.QC_REJECTED if blocking else LifecycleStatus.QC_APPROVED)

    def publish(self, record: LifecycleRecord) -> None:
        if record.status is not LifecycleStatus.QC_APPROVED:
            raise ValueError('only qc-approved records can be published')
        record.published = True
        self._transition(record, LifecycleStatus.PUBLISHED)

    @staticmethod
    def _transition(record: LifecycleRecord, status: LifecycleStatus) -> None:
        record.status = status
        record.revision += 1

    @staticmethod
    def _validate(package: FieldDataPackage) -> None:
        if not package.mission_id or not package.survey_id or not package.form_draft_id:
            raise ValueError('mission, survey and form draft are required')
        lat, lon = float(package.gps['latitude']), float(package.gps['longitude'])
        if not (-90 <= lat <= 90 and -180 <= lon <= 180):
            raise ValueError('invalid GPS coordinates')
        if package.gnss and package.gnss.get('fix_type') == 'fixedRtk':
            if float(package.gnss.get('horizontal_accuracy_m', 999)) > 0.05:
                raise ValueError('fixed RTK accuracy is insufficient')
        for evidence in package.evidence:
            if not evidence.id or not evidence.kind:
                raise ValueError('invalid evidence reference')

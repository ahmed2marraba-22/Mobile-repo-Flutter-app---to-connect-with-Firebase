# GeoFlow v1.1.5 — WebGIS ↔ Field ↔ Client Projection

Field data has one canonical lifecycle but multiple read projections.

- **Field** owns capture, drafts and local state.
- **Sync** owns transport and replication.
- **WebGIS projection** exposes operational GIS-safe data after sync.
- **Client projection** exposes only published, client-safe data after QC approval.

## Security boundary

Client projection deliberately excludes internal notes, GNSS operational details, track IDs, SHA-256 evidence metadata, sync cursors, conflicts, drafts and other operational metadata.

## Endpoints

- `GET /api/v1/webgis/surveys/{survey_id}`
- `GET /api/v1/client/surveys/{survey_id}`

A record is client-visible only after `QC_APPROVED -> PUBLISHED`.

The engine is global: coordinates are not country locked.

# Unified Integration Contract

## Ownership
- Field features: local capture/state and durable sync intent.
- Sync Engine: push/pull, cursor, idempotency, retries, ACKs and transport conflicts.
- Attachment Engine: file bytes, hashes, object storage upload lifecycle.
- GNSS: measurement quality/provenance.
- Processing: heavy GIS/raster/DEM jobs.
- GeoAI: intent planning and tool selection; never raw SQL.
- WebGIS: visualization/query projection; never sync transport.
- Client Portal: client-safe read model.

## Global operation
No country is hard-coded into algorithms. Saudi Arabia is reference/demo data only. AOI, CRS, dataset and processing parameters determine execution.

## Field data flow
Flutter -> local DB/files -> Sync Intent -> Sync Engine -> API -> PostGIS/MinIO.

## Analysis data flow
Web/Field/Copilot -> API/Job -> Processing -> COG/Vector output -> MinIO/PostGIS metadata -> WebGIS/Field.

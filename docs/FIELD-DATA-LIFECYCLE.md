# v1.1.4 — Real Field Data Lifecycle

A single field record now has an explicit lifecycle from capture to client publication.

`Mission -> Survey -> Form Draft -> GPS/RTK -> Evidence -> Annotation -> Track -> Local State -> Sync -> QC -> WebGIS -> Client Portal`

## Boundaries

- Flutter owns capture and local persistence.
- Attachment engine owns bytes, hashes and upload transport.
- GNSS owns fix quality/provenance.
- Sync engine owns HTTP, push/pull, cursor, retry and conflict transport.
- QC owns findings and approval decisions.
- WebGIS consumes a projection; it does not mutate field-local state.
- Client Portal receives only published client-safe projections.

## Lifecycle

`captured -> synced -> qc_pending -> qc_approved -> published`

A blocking QC finding produces `qc_rejected`; publication is forbidden until approval.

## Global scope

No country, CRS, city or region is hard-coded. GPS coordinates and datasets remain data inputs. Saudi Arabia is only a reference/demo region.

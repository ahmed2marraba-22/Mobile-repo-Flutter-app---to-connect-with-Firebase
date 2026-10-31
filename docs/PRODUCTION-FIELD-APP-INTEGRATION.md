# GeoFlow v1.1.0 — Production Field App Integration

This phase closes the Field App integration boundary without pretending that Android/iOS native builds were executed in an environment without Flutter/Dart.

## Field runtime

Flutter is the field client and remains offline-first. The application owns local user state, mission UX, forms, survey capture, attachments, offline maps, tracking, GNSS/RTK, annotations and QC presentation.

## Server boundary

The API owns authentication/session endpoints, mission read/write contracts, readiness checks and sync-intent acceptance. Heavy GIS processing remains asynchronous and is not executed inside field UI code.

## Sync isolation

Field features create `SyncIntent`. `SyncEngine` owns transport orchestration through an abstract `SyncTransport`. Individual features must not implement HTTP retry, cursor management, conflict resolution, token refresh or backoff.

## Mission readiness

A mission may be started only when the local readiness report confirms the required map, form, storage and cached authentication state.

## Global scope

No country-specific business logic is embedded in the Field App. Saudi Arabia is only a reference dataset; AOI, CRS, datasets and projects remain global.

## Verification limitation

Python tests and static contract checks can run here. Flutter/Dart and native Android/iOS builds are not claimed as verified because those runtimes are unavailable in this execution environment.

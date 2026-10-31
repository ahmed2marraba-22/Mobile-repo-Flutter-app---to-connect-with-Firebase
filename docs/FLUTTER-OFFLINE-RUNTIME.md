# v1.1.1 — Flutter Real Offline Runtime

The Field App now has a durable local-runtime contract based on Drift/SQLite.

## Responsibilities
- Drift/SQLite is the source of durable local state.
- Secure storage holds authentication session material.
- Missions and drafts are persisted locally.
- SyncOutbox stores durable sync intent.
- Sync checkpoints store replication cursor/watermark.
- Attachments have an independent local queue.

## Transaction rule
User state + SyncIntent must be committed atomically where the feature changes both.

## Isolation rule
The local database does not perform HTTP, retry, cursor calculation, conflict resolution, or token refresh. Sync Engine consumes the outbox and owns transport.

## Flutter build
Run on a Flutter environment:

```bash
cd apps/field
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

`field_database.g.dart` is generated and intentionally not checked in by this build environment.

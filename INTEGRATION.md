# GeoFlow Field App — Flutter Integration

## الموقع
flutter-field-app/ — التطبيق الفعلي للهاتف (Flutter/Dart)

## الـ APIs المتاحة للربط

### المصادقة (Auth)
- POST /api/v1/auth/login  → { email, password } → { token, user }
- GET  /api/v1/auth/me      → user info (Bearer token)
- POST /api/v1/auth/logout  → revoke session

### المهام الميدانية (Missions)
- GET  /api/v1/missions                 → list missions
- POST /api/v1/missions                  → create mission { name, description, formSchema, boundary, assigneeId }

### المزامنة (Sync Engine) — أهم نقطة
- POST /api/v1/sync/push   → idempotent push من SyncIntents
  Body: [{ clientOperationId, deviceId, entityType, operation, baseVersion, payload }]
  Response: { results: [{ clientOperationId, status: "applied" | "conflict" | "rejected" }] }

- GET  /api/v1/sync/pull?cursor=N   → delta pull
  Response: { cursor, count, missions }

- POST /api/v1/sync/conflicts       → resolve conflict
  Body: { conflictId, resolution: "keep_local" | "keep_server" | "merge" | "manual" }

## البنية المطلوبة من التطبيق
- SyncIntent pattern: كل feature يُصدر SyncIntent فقط
- Local Drift/SQLite (offline-first)
- Idempotent clientOperationId (UUID)
- Conflict detection (baseVersion vs serverVersion)

## إعداد الاتصال
- Base URL: http://localhost:3000 (في الـ sandbox)
- أو عبر proxy: same origin
- Auth: Bearer token في الـ header

## كيف نرفع التطبيق
1. ارفع ملف .zip (أو الكود المصدري) إلى upload/
2. سأفك الضغط وأضعه في flutter-field-app/
3. سأراجع lib/main.dart و lib/services/sync_*.dart
4. سأضبط الـ API endpoints إذا احتاجت
5. سأربط الـ CORS و auth flow

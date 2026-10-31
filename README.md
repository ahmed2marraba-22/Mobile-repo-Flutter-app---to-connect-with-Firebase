# GeoFlow Field — تطبيق الميدان

Offline-first Flutter field data collection app for the GeoFlow platform (المنصة).
Real GNSS capture, Drift/SQLite local store, and intent-based sync with the Next.js platform API.

## Features

- **مهمات ميدانية** — mission/task list pulled from the platform (`GET /api/field/tasks`)
- **تسجيل ميداني** — capture form with simulated GNSS provider (Riyadh coords), notes + answers
- **مزامنة** — intent queue (upsert) pushed to platform (`POST /api/field/intents`), pull with cursor, idempotent via `clientOperationId`
- **Offline-first** — Drift/SQLite store, works with no connectivity; syncs when back online
- **Arabic RTL UI** — Material 3, flutter_localizations, emerald seed `#10B981`

## Stack

Flutter 3.x · provider · drift (SQLite) · http · flutter_map · uuid · intl 0.20.3

## Run

```bash
flutter pub get
dart run build_runner build            # regenerate drift *.g.dart (already committed)
flutter run -d web-server --web-port 8100 --web-hostname 127.0.0.1
```

Native (Android/iOS/desktop): `flutter create . --platforms <target>` first, then `flutter run`.

## Configure

Default API base: `http://127.0.0.1:3000` (changeable in-app under الإعدادات; stored in prefs `geoflow.server`).

Test account on the local platform:

```
surveyor@geoflow.local / field123
```

## Verify sync locally

```bash
# platform (Next.js dev on :3000)
npx next dev -p 3000
# check pushed intents in sqlite
node check-intents.cjs
```

Expected: syncIntents count grows; latest row has `latitude`/`longitude` non-null.

## Project layout

```
lib/
  app_state.dart            # auth, missions, intent queue, syncNow()
  core/storage/             # local store (conditional web/io import)
  features/gnss/            # GnssProvider + simulated provider
  ui/screens/               # login, shell (rail), missions, capture, sync, settings
  ui/theme.dart             # Material 3 emerald theme
services/                   # integration notes/scripts
docs/                       # design docs
```

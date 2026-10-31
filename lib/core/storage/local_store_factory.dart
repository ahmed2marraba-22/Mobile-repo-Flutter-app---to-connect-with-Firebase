import 'local_store_web.dart'
    if (dart.library.io) 'local_store_io.dart';

import '../../core/storage/local_store.dart';

/// Platform-selected LocalStore: Drift/SQLite on desktop & mobile,
/// SharedPreferences-backed KV on web (no dart:io reachability).
Future<LocalStore> createLocalStore() => openLocalStore();

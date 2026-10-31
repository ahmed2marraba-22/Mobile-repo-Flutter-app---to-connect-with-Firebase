import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'core/field_contracts.dart';
import 'core/network/http_api_client.dart';
import 'core/storage/local_store.dart';
import 'features/auth/auth_repository.dart';
import 'features/auth/http_auth_api.dart';
import 'features/auth/resilient_session_store.dart';
import 'features/offline/offline_readiness.dart';
import 'features/sync/http_sync_api.dart';
import 'features/sync/http_sync_transport.dart';
import 'features/sync/sync_engine.dart';

/// Wraps a transport to remember the last PullResult — SyncEngine.runOnce
/// discards the pull result internally, but the app needs the missions.
class _RecordingTransport implements SyncTransport {
  final SyncTransport inner;
  PullResult? lastPull;
  _RecordingTransport(this.inner);

  @override
  Future<PushResult> push(List<SyncIntent> intents) => inner.push(intents);

  @override
  Future<PullResult> pull({String? cursor}) async {
    final result = await inner.pull(cursor: cursor);
    lastPull = result;
    return result;
  }
}

/// Application-wide state: auth, local store, missions, sync, readiness.
class AppState extends ChangeNotifier {
  static const _kServer = 'geoflow.server';
  static const _kDevice = 'geoflow.deviceId';
  static const defaultServer = 'http://127.0.0.1:3000';

  // wiring
  String serverUrl = defaultServer;
  late String deviceId;
  ResilientSessionStore? _sessionStore;
  HttpApiClient? _client;
  ProductionAuthRepository? _auth;
  HttpFieldSyncApi? _syncApi;
  _RecordingTransport? _transport;
  SyncEngine? _engine;

  // state
  bool bootstrapped = false;
  bool storeReady = false;
  String? lastError;
  bool syncing = false;
  String? syncMessage;
  String? sessionUserId;
  String? sessionDisplayName;
  List<Map<String, dynamic>> missions = const [];
  int pendingCount = 0;
  String? cursor;

  // ---- wiring helpers ----

  void _rebuildNetwork() {
    _client?.close();
    _client = HttpApiClient(
      baseUrl: serverUrl,
      tokenProvider: () async {
        final session = await _sessionStore?.read();
        return session?.accessToken;
      },
    );
    _auth = ProductionAuthRepository(
      store: _sessionStore!,
      api: HttpAuthApi(_client!),
    );
    _syncApi = HttpFieldSyncApi(_client!, deviceId: deviceId);
    _transport = _RecordingTransport(HttpSyncTransport(_syncApi!, deviceId: deviceId));
    _engine = SyncEngine(_transport!);
  }

  Future<void> setServerUrl(String url) async {
    final trimmed = url.trim().replaceAll(RegExp(r'/+$'), '');
    if (trimmed.isEmpty || trimmed == serverUrl) return;
    serverUrl = trimmed;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kServer, serverUrl);
    _rebuildNetwork();
    notifyListeners();
  }

  // ---- lifecycle ----

  Future<void> bootstrap() async {
    if (bootstrapped) return;
    final prefs = await SharedPreferences.getInstance();
    serverUrl = prefs.getString(_kServer) ?? defaultServer;
    final storedDevice = prefs.getString(_kDevice);
    if (storedDevice == null || storedDevice.isEmpty) {
      deviceId = const Uuid().v4();
      await prefs.setString(_kDevice, deviceId);
    } else {
      deviceId = storedDevice;
    }

    _sessionStore = ResilientSessionStore();
    _rebuildNetwork();

    try {
      final session = await _sessionStore!.read();
      if (session != null) {
        sessionUserId = session.userId;
        sessionDisplayName = session.displayName;
      }
    } catch (_) {}

    storeReady = true;
    bootstrapped = true;
    await _reloadLocal();
    notifyListeners();
  }

  bool get isSignedIn => sessionUserId != null && sessionUserId!.isNotEmpty;

  Future<void> signIn(String username, String password) async {
    lastError = null;
    notifyListeners();
    try {
      final session = await _auth!.signIn(username, password);
      sessionUserId = session.userId;
      sessionDisplayName = session.displayName;
      lastError = null;
      await refreshMissions();
    } catch (e) {
      lastError = e.toString().replaceFirst('Exception: ', '');
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth?.signOut();
    sessionUserId = null;
    sessionDisplayName = null;
    missions = const [];
    notifyListeners();
  }

  // ---- readiness ----

  OfflineReadinessReport get readiness {
    if (!storeReady) {
      return const OfflineReadinessReport(
        status: OfflineReadiness.checking,
        mapAvailable: false,
        formAvailable: false,
        storageHealthy: false,
        authCached: false,
        reason: 'جاري تهيئة التخزين المحلي',
      );
    }
    final authCached = isSignedIn;
    return OfflineReadinessReport(
      status: OfflineReadiness.ready,
      mapAvailable: true,
      formAvailable: true,
      storageHealthy: true,
      authCached: authCached,
      reason: authCached ? null : 'سجّل الدخول لبدء المهمة',
    );
  }

  bool get canStartMission => readiness.canStartMission;

  // ---- local data ----

  LocalStore? _local;

  Future<void> setLocalStore(LocalStore? store) async {
    _local = store;
    storeReady = store != null;
    await _reloadLocal();
    notifyListeners();
  }

  Future<void> _reloadLocal() async {
    final local = _local;
    if (local == null) return;
    missions = await local.list('missions');
    final outbox = await local.list('outbox');
    pendingCount = outbox.where((d) => (d['state'] ?? 'pending') != 'synced').length;
    final meta = await local.get('meta', 'cursor');
    cursor = meta?['value'] as String?;
  }

  // ---- missions / sync ----

  Future<void> refreshMissions() async {
    if (_engine == null) return;
    lastError = null;
    notifyListeners();
    try {
      await _syncNowLocked();
      lastError = null;
    } catch (e) {
      lastError = e.toString().replaceFirst('Exception: ', '');
    }
    await _reloadLocal();
    notifyListeners();
  }

  /// Create a mission locally; it flows out through the outbox on next sync.
  Future<void> createMission({
    required String name,
    required String projectId,
    String status = 'planned',
  }) async {
    if (_local == null) return;
    final id = const Uuid().v4();
    final now = DateTime.now().toUtc().toIso8601String();
    final payload = <String, dynamic>{
      'id': id,
      'projectId': projectId,
      'name': name,
      'status': status,
      'updatedAt': now,
      'createdAt': now,
    };
    await _local!.put('missions', id, payload);
    await _enqueueIntent(
      entityType: 'field_mission',
      entityId: id,
      operation: 'upsert',
      payload: payload,
    );
    await _reloadLocal();
    notifyListeners();
  }

  /// Record a capture (form answers) locally + sync intent.
  Future<void> saveCapture({
    required String missionId,
    required Map<String, dynamic> answers,
    double? latitude,
    double? longitude,
    double? accuracy,
  }) async {
    if (_local == null) return;
    final id = const Uuid().v4();
    final now = DateTime.now().toUtc().toIso8601String();
    final payload = <String, dynamic>{
      'id': id,
      'missionId': missionId,
      'answers': answers,
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'capturedAt': now,
      'deviceId': deviceId,
    };
    await _local!.put('captures', id, payload);
    await _enqueueIntent(
      entityType: 'field_capture',
      entityId: id,
      operation: 'upsert',
      payload: payload,
    );
    await _reloadLocal();
    notifyListeners();
  }

  Future<void> _enqueueIntent({
    required String entityType,
    required String entityId,
    required String operation,
    Map<String, dynamic> payload = const {},
    int? baseVersion,
  }) async {
    final opId = const Uuid().v4();
    await _local!.put('outbox', opId, {
      'clientOperationId': opId,
      'entityType': entityType,
      'entityId': entityId,
      'operation': operation,
      'baseVersion': baseVersion,
      'payload': payload,
      'state': 'pending',
      'createdAt': DateTime.now().toUtc().toIso8601String(),
    });
  }

  Future<void> syncNow() async {
    if (_engine == null || syncing) return;
    syncing = true;
    syncMessage = null;
    notifyListeners();
    try {
      await _syncNowLocked();
      syncMessage = 'اكتملت المزامنة';
    } catch (e) {
      lastError = e.toString().replaceFirst('Exception: ', '');
      syncMessage = 'فشلت المزامنة';
    }
    syncing = false;
    await _reloadLocal();
    notifyListeners();
  }

  Future<void> _syncNowLocked() async {
    final outbox = await _local!.list('outbox');
    final pendingDocs = outbox.where((d) => (d['state'] ?? 'pending') != 'synced').toList();
    final intents = <SyncIntent>[
      for (final d in pendingDocs)
        SyncIntent(
          clientOperationId: (d['clientOperationId'] ?? d['id'] ?? '') as String,
          entityType: (d['entityType'] ?? '') as String,
          entityId: (d['entityId'] ?? '') as String,
          operation: (d['operation'] ?? 'upsert') as String,
          baseVersion: d['baseVersion'] as int?,
          payload: (d['payload'] as Map?)?.cast<String, dynamic>() ?? const {},
        ),
    ];

    final result = await _engine!.runOnce(intents, cursor: cursor);

    // Push bookkeeping (only the intents we actually sent this round).
    if (result != null) {
      final ack = result.acknowledged.toSet();
      final conflict = result.conflicts.toSet();
      for (final d in pendingDocs) {
        final id = (d['clientOperationId'] ?? '') as String;
        if (ack.contains(id)) {
          await _local!.put('outbox', id, {...d, 'state': 'synced'});
        } else if (conflict.contains(id)) {
          await _local!.put('outbox', id, {...d, 'state': 'conflict'});
        }
      }
    }

    // Pull bookkeeping: apply missions + advance cursor.
    final pull = _transport?.lastPull;
    if (pull != null) {
      for (final change in pull.changes) {
        final id = change['id']?.toString();
        if (id == null || id.isEmpty) continue;
        final existing = await _local!.get('missions', id);
        await _local!.put('missions', id, {...?existing, ...change});
      }
      if (pull.cursor != null && pull.cursor != cursor) {
        cursor = pull.cursor;
        await _local!.put('meta', 'cursor', {'value': cursor});
      }
    }
  }
}

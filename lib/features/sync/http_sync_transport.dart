import '../../core/field_contracts.dart';
import '../sync/sync_api.dart';
import 'sync_engine.dart';

/// SyncTransport adapter over the REST sync endpoints.
/// - push: routes each result status -> acknowledged (applied/already_applied),
///   conflicts (conflict), failed (anything else / thrown).
/// - pull: returns missions under `changes`; on error keeps previous cursor (empty changes).
class HttpSyncTransport implements SyncTransport {
  final FieldSyncApi api;
  final String deviceId;

  HttpSyncTransport(this.api, {required this.deviceId});

  @override
  Future<PushResult> push(List<SyncIntent> intents) async {
    try {
      final body = await api.push(deviceId: deviceId, intents: intents);
      final acknowledged = <String>[];
      final conflicts = <String>[];
      final failed = <String>[];
      final seen = <String>{};
      final results = body['results'];
      if (results is List) {
        for (final item in results) {
          if (item is! Map) continue;
          final id = (item['clientOperationId'] ?? '') as String;
          if (id.isEmpty) continue;
          seen.add(id);
          final status = (item['status'] ?? '') as String;
          switch (status) {
            case 'applied':
            case 'already_applied':
              acknowledged.add(id);
            case 'conflict':
              conflicts.add(id);
            default:
              failed.add(id);
          }
        }
      }
      for (final intent in intents) {
        if (seen.contains(intent.clientOperationId)) continue;
        failed.add(intent.clientOperationId);
      }
      return PushResult(acknowledged: acknowledged, conflicts: conflicts, failed: failed);
    } catch (_) {
      return PushResult(failed: [for (final i in intents) i.clientOperationId]);
    }
  }

  @override
  Future<PullResult> pull({String? cursor}) async {
    try {
      final body = await api.pull(cursor: cursor);
      final changes = <Map<String, dynamic>>[];
      final missions = body['missions'];
      if (missions is List) {
        for (final m in missions) {
          if (m is Map<String, dynamic>) changes.add(m);
        }
      }
      final newCursor = body['cursor']?.toString();
      return PullResult(cursor: newCursor ?? cursor, changes: changes);
    } catch (_) {
      return PullResult(cursor: cursor, changes: const []);
    }
  }
}

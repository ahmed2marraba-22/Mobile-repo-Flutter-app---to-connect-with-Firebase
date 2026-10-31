import '../../core/field_contracts.dart';

/// Transport-only adapter. Retry, cursor persistence and conflict policy remain
/// owned by SyncEngine/DurableSyncStore rather than field features.
abstract interface class FieldSyncApi {
  Future<Map<String, dynamic>> push({required String deviceId, required List<SyncIntent> intents});
  Future<Map<String, dynamic>> pull({String? cursor});
}

class SyncIntentJson {
  static Map<String, dynamic> encode(SyncIntent intent) => {
    'clientOperationId': intent.clientOperationId,
    'entityType': intent.entityType,
    'entityId': intent.entityId,
    'operation': intent.operation,
    'baseVersion': intent.baseVersion,
    'payload': intent.payload,
  };
}

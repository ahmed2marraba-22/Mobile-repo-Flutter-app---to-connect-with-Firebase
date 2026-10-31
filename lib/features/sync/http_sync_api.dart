import '../../core/field_contracts.dart';
import '../../core/network/api_client.dart';
import 'sync_api.dart';

/// FieldSyncApi implementation against `/api/v1/sync/push` and `/api/v1/sync/pull`.
class HttpFieldSyncApi implements FieldSyncApi {
  final AuthenticatedApiClient client;
  final String deviceId;
  HttpFieldSyncApi(this.client, {required this.deviceId});

  @override
  Future<Map<String, dynamic>> push({
    required String deviceId,
    required List<SyncIntent> intents,
  }) async {
    final res = await client.post(
      '/api/v1/sync/push',
      body: {
        'intents': [
          for (final intent in intents)
            {
              ...SyncIntentJson.encode(intent),
              'deviceId': deviceId,
            },
        ],
      },
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('sync push failed (${res.statusCode}): ${res.body['error'] ?? ''}');
    }
    return res.body;
  }

  @override
  Future<Map<String, dynamic>> pull({String? cursor}) async {
    final q = cursor == null || cursor.isEmpty ? '' : '?cursor=$cursor';
    final res = await client.get('/api/v1/sync/pull$q');
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('sync pull failed (${res.statusCode}): ${res.body['error'] ?? ''}');
    }
    return res.body;
  }
}

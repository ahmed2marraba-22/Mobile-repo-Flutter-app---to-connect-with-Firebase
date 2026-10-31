import '../../core/field_contracts.dart';

abstract interface class SyncTransport {
  Future<PushResult> push(List<SyncIntent> intents);
  Future<PullResult> pull({String? cursor});
}

class PushResult {
  final List<String> acknowledged;
  final List<String> conflicts;
  final List<String> failed;
  const PushResult({this.acknowledged = const [], this.conflicts = const [], this.failed = const []});
}

class PullResult {
  final String? cursor;
  final List<Map<String, dynamic>> changes;
  const PullResult({this.cursor, this.changes = const []});
}

class SyncEngine {
  final SyncTransport transport;
  bool _running = false;
  SyncEngine(this.transport);

  bool get isRunning => _running;

  Future<PushResult?> runOnce(List<SyncIntent> intents, {String? cursor}) async {
    if (_running) return null;
    _running = true;
    try {
      PushResult? pushResult;
      if (intents.isNotEmpty) pushResult = await transport.push(intents);
      await transport.pull(cursor: cursor);
      return pushResult;
    } finally {
      _running = false;
    }
  }
}

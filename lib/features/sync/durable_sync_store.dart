import 'package:drift/drift.dart';
import '../../core/storage/field_database.dart';

class DurableSyncStore {
  final FieldDatabase db;
  DurableSyncStore(this.db);

  Future<void> enqueue(SyncOutboxCompanion item) =>
      db.into(db.syncOutbox).insertOnConflictUpdate(item);

  Future<List<SyncOutboxData>> pending({int limit = 50}) =>
      db.pendingOutbox(limit: limit);

  Future<void> markSyncing(String id) => (db.update(db.syncOutbox)..where((t) => t.clientOperationId.equals(id)))
      .write(const SyncOutboxCompanion(state: Value('syncing')));

  Future<void> markSynced(String id) => (db.update(db.syncOutbox)..where((t) => t.clientOperationId.equals(id)))
      .write(const SyncOutboxCompanion(state: Value('synced')));

  Future<void> markConflict(String id, String message) => (db.update(db.syncOutbox)..where((t) => t.clientOperationId.equals(id)))
      .write(SyncOutboxCompanion(state: const Value('conflict'), lastError: Value(message)));

  Future<void> saveCursor(String scope, String? cursor, DateTime? watermark) =>
      db.into(db.syncCheckpoints).insertOnConflictUpdate(SyncCheckpointsCompanion.insert(
        scope: scope,
        cursor: Value(cursor),
        serverWatermark: Value(watermark),
        updatedAt: DateTime.now(),
      ));
}

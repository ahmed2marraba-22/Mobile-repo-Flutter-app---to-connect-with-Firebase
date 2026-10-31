import 'dart:convert';
import 'package:drift/drift.dart';

part 'field_database.g.dart';

class LocalMissions extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get status => text()();
  IntColumn get revision => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

class FormDrafts extends Table {
  TextColumn get captureId => text()();
  TextColumn get formId => text()();
  IntColumn get formVersion => integer()();
  TextColumn get status => text()();
  TextColumn get answersJson => text()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {captureId};
}

class SyncOutbox extends Table {
  TextColumn get clientOperationId => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get operation => text()();
  IntColumn get baseVersion => integer().nullable()();
  TextColumn get payloadJson => text()();
  TextColumn get state => text().withDefault(const Constant('pending'))();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime().nullable()();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {clientOperationId};
}

class SyncCheckpoints extends Table {
  TextColumn get scope => text()();
  TextColumn get cursor => text().nullable()();
  DateTimeColumn get serverWatermark => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {scope};
}

class AttachmentQueue extends Table {
  TextColumn get id => text()();
  TextColumn get localPath => text()();
  TextColumn get sha256 => text()();
  IntColumn get sizeBytes => integer()();
  TextColumn get mimeType => text()();
  TextColumn get state => text().withDefault(const Constant('pending'))();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

class LocalDocuments extends Table {
  TextColumn get collection => text()();
  TextColumn get id => text()();
  TextColumn get valueJson => text()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {collection, id};
}

@DriftDatabase(tables: [LocalMissions, FormDrafts, SyncOutbox, SyncCheckpoints, AttachmentQueue, LocalDocuments])
class FieldDatabase extends _$FieldDatabase {
  FieldDatabase(super.e);
  @override
  int get schemaVersion => 1;

  Future<void> saveMissionAndIntent({
    required LocalMissionsCompanion mission,
    required SyncOutboxCompanion intent,
  }) async {
    await transaction(() async {
      await into(localMissions).insertOnConflictUpdate(mission);
      await into(syncOutbox).insertOnConflictUpdate(intent);
    });
  }

  Future<void> saveDraft(FormDraftsCompanion draft) =>
      into(formDrafts).insertOnConflictUpdate(draft);

  Future<List<SyncOutboxData>> pendingOutbox({int limit = 50}) =>
      (select(syncOutbox)
            ..where((t) => t.state.equals('pending'))
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
            ..limit(limit))
          .get();

  static String encodePayload(Map<String, dynamic> payload) => jsonEncode(payload);
}

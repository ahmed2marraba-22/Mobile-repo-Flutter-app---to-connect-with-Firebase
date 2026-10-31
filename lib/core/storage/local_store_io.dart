import 'dart:convert';

import 'package:drift/drift.dart';

import '../../core/storage/database_factory.dart';
import '../../core/storage/field_database.dart';
import '../../core/storage/local_store.dart';

/// Drift/SQLite LocalStore adapter over the LocalDocuments KV table.
/// One row per (collection, id), value stored as JSON text.
class DriftLocalStore implements LocalStore {
  final FieldDatabase db;
  DriftLocalStore(this.db);

  @override
  Future<void> transaction(Future<void> Function() action) => db.transaction(action);

  @override
  Future<void> put(String collection, String id, Map<String, dynamic> value) async {
    await db.into(db.localDocuments).insertOnConflictUpdate(
          LocalDocumentsCompanion.insert(
            collection: collection,
            id: id,
            valueJson: jsonEncode(value),
            updatedAt: DateTime.now(),
          ),
        );
  }

  @override
  Future<Map<String, dynamic>?> get(String collection, String id) async {
    final row = await (db.select(db.localDocuments)
          ..where((t) => t.collection.equals(collection) & t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    try {
      return jsonDecode(row.valueJson) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> list(String collection) async {
    final rows = await (db.select(db.localDocuments)
          ..where((t) => t.collection.equals(collection))
          ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
        .get();
    final out = <Map<String, dynamic>>[];
    for (final row in rows) {
      try {
        out.add(jsonDecode(row.valueJson) as Map<String, dynamic>);
      } catch (_) {}
    }
    return out;
  }

  @override
  Future<void> delete(String collection, String id) async {
    await (db.delete(db.localDocuments)
          ..where((t) => t.collection.equals(collection) & t.id.equals(id)))
        .go();
  }
}

Future<LocalStore> openLocalStore() async => DriftLocalStore(await openFieldDatabase());

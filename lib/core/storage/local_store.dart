abstract interface class LocalStore {
  Future<void> transaction(Future<void> Function() action);
  Future<void> put(String collection, String id, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> get(String collection, String id);
  Future<List<Map<String, dynamic>>> list(String collection);
  Future<void> delete(String collection, String id);
}

/// Production adapter target: Drift/SQLite. This boundary keeps features offline-first
/// and prevents individual features from owning database implementation details.

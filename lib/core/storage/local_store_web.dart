import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/storage/local_store.dart';

/// Web-safe LocalStore adapter (localStorage via shared_preferences).
/// Every stored document is one JSON string keyed by `<prefix><collection>/<id>`.
class PrefsLocalStore implements LocalStore {
  static const _prefix = 'geoflow.doc.';

  @override
  Future<void> transaction(Future<void> Function() action) => action();

  @override
  Future<void> put(String collection, String id, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_prefix$collection/$id', jsonEncode(value));
  }

  @override
  Future<Map<String, dynamic>?> get(String collection, String id) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('$_prefix$collection/$id');
    if (raw == null) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> list(String collection) async {
    final prefs = await SharedPreferences.getInstance();
    final head = '$_prefix$collection/';
    final out = <Map<String, dynamic>>[];
    for (final key in prefs.getKeys()) {
      if (!key.startsWith(head)) continue;
      final raw = prefs.getString(key);
      if (raw == null) continue;
      try {
        out.add(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {}
    }
    return out;
  }

  @override
  Future<void> delete(String collection, String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_prefix$collection/$id');
  }
}

Future<LocalStore> openLocalStore() async => PrefsLocalStore();

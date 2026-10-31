import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/auth/auth_session.dart';
import 'auth_repository.dart';

/// Persists the AuthSession JSON.
/// Primary store: flutter_secure_storage (desktop/mobile, libsecret/keychain/DPAPI).
/// Fallback: shared_preferences (web — secure storage is unavailable there).
class ResilientSessionStore implements AuthSessionStore {
  static const _key = 'geoflow.auth.session';
  final FlutterSecureStorage _secure;

  ResilientSessionStore({FlutterSecureStorage? secure})
      : _secure = secure ?? const FlutterSecureStorage();

  @override
  Future<void> write(AuthSession session) async {
    final raw = jsonEncode({
      'access_token': session.accessToken,
      'refresh_token': session.refreshToken,
      'user_id': session.userId,
      'display_name': session.displayName,
      'expires_at': session.expiresAt.toIso8601String(),
    });
    try {
      await _secure.write(key: _key, value: raw);
      return;
    } catch (_) {
      // fall through to prefs (web / missing plugin)
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, raw);
    } catch (_) {}
  }

  @override
  Future<AuthSession?> read() async {
    String? raw;
    try {
      raw = await _secure.read(key: _key);
    } catch (_) {
      raw = null;
    }
    if (raw == null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        raw = prefs.getString(_key);
      } catch (_) {
        raw = null;
      }
    }
    if (raw == null) return null;
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      final token = json['access_token'] as String?;
      if (token == null || token.isEmpty) return null;
      final expiresAtRaw = json['expires_at'] as String?;
      return AuthSession(
        accessToken: token,
        refreshToken: (json['refresh_token'] as String?) ?? '',
        userId: (json['user_id'] as String?) ?? '',
        displayName: (json['display_name'] as String?) ?? '',
        expiresAt: expiresAtRaw == null
            ? DateTime.now().add(const Duration(hours: 24))
            : (DateTime.tryParse(expiresAtRaw) ?? DateTime.now().add(const Duration(hours: 24))),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _secure.delete(key: _key);
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (_) {}
  }
}

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/auth/auth_session.dart';

class SecureSessionStore implements AuthRepository {
  static const _key = 'geoflow.auth.session';
  final FlutterSecureStorage storage;
  final Future<AuthSession> Function(String, String)? signInHandler;
  final Future<AuthSession> Function(AuthSession)? refreshHandler;

  SecureSessionStore({
    this.storage = const FlutterSecureStorage(),
    this.signInHandler,
    this.refreshHandler,
  });

  @override
  Future<AuthSession?> restore() async {
    final raw = await storage.read(key: _key);
    if (raw == null) return null;
    final m = jsonDecode(raw) as Map<String, dynamic>;
    return AuthSession(
      accessToken: m['accessToken'] as String,
      refreshToken: m['refreshToken'] as String,
      expiresAt: DateTime.parse(m['expiresAt'] as String),
      userId: m['userId'] as String,
      displayName: m['displayName'] as String,
    );
  }

  Future<void> save(AuthSession session) async {
    await storage.write(key: _key, value: jsonEncode({
      'accessToken': session.accessToken,
      'refreshToken': session.refreshToken,
      'expiresAt': session.expiresAt.toIso8601String(),
      'userId': session.userId,
      'displayName': session.displayName,
    }));
  }

  @override
  Future<AuthSession> signIn(String username, String password) async {
    if (signInHandler == null) throw StateError('No sign-in handler configured');
    final session = await signInHandler!(username, password);
    await save(session);
    return session;
  }

  @override
  Future<AuthSession> refresh(AuthSession session) async {
    if (refreshHandler == null) throw StateError('No refresh handler configured');
    final refreshed = await refreshHandler!(session);
    await save(refreshed);
    return refreshed;
  }

  @override
  Future<void> signOut() => storage.delete(key: _key);
}

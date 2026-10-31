import '../../core/auth/auth_session.dart';

abstract interface class AuthSessionStore {
  Future<AuthSession?> read();
  Future<void> write(AuthSession session);
  Future<void> clear();
}

abstract interface class AuthApi {
  Future<AuthSession> login(String username, String password);
  Future<AuthSession> refresh(String refreshToken);
}

class ProductionAuthRepository implements AuthRepository {
  final AuthSessionStore store;
  final AuthApi api;
  ProductionAuthRepository({required this.store, required this.api});

  @override
  Future<AuthSession?> restore() => store.read();

  @override
  Future<AuthSession> signIn(String username, String password) async {
    final session = await api.login(username, password);
    await store.write(session);
    return session;
  }

  @override
  Future<AuthSession> refresh(AuthSession session) async {
    final next = await api.refresh(session.refreshToken);
    await store.write(next);
    return next;
  }

  @override
  Future<void> signOut() => store.clear();
}

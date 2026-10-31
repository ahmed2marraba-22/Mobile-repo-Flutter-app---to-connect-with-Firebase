class AuthSession {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;
  final String userId;
  final String displayName;
  const AuthSession({required this.accessToken, required this.refreshToken, required this.expiresAt, required this.userId, required this.displayName});

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

abstract interface class AuthRepository {
  Future<AuthSession?> restore();
  Future<AuthSession> signIn(String username, String password);
  Future<AuthSession> refresh(AuthSession session);
  Future<void> signOut();
}

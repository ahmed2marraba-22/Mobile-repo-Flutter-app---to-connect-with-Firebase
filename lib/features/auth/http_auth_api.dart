import '../../core/auth/auth_session.dart';
import '../../core/network/api_client.dart';
import 'auth_repository.dart';

/// AuthApi implementation against `/api/v1/auth/*`.
/// Accepts both contract shapes: `access_token` (field contract) and `token` (web contract).
class HttpAuthApi implements AuthApi {
  final AuthenticatedApiClient client;
  HttpAuthApi(this.client);

  AuthSession _parse(Map<String, dynamic> json) {
    final token = (json['access_token'] ?? json['token']) as String?;
    if (token == null || token.isEmpty) {
      throw const FormatException('missing token in auth response');
    }
    final expiresAtRaw = json['expires_at'] as String?;
    final expiresAt = (expiresAtRaw == null ? null : DateTime.tryParse(expiresAtRaw)) ??
        DateTime.now().add(const Duration(hours: 24));
    final userId = (json['user_id'] ?? json['userId'] ?? json['id'])?.toString() ?? '';
    return AuthSession(
      accessToken: token,
      refreshToken: (json['refresh_token'] as String?) ?? '',
      userId: userId,
      displayName: (json['display_name'] as String?) ?? '',
      expiresAt: expiresAt,
    );
  }

  @override
  Future<AuthSession> login(String username, String password) async {
    final res = await client.post(
      '/api/v1/auth/login',
      body: {'username': username, 'password': password},
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      final error = res.body['error'] ?? res.body['message'] ?? 'login failed (${res.statusCode})';
      throw Exception(error.toString());
    }
    return _parse(res.body);
  }

  @override
  Future<AuthSession> refresh(String refreshToken) async {
    final res = await client.post(
      '/api/v1/auth/refresh',
      body: {'refresh_token': refreshToken},
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('refresh failed (${res.statusCode})');
    }
    return _parse(res.body);
  }
}

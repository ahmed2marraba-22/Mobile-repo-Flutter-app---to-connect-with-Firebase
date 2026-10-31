class ApiResponse {
  final int statusCode;
  final Map<String, dynamic> body;
  const ApiResponse(this.statusCode, this.body);
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

abstract interface class ApiClient {
  Future<ApiResponse> get(String path, {Map<String, String> headers = const {}});
  Future<ApiResponse> post(String path, {Map<String, dynamic> body = const {}, Map<String, String> headers = const {}});
}

/// Transport-agnostic authenticated client boundary. Concrete HTTP is supplied
/// by the Flutter runtime; retries/cursor/conflict policy remain Sync Engine concerns.
abstract interface class AuthenticatedApiClient implements ApiClient {
  Future<ApiResponse> postAuthenticated(String path, {Map<String, dynamic> body = const {}});
}

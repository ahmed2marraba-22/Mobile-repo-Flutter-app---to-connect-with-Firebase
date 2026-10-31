import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_client.dart';

/// Concrete HTTP transport for the platform REST API.
/// Bearer token is resolved lazily per request so refreshed sessions apply immediately.
class HttpApiClient implements AuthenticatedApiClient {
  final String baseUrl;
  final Future<String?> Function()? tokenProvider;
  final http.Client _client;

  HttpApiClient({
    required this.baseUrl,
    this.tokenProvider,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Uri _uri(String path) {
    final base = baseUrl.replaceAll(RegExp(r'/+$'), '');
    return Uri.parse(base + (path.startsWith('/') ? path : '/$path'));
  }

  Future<Map<String, String>> _headers(Map<String, String> extra) async {
    final headers = <String, String>{'content-type': 'application/json', ...extra};
    final token = tokenProvider == null ? null : await tokenProvider!();
    if (token != null && token.isNotEmpty) {
      headers['authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Map<String, dynamic> _decode(String raw) {
    if (raw.isEmpty) return <String, dynamic>{};
    try {
      final value = jsonDecode(raw);
      if (value is Map<String, dynamic>) return value;
      return <String, dynamic>{'data': value};
    } catch (_) {
      return <String, dynamic>{'raw': raw};
    }
  }

  @override
  Future<ApiResponse> get(String path, {Map<String, String> headers = const {}}) async {
    final res = await _client.get(_uri(path), headers: await _headers(headers));
    return ApiResponse(res.statusCode, _decode(res.body));
  }

  @override
  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
  }) async {
    final res = await _client.post(
      _uri(path),
      headers: await _headers(headers),
      body: jsonEncode(body),
    );
    return ApiResponse(res.statusCode, _decode(res.body));
  }

  @override
  Future<ApiResponse> postAuthenticated(String path, {Map<String, dynamic> body = const {}}) =>
      post(path, body: body);

  void close() => _client.close();
}

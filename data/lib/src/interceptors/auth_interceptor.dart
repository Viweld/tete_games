part of 'interceptors.dart';

/// Interceptor that handles authentication:
/// - Adds Bearer token to outgoing requests
/// - Handles 401 responses with token refresh and request retry
///
/// Uses [QueuedInterceptor] to automatically queue requests
/// when token refresh is in progress.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({required AuthSessionManager sessionManager, required String baseUrl})
    : _sessionManager = sessionManager,
      _baseUrl = baseUrl;

  final AuthSessionManager _sessionManager;
  final String _baseUrl;

  /// Endpoints that should not trigger token refresh on 401.
  static const List<String> _noRefreshEndpoints = <String>[
    '/auth/refresh',
    '/auth/send-code',
    '/auth/verify-code',
  ];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = _sessionManager.accessToken;

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only handle 401 Unauthorized
    if (err.response?.statusCode != 401) {
      return handler.reject(err);
    }

    log('401 Unauthorized received for ${err.requestOptions.path}', name: 'AuthInterceptor');

    // Don't refresh for auth endpoints (avoid infinite loop)
    final String path = err.requestOptions.path;
    if (_noRefreshEndpoints.any(path.contains)) {
      log('Skipping refresh for auth endpoint: $path', name: 'AuthInterceptor');
      return handler.reject(err);
    }

    // Check if token has already been refreshed by another request
    final String? currentAccessToken = _sessionManager.accessToken;
    final String? failedRequestToken = err.requestOptions.headers['Authorization']
        ?.toString()
        .replaceAll('Bearer ', '');

    bool isTokenRefreshed = false;

    if (currentAccessToken != null &&
        currentAccessToken.isNotEmpty &&
        currentAccessToken != failedRequestToken) {
      log('Token already refreshed by another request', name: 'AuthInterceptor');
      isTokenRefreshed = true;
    } else {
      // Attempt to refresh tokens
      log('Attempting to refresh token...', name: 'AuthInterceptor');
      isTokenRefreshed = await _sessionManager.refreshTokensWithRetry();
    }

    if (!isTokenRefreshed) {
      log('Token refresh failed. Logging out.', name: 'AuthInterceptor');
      // Refresh failed - logout and reject the request
      await _sessionManager.logout();
      return handler.reject(err);
    }

    // Retry the original request with new token
    try {
      log('Retrying request with new token...', name: 'AuthInterceptor');
      final RequestOptions requestOptions = err.requestOptions;
      final String? newAccessToken = _sessionManager.accessToken;

      if (newAccessToken != null) {
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      }

      // Create a new Dio instance for retry to ensure clean state
      // IMPORTANT: Must copy baseUrl and other necessary options
      final Dio retryDio = Dio();
      final String retryBase = err.requestOptions.baseUrl.isNotEmpty
          ? err.requestOptions.baseUrl
          : _baseUrl;
      retryDio.options.baseUrl = retryBase;
      retryDio.options.headers.addAll(requestOptions.headers);

      // Add logger for better debugging of retry requests
      retryDio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          maxWidth: 120,
          compact: false,
          logPrint: (Object object) => log(object.toString(), name: 'NetworkRetry'),
        ),
      );

      final Response<dynamic> response = await retryDio.fetch(requestOptions);
      return handler.resolve(response);
    } catch (e) {
      log('Retry failed: $e', name: 'AuthInterceptor');
      if (e is DioException) {
        handler.reject(e);
      } else {
        // Create a generic DioException if strictly required or just let it bubble if handler accepts generic errors
        // But typically handler.reject expects DioException.
        handler.reject(DioException(requestOptions: err.requestOptions, error: e));
      }
    }
  }
}

/// Base sealed exception for all API-layer errors.
/// Does not contain any data — data is carried by concrete subtypes.
sealed class ApiException implements Exception {}

/// Server-side error (5xx).
class ServerException extends ApiException {
  final ServerExceptionType type;

  ServerException({required this.type});

  @override
  String toString() => 'ServerException($type)';
}

/// Categorizes common 5xx server errors.
enum ServerExceptionType {
  /// 500 Internal Server Error
  internalError,

  /// 502 Bad Gateway
  badGateway,

  /// 503 Service Unavailable
  serviceUnavailable,

  /// 504 Gateway Timeout
  gatewayTimeout,

  /// Any other 5xx
  unknown,
}

/// Network error: no internet, connection timeout, etc. Carries no extra data.
class NetworkException extends ApiException {
  @override
  String toString() => 'NetworkException()';
}

/// All other HTTP errors (400, 406, 429, etc.).
/// Repositories inspect [statusCode] and [body] to throw domain-specific exceptions.
class OtherException extends ApiException {
  final int statusCode;
  final dynamic body;
  final String? code;
  final String? message;
  final String? userMessage;

  OtherException({required this.statusCode, this.body})
    : code = _extractString(body, 'code'),
      message = _extractString(body, 'message'),
      userMessage = _extractString(body, 'user_message');

  static String? _extractString(dynamic parsedBody, String key) {
    if (parsedBody is Map) {
      final dynamic error = parsedBody['error'];
      if (error is Map) {
        final dynamic value = error[key];
        return value?.toString();
      }
    }
    return null;
  }

  @override
  String toString() =>
      'OtherException(statusCode: $statusCode, code: $code, message: $message, userMessage: $userMessage, body: $body)';
}

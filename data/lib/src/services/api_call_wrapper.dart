import 'dart:developer';

import 'package:core/core.dart';
import 'package:dio/dio.dart';

@lazySingleton
class ApiCallWrapper {
  /// Wraps any API call, unwrapping [DioException] into a typed [ApiException].
  ///
  /// - 5xx → [ServerException]
  /// - No response (timeout / no internet) → [NetworkException]
  /// - All other (400, 406, 429 …) → [OtherException]
  ///
  /// Repositories catch [OtherException] to map into domain-specific exceptions.
  Future<T> call<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final dynamic body = e.response?.data;

      // Server errors (5xx)
      if (statusCode >= 500) {
        log(
          'ApiCallWrapper: Server error $statusCode for ${e.requestOptions.path}',
          name: 'ApiCallWrapper',
        );
        throw ServerException(type: _mapServerStatus(statusCode));
      }

      // No response — network/connectivity error
      if (e.response == null) {
        log('ApiCallWrapper: Network error ${e.type} — ${e.message}', name: 'ApiCallWrapper');
        throw NetworkException();
      }

      // Everything else (400, 406, 429, etc.)
      log(
        'ApiCallWrapper: Client error $statusCode for ${e.requestOptions.path}. Body: $body',
        name: 'ApiCallWrapper',
      );
      throw OtherException(statusCode: statusCode, body: body);
    }
  }

  ServerExceptionType _mapServerStatus(int code) => switch (code) {
    500 => ServerExceptionType.internalError,
    502 => ServerExceptionType.badGateway,
    503 => ServerExceptionType.serviceUnavailable,
    504 => ServerExceptionType.gatewayTimeout,
    _ => ServerExceptionType.unknown,
  };
}

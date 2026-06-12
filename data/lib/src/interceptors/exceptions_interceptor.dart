part of 'interceptors.dart';

class ExceptionsInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type != DioExceptionType.badResponse) {
      log(
        'ExceptionsInterceptor: Unhandled exception type ${err.type} for ${err.requestOptions.path}',
        name: 'NetworkException',
      );
      log('ExceptionsInterceptor: Message: ${err.message}', name: 'NetworkException');
    }
    return handler.reject(err);
  }
}

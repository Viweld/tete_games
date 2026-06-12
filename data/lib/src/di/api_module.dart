import 'dart:developer';

import 'package:core/core.dart';
import 'package:data/src/interceptors/currency_interceptor.dart' show CurrencyInterceptor;
import 'package:data/src/interceptors/interceptors.dart' show AuthInterceptor;
import 'package:data/src/interceptors/locale_interceptor.dart' show LocaleInterceptor;
import 'package:data/src/providers/api/api_provider.dart';
import 'package:data/src/services/auth_session_manager.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  static const String _networkKey = 'Network';

  @Named('BaseUrl')
  @singleton
  String baseUrl(AppConfig config) {
    if (config.runtimeMode == AppRuntimeMode.test) {
      return AppConstants.runtimeTestApiBaseUrl;
    }
    return dotenv.env['BASE_URL'] ?? '';
  }

  @Named('Headers')
  @singleton
  Map<String, dynamic> get headers => <String, dynamic>{
    'Content-Type': 'application/json',
    'x-api-key': dotenv.env['API_KEY'],
  };

  /// Dio for auth endpoints only (send-code, verify-code, refresh).
  ///
  /// Includes locale propagation, but excludes [AuthInterceptor] to avoid
  /// token/refresh recursion in the auth flow.
  @Named('AuthDio')
  @singleton
  Dio authDio(
    @Named('BaseUrl') String baseUrl,
    @Named('Headers') Map<String, dynamic> headers,
    LocaleController localeController,
    CurrencyController currencyController,
  ) {
    final Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.headers.addAll(headers);
    dio.interceptors.add(LocaleInterceptor(localeController: localeController));
    dio.interceptors.add(CurrencyInterceptor(currencyController: currencyController));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        maxWidth: 120,
        compact: false,
        logPrint: (Object object) => log(object.toString(), name: _networkKey),
      ),
    );
    return dio;
  }

  /// Main ApiProvider with AuthInterceptor for authenticated requests.
  @injectable
  ApiProvider apiProvider(
    @Named('BaseUrl') String baseUrl,
    @Named('Headers') Map<String, dynamic> headers,
    AuthSessionManager authSessionManager,
    LocaleController localeController,
    CurrencyController currencyController,
  ) => ApiProvider(
    dio: Dio(),
    baseUrl: baseUrl,
    headers: headers,
    authSessionManager: authSessionManager,
    localeController: localeController,
    currencyController: currencyController,
  );

  /// Main Dio instance with AuthInterceptor for all authenticated API calls.
  @singleton
  Dio dio(ApiProvider apiProvider) => apiProvider.provider;
}

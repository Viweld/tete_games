import 'dart:developer';

import 'package:core/core.dart';
import 'package:data/src/interceptors/currency_interceptor.dart';
import 'package:data/src/interceptors/interceptors.dart';
import 'package:data/src/interceptors/locale_interceptor.dart';
import 'package:data/src/services/auth_session_manager.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final Dio _dio;
  static const String _networkKey = 'Network';

  ApiProvider({
    required String baseUrl,
    required Dio dio,
    required Map<String, dynamic> headers,
    required AuthSessionManager authSessionManager,
    required LocaleController localeController,
    required CurrencyController currencyController,
  }) : _dio = dio {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers.addAll(headers);

    _dio.interceptors.addAll(<Interceptor>[
      LocaleInterceptor(sessionManager: authSessionManager, localeController: localeController),
      CurrencyInterceptor(
        sessionManager: authSessionManager,
        currencyController: currencyController,
      ),
      AuthInterceptor(sessionManager: authSessionManager, baseUrl: baseUrl),
      ExceptionsInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        maxWidth: 120,
        compact: false,
        logPrint: (Object object) => log(object.toString(), name: _networkKey),
      ),
    ]);
  }

  Dio get provider => _dio;
}

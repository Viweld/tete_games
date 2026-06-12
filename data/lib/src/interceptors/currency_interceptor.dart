import 'package:core/core.dart';
import 'package:data/src/services/auth_session_manager.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

/// Adds a `currency` query parameter to unauthenticated requests.
///
/// When the user is not authenticated, the backend cannot determine the user's
/// preferred currency from the profile, so we pass the current app currency
/// explicitly (e.g. `currency=USD`). Once authenticated, the parameter is omitted —
/// the backend reads the currency from the user's stored profile data.
///
/// This class is NOT registered in GetIt — it is created inline in `ApiProvider`.
class CurrencyInterceptor extends Interceptor {
  final AuthSessionManager? _sessionManager;
  final CurrencyController _currencyController;

  CurrencyInterceptor({
    AuthSessionManager? sessionManager,
    required CurrencyController currencyController,
  }) : _sessionManager = sessionManager,
       _currencyController = currencyController;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final AuthSessionManager? sessionManager = _sessionManager;
    final bool shouldAttachCurrency =
        sessionManager == null || sessionManager.authState is NotAuthenticated;
    if (shouldAttachCurrency && !options.queryParameters.containsKey('currency')) {
      options.queryParameters['currency'] = _currencyController.currencyCode;
    }
    handler.next(options);
  }
}

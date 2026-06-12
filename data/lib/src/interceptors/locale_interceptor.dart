import 'package:core/core.dart';
import 'package:data/src/providers/api/api_provider.dart' show ApiProvider;
import 'package:data/src/providers/api/api_providers.dart' show ApiProvider;
import 'package:data/src/providers/providers.dart' show ApiProvider;
import 'package:data/src/services/auth_session_manager.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

/// Adds a `lang` query parameter to unauthenticated requests.
///
/// When the user is not authenticated, the backend cannot determine the user's
/// preferred language from the profile, so we pass the current app locale
/// explicitly (e.g. `lang=ru`). Once authenticated, the parameter is omitted — the backend
/// reads the language from the user's stored profile data.
///
/// This class is NOT registered in GetIt — it is created inline in [ApiProvider].
class LocaleInterceptor extends Interceptor {
  final AuthSessionManager? _sessionManager;
  final LocaleController _localeController;

  LocaleInterceptor({
    AuthSessionManager? sessionManager,
    required LocaleController localeController,
  }) : _sessionManager = sessionManager,
       _localeController = localeController;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final AuthSessionManager? sessionManager = _sessionManager;
    final bool shouldAttachLang =
        sessionManager == null || sessionManager.authState is NotAuthenticated;
    if (shouldAttachLang) {
      final String langCode = _currentLangCode;
      options.queryParameters['lang'] = langCode;
    }
    handler.next(options);
  }

  String get _currentLangCode {
    try {
      final String languageCode = _localeController.locale.languageCode.trim();
      if (languageCode.isNotEmpty) return languageCode;
      return Platform.localeName.split('_').first;
    } catch (_) {
      return 'en';
    }
  }
}

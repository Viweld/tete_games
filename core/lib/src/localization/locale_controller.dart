import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({required Locale initial}) : _locale = initial;

  Locale _locale;

  Locale get locale => _locale;

  void setLocaleFromCode(String languageCode) {
    final Locale locale = LanguageCodeMapper.toLocale(languageCode) ?? const Locale('en');
    if (_locale == locale) return;

    _locale = locale;
    notifyListeners();
  }
}

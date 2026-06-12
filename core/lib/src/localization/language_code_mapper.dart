import 'dart:ui';

// ignore_for_file: prefer_const_constructors

/// Maps between backend language codes and Flutter [Locale] objects.
abstract final class LanguageCodeMapper {
  /// Maps backend language codes → Flutter Locale.
  static const Map<String, Locale> _backendToLocale = <String, Locale>{
    'en': Locale('en'),
    'ru': Locale('ru'),
  };

  /// All supported backend language codes.
  static Set<String> get supportedCodes => _backendToLocale.keys.toSet();

  /// Converts a backend language code to a Flutter [Locale].
  ///
  /// Returns `null` if the code is not in the supported list.
  /// The lookup is case-insensitive.
  static Locale? toLocale(String backendCode) {
    return _backendToLocale[backendCode.toLowerCase()];
  }

  /// Converts a system [Locale] to the matching backend language code.
  ///
  /// Returns `null` if no matching backend code is found (language not supported).
  static String? toLanguageCode(Locale locale) {
    return _backendToLocale.entries
        .where((MapEntry<String, Locale> e) => e.value.languageCode == locale.languageCode)
        .map((MapEntry<String, Locale> e) => e.key)
        .firstOrNull;
  }
}

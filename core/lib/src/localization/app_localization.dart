import 'dart:ui';
import 'package:core/src/localization/generated/app_localization.dart';

abstract final class AppLocalizationConfig {
  static const List<Locale> supportedLocales = AppLocalization.supportedLocales;
  static const Locale fallbackLocale = Locale('ru');
}

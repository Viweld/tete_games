import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension AppLocalizationGetter on BuildContext {
  AppLocalization get localization => AppLocalization.of(this);

  void setLocaleFromCode(String languageCode) =>
      appLocator<LocaleController>().setLocaleFromCode(languageCode);
}

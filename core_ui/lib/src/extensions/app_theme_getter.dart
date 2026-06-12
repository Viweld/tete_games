part of 'extensions.dart';

extension AppThemeGetter on BuildContext {
  ThemeData get theme => AppTheme.of(this).theme;

  AppColorsTheme get colors => AppTheme.of(this).colors;
}

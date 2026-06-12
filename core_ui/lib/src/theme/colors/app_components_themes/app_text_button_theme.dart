import 'package:core_ui/core_ui.dart';

final class AppTextButtonTheme {
  final AppTextButtonContentTheme contentDefault;
  final AppTextButtonContentTheme contentDisabled;

  const AppTextButtonTheme({required this.contentDefault, required this.contentDisabled});
}

final class AppTextButtonContentTheme {
  final Color main;
  final Color red;

  const AppTextButtonContentTheme({required this.main, required this.red});
}

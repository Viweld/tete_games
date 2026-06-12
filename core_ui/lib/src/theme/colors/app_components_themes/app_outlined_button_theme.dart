import 'package:core_ui/core_ui.dart';

final class AppOutlinedButtonTheme {
  final AppOutlinedButtonBorderTheme borderDefault;
  final AppOutlinedButtonBorderTheme borderDisabled;
  final AppOutlinedButtonContentTheme contentDefault;
  final AppOutlinedButtonContentTheme contentDisabled;

  const AppOutlinedButtonTheme({
    required this.borderDefault,
    required this.borderDisabled,
    required this.contentDefault,
    required this.contentDisabled,
  });
}

final class AppOutlinedButtonBorderTheme {
  final Color main;
  final Color error;

  const AppOutlinedButtonBorderTheme({required this.main, required this.error});
}

final class AppOutlinedButtonContentTheme {
  final Color main;
  final Color error;

  const AppOutlinedButtonContentTheme({required this.main, required this.error});
}

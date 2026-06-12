import 'package:shared_preferences/shared_preferences.dart';

enum AppRuntimeMode {
  prod,
  test;

  static AppRuntimeMode fromStorage(String? raw) => switch (raw) {
    'test' => AppRuntimeMode.test,
    _ => AppRuntimeMode.prod,
  };

  String get storageValue => switch (this) {
    AppRuntimeMode.prod => 'prod',
    AppRuntimeMode.test => 'test',
  };
}

/// Persists API mode (prod / test) across app restarts.
abstract final class AppRuntimeModeStorage {
  static const String _key = 'app.runtime_mode';

  static Future<AppRuntimeMode> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return AppRuntimeMode.fromStorage(prefs.getString(_key));
  }

  static Future<void> write(AppRuntimeMode mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.storageValue);
  }
}

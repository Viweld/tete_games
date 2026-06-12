import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocaleModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

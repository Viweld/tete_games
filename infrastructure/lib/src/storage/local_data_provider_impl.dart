import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LocalDataProvider)
final class LocalDataProviderImpl implements LocalDataProvider {
  final SharedPreferences _sharedPreferences;

  LocalDataProviderImpl({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<Object?> getValue({required String key}) async {
    return _sharedPreferences.get(key);
  }

  @override
  Future<void> setValue({required String key, required Object value}) async {
    if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
    } else {
      await _sharedPreferences.setString(key, value.toString());
    }
    await _sharedPreferences.reload();
  }

  @override
  Future<void> deleteValue({required String key}) async {
    await _sharedPreferences.remove(key);
    await _sharedPreferences.reload();
  }

  @override
  Future<void> clearValues() async {
    await _sharedPreferences.clear();
    await _sharedPreferences.reload();
  }
}

@module
abstract class LocalStorageModule {
  @preResolve
  Future<SharedPreferences> sharedPreferences() => SharedPreferences.getInstance();
}

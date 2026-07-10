import 'package:core/core.dart';
import 'package:shell/shell_domain.dart';

@LazySingleton(as: SettingsRepository)
final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localDataProvider);

  final LocalDataProvider _localDataProvider;

  static const String _languageCodeKey = 'language_code';

  @override
  Future<String?> getSavedLanguageCode() async {
    final Object? result = await _localDataProvider.getValue(key: _languageCodeKey);
    return result is String ? result : null;
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    await _localDataProvider.setValue(key: _languageCodeKey, value: languageCode);
  }
}

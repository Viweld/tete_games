import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:shell/shell_domain.dart';

@LazySingleton(as: SettingsRepository)
final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localDataProvider);

  final LocalDataProvider _localDataProvider;

  static const String _languageCodeKey = 'language_code';
  static const String _pushNotificationsEnabledKey = 'push_notifications_enabled';

  @override
  Future<String?> getSavedLanguageCode() async {
    final Object? result = await _localDataProvider.getValue(key: _languageCodeKey);
    return result is String ? result : null;
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    await _localDataProvider.setValue(key: _languageCodeKey, value: languageCode);
  }

  @override
  Future<bool> isPushNotificationsEnabled() async {
    final Object? result = await _localDataProvider.getValue(key: _pushNotificationsEnabledKey);
    return result is bool ? result : true;
  }

  @override
  Future<void> setPushNotificationsEnabled(bool enabled) async {
    await _localDataProvider.setValue(key: _pushNotificationsEnabledKey, value: enabled);
  }
}

part of 'repositories.dart';

abstract interface class SettingsRepository {
  Future<String?> getSavedLanguageCode();

  Future<void> saveLanguageCode(String languageCode);

  Future<bool> isPushNotificationsEnabled();

  Future<void> setPushNotificationsEnabled(bool enabled);
}

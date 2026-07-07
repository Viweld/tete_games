import 'package:core/core.dart';

abstract interface class SettingsRepository implements PushNotificationPreferences {
  Future<String?> getSavedLanguageCode();

  Future<void> saveLanguageCode(String languageCode);

  Future<bool> isPushNotificationsEnabled();

  Future<void> setPushNotificationsEnabled(bool enabled);
}

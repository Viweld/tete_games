import 'package:core/core.dart';

abstract interface class SettingsRepository implements PushNotificationPreferences {
  Future<String?> getSavedLanguageCode();

  Future<void> saveLanguageCode(String languageCode);

  @override
  Future<bool> isPushNotificationsEnabled();

  @override
  Future<void> setPushNotificationsEnabled(bool enabled);
}

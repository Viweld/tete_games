abstract interface class PushNotificationPreferences {
  Future<bool> isPushNotificationsEnabled();

  Future<void> setPushNotificationsEnabled(bool enabled);
}

part of 'repositories.dart';

abstract interface class NotificationsRepository {
  Stream<UserNotification> get notificationsStream;

  Future<void> addNotification(UserNotification notification);

  Future<List<UserNotification>> getNotifications({
    NotificationCategoryType? category,
    bool? isRead,
    NotificationKindType? kind,
    String? lang,
  });

  Future<FirebaseTokenUpdateResult> upsertFirebaseToken({required String token, String? lang});

  Future<int> markAsRead({List<int>? ids, String? lang});

  Future<int> markAllAsRead({bool markAll, String? lang});

  Future<UnreadIndicator> getUnreadIndicator({String? lang});

  Future<bool> isPushNotificationsEnabled();

  Future<void> setPushNotificationsEnabled({required bool isEnabled});
}

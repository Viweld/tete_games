part of 'notifications_mappers.dart';

extension NotificationCategoryApiMapper on String? {
  NotificationCategoryType get toNotificationCategory => switch (this) {
    'booking' => NotificationCategoryType.booking,
    'payment' => NotificationCategoryType.payment,
    'refund' => NotificationCategoryType.refund,
    'bonus' => NotificationCategoryType.bonus,
    _ => NotificationCategoryType.unknown,
  };
}

extension NotificationCategoryModelMapper on NotificationCategoryType {
  String? toApi() => switch (this) {
    NotificationCategoryType.booking => 'booking',
    NotificationCategoryType.payment => 'payment',
    NotificationCategoryType.refund => 'refund',
    NotificationCategoryType.bonus => 'bonus',
    NotificationCategoryType.unknown => null,
  };
}

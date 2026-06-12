part of 'notifications_mappers.dart';

extension NotificationKindApiMapper on String? {
  NotificationKindType get toNotificationKind => switch (this) {
    'order_status' => NotificationKindType.orderStatus,
    'flight' => NotificationKindType.flight,
    'payment' => NotificationKindType.payment,
    'manual' => NotificationKindType.manual,
    'system' => NotificationKindType.system,
    _ => NotificationKindType.unknown,
  };
}

extension NotificationKindModelMapper on NotificationKindType {
  String? toApi() => switch (this) {
    NotificationKindType.orderStatus => 'order_status',
    NotificationKindType.flight => 'flight',
    NotificationKindType.payment => 'payment',
    NotificationKindType.manual => 'manual',
    NotificationKindType.system => 'system',
    NotificationKindType.unknown => null,
  };
}

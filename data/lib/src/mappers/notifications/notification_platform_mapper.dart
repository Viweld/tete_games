part of 'notifications_mappers.dart';

extension NotificationPlatformModelMapper on NotificationPlatformType {
  String? toApi() => switch (this) {
    NotificationPlatformType.ios => 'ios',
    NotificationPlatformType.android => 'android',
    NotificationPlatformType.web => 'web',
    NotificationPlatformType.unknown => null,
  };
}

part of 'notifications_mappers.dart';

extension UnreadIndicatorDtoMapper on UnreadIndicatorDto {
  UnreadIndicator get toModel => UnreadIndicator(unreadCount: unreadCount, hasUnread: hasUnread);
}

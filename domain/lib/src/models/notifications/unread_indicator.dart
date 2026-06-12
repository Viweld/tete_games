part of 'notifications.dart';

@immutable
class UnreadIndicator {
  final int unreadCount;
  final bool hasUnread;

  const UnreadIndicator({required this.unreadCount, required this.hasUnread});
}

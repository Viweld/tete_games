part of 'notifications_mappers.dart';

extension UserNotificationDtoMapper on UserNotificationDto {
  UserNotification get toModel => UserNotification(
    id: id,
    title: title,
    body: body,
    kind: kind.toNotificationKind,
    category: category.toNotificationCategory,
    isRead: isRead ?? false,
    readAt: DateTime.tryParse(readAt ?? ''),
    payload: payload ?? <String, dynamic>{},
    sentAt: DateTime.tryParse(sentAt ?? ''),
    createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
  );
}

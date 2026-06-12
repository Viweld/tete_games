part of 'notifications.dart';

@immutable
class UserNotification {
  final int id;
  final String title;
  final String body;
  final NotificationKindType? kind;
  final NotificationCategoryType? category;
  final bool isRead;
  final DateTime? readAt;
  final Map<String, dynamic>? payload;
  final DateTime? sentAt;
  final DateTime createdAt;

  const UserNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.kind = NotificationKindType.unknown,
    this.category = NotificationCategoryType.unknown,
    this.isRead = false,
    this.payload,
    this.readAt,
    this.sentAt,
  });

  UserNotification copyWith({
    int? id,
    String? title,
    String? body,
    NotificationKindType? kind,
    NotificationCategoryType? category,
    bool? isRead,
    DateTime? readAt,
    Map<String, dynamic>? payload,
    DateTime? sentAt,
    DateTime? createdAt,
  }) {
    return UserNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      kind: kind ?? this.kind,
      category: category ?? this.category,
      isRead: isRead ?? this.isRead,
      readAt: readAt ?? this.readAt,
      payload: payload ?? this.payload,
      sentAt: sentAt ?? this.sentAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(covariant UserNotification other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.kind == kind &&
        other.category == category &&
        other.isRead == isRead &&
        other.readAt == readAt &&
        mapEquals(other.payload, payload) &&
        other.sentAt == sentAt &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        kind.hashCode ^
        category.hashCode ^
        isRead.hashCode ^
        readAt.hashCode ^
        payload.hashCode ^
        sentAt.hashCode ^
        createdAt.hashCode;
  }
}

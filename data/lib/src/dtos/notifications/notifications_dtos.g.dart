// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseTokenUpdateRequestDto _$FirebaseTokenUpdateRequestDtoFromJson(
  Map<String, dynamic> json,
) => FirebaseTokenUpdateRequestDto(
  token: json['token'] as String,
  platform: json['platform'] as String?,
  appVersion: json['app_version'] as String?,
);

Map<String, dynamic> _$FirebaseTokenUpdateRequestDtoToJson(
  FirebaseTokenUpdateRequestDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'platform': instance.platform,
  'app_version': instance.appVersion,
};

MarkNotificationReadAllRequestDto _$MarkNotificationReadAllRequestDtoFromJson(
  Map<String, dynamic> json,
) => MarkNotificationReadAllRequestDto(
  markAll: json['mark_all'] as bool? ?? false,
);

Map<String, dynamic> _$MarkNotificationReadAllRequestDtoToJson(
  MarkNotificationReadAllRequestDto instance,
) => <String, dynamic>{'mark_all': instance.markAll};

MarkNotificationReadRequestDto _$MarkNotificationReadRequestDtoFromJson(
  Map<String, dynamic> json,
) => MarkNotificationReadRequestDto(
  ids: (json['ids'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$MarkNotificationReadRequestDtoToJson(
  MarkNotificationReadRequestDto instance,
) => <String, dynamic>{'ids': instance.ids};

FirebaseTokenUpdateResponseDto _$FirebaseTokenUpdateResponseDtoFromJson(
  Map<String, dynamic> json,
) => FirebaseTokenUpdateResponseDto(
  success: json['success'] as bool,
  tokenId: (json['token_id'] as num).toInt(),
  isActive: json['is_active'] as bool,
);

MarkReadResponseDto _$MarkReadResponseDtoFromJson(Map<String, dynamic> json) =>
    MarkReadResponseDto(updated: (json['updated'] as num).toInt());

UnreadIndicatorDto _$UnreadIndicatorDtoFromJson(Map<String, dynamic> json) =>
    UnreadIndicatorDto(
      unreadCount: (json['unread_count'] as num).toInt(),
      hasUnread: json['has_unread'] as bool,
    );

UserNotificationDto _$UserNotificationDtoFromJson(Map<String, dynamic> json) =>
    UserNotificationDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: json['created_at'] as String,
      kind: json['kind'] as String?,
      category: json['category'] as String?,
      isRead: json['is_read'] as bool?,
      readAt: json['read_at'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
      sentAt: json['sent_at'] as String?,
    );

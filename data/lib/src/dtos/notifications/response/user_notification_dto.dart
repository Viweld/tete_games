part of '../notifications_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class UserNotificationDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'body')
  final String body;

  @JsonKey(name: 'kind')
  final String? kind;

  @JsonKey(name: 'category')
  final String? category;

  @JsonKey(name: 'is_read')
  final bool? isRead;

  @JsonKey(name: 'read_at')
  final String? readAt;

  @JsonKey(name: 'payload')
  final Map<String, dynamic>? payload;

  @JsonKey(name: 'sent_at')
  final String? sentAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  const UserNotificationDto({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.kind,
    this.category,
    this.isRead,
    this.readAt,
    this.payload,
    this.sentAt,
  });

  factory UserNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationDtoFromJson(json);
}

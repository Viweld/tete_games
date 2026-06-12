part of '../notifications_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class UnreadIndicatorDto {
  @JsonKey(name: 'unread_count')
  final int unreadCount;

  @JsonKey(name: 'has_unread')
  final bool hasUnread;

  const UnreadIndicatorDto({required this.unreadCount, required this.hasUnread});

  factory UnreadIndicatorDto.fromJson(Map<String, dynamic> json) =>
      _$UnreadIndicatorDtoFromJson(json);
}

part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SupportMessageDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'attachments')
  final List<SupportAttachmentDto> attachments;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'sender_name')
  final String? senderName;

  @JsonKey(name: 'sender_avatar')
  final String? senderAvatar;

  @JsonKey(name: 'is_staff_reply')
  final bool isStaffReply;

  @JsonKey(name: 'is_me')
  final bool isMe;

  const SupportMessageDto({
    required this.id,
    this.text,
    required this.attachments,
    required this.createdAt,
    this.senderName,
    this.senderAvatar,
    required this.isStaffReply,
    required this.isMe,
  });

  factory SupportMessageDto.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageDtoFromJson(json);
}

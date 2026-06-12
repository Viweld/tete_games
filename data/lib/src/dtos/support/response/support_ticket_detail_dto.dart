part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SupportTicketDetailDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'ref_number')
  final String? refNumber;

  @JsonKey(name: 'contact_email')
  final String contactEmail;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'assigned_admin')
  final SupportAdminDto? assignedAdmin;

  @JsonKey(name: 'reply_as_admin')
  final SupportAdminDto? replyAsAdmin;

  @JsonKey(name: 'messages')
  final List<SupportMessageDto> messages;

  const SupportTicketDetailDto({
    required this.id,
    required this.category,
    required this.status,
    required this.contactEmail,
    required this.createdAt,
    required this.messages,
    this.refNumber,
    this.assignedAdmin,
    this.replyAsAdmin,
  });

  factory SupportTicketDetailDto.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketDetailDtoFromJson(json);
}

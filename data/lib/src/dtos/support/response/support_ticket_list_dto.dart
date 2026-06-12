part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SupportTicketListDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'ref_number')
  final String? refNumber;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'last_message')
  final String lastMessage;

  const SupportTicketListDto({
    required this.id,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.lastMessage,
    this.refNumber,
  });

  factory SupportTicketListDto.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketListDtoFromJson(json);
}

part of '../support_dtos.dart';

@JsonSerializable(createFactory: false)
@immutable
class CreateSupportTicketRequestDto {
  @JsonKey(name: 'category')
  final String? category;

  @JsonKey(name: 'ref_number')
  final String? refNumber;

  @JsonKey(name: 'contact_email')
  final String? contactEmail;

  @JsonKey(name: 'message')
  final String message;

  // @JsonKey(name: 'attachment')
  // final String? attachment;

  const CreateSupportTicketRequestDto({
    required this.message,
    this.category,
    this.refNumber,
    this.contactEmail,
    // this.attachment,
  });

  Map<String, dynamic> toJson() => _$CreateSupportTicketRequestDtoToJson(this);
}

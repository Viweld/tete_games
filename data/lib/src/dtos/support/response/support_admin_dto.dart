part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
class SupportAdminDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'bitrix_user_id')
  final int? bitrixUserId;

  const SupportAdminDto({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.avatar,
    this.bitrixUserId,
  });

  factory SupportAdminDto.fromJson(Map<String, dynamic> json) => _$SupportAdminDtoFromJson(json);
}

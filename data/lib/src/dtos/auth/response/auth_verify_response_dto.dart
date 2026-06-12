part of '../auth_dtos.dart';

/// Response DTO for authentication verification
@JsonSerializable(createToJson: false)
class AuthVerifyResponseDto {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'is_new_user')
  final bool isNewUser;

  @JsonKey(name: 'tokens')
  final TokensResponseDto tokens;

  const AuthVerifyResponseDto({
    required this.success,
    required this.isNewUser,
    required this.tokens,
  });

  factory AuthVerifyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthVerifyResponseDtoFromJson(json);
}

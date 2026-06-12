part of '../auth_dtos.dart';

/// Response DTO containing access and refresh tokens
@JsonSerializable(createToJson: false)
class TokensResponseDto {
  @JsonKey(name: 'access')
  final String accessToken;

  @JsonKey(name: 'refresh')
  final String refreshToken;

  const TokensResponseDto({required this.accessToken, required this.refreshToken});

  factory TokensResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseDtoFromJson(json);
}

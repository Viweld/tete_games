// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensResponseDto _$TokensResponseDtoFromJson(Map<String, dynamic> json) =>
    TokensResponseDto(
      accessToken: json['access'] as String,
      refreshToken: json['refresh'] as String,
    );

AuthVerifyResponseDto _$AuthVerifyResponseDtoFromJson(
  Map<String, dynamic> json,
) => AuthVerifyResponseDto(
  success: json['success'] as bool,
  isNewUser: json['is_new_user'] as bool,
  tokens: TokensResponseDto.fromJson(json['tokens'] as Map<String, dynamic>),
);

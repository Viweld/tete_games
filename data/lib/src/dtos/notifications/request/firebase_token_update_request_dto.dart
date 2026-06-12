part of '../notifications_dtos.dart';

@JsonSerializable()
@immutable
class FirebaseTokenUpdateRequestDto {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'platform')
  final String? platform;

  @JsonKey(name: 'app_version')
  final String? appVersion;

  const FirebaseTokenUpdateRequestDto({required this.token, this.platform, this.appVersion});

  factory FirebaseTokenUpdateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FirebaseTokenUpdateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseTokenUpdateRequestDtoToJson(this);
}

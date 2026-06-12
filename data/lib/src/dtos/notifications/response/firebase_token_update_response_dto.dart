part of '../notifications_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class FirebaseTokenUpdateResponseDto {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'token_id')
  final int tokenId;

  @JsonKey(name: 'is_active')
  final bool isActive;

  const FirebaseTokenUpdateResponseDto({
    required this.success,
    required this.tokenId,
    required this.isActive,
  });

  factory FirebaseTokenUpdateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FirebaseTokenUpdateResponseDtoFromJson(json);
}

part of '../notifications_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class MarkReadResponseDto {
  @JsonKey(name: 'updated')
  final int updated;

  const MarkReadResponseDto({required this.updated});

  factory MarkReadResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MarkReadResponseDtoFromJson(json);
}

part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class AirportRenderDataDto {
  @JsonKey(name: 'key')
  final String? key;

  @JsonKey(name: 'value')
  final String? value;

  const AirportRenderDataDto({this.key, this.value});

  factory AirportRenderDataDto.fromJson(Map<String, dynamic> json) =>
      _$AirportRenderDataDtoFromJson(json);
}

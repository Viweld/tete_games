part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class AirportTagDto {
  @JsonKey(name: 'label')
  final String? label;

  @JsonKey(name: 'backgroundColor')
  final String? backgroundColor;

  @JsonKey(name: 'color')
  final String? color;

  const AirportTagDto({this.label, this.backgroundColor, this.color});

  factory AirportTagDto.fromJson(Map<String, dynamic> json) => _$AirportTagDtoFromJson(json);
}

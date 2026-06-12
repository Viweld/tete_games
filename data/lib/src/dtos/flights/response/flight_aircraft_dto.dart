part of '../flights_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class FlightAircraftDto {
  @JsonKey(name: 'model')
  final String? model;

  @JsonKey(name: 'registration')
  final String? registration;

  const FlightAircraftDto({this.model, this.registration});

  factory FlightAircraftDto.fromJson(Map<String, dynamic> json) =>
      _$FlightAircraftDtoFromJson(json);
}

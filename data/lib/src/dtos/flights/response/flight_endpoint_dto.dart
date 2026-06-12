part of '../flights_dtos.dart';

// imports are handled in the part file parent usually, but let's check flights_dtos.dart
// Oh, SimpleTerminalDto is in services_dtos, which is imported in flights_dtos.dart.
// So no new import needed here as it's a part file.
// Wait, I am editing the part file.
// Correct. `part of flights_dtos;` implies it uses imports from `flights_dtos.dart`.
// `flights_dtos.dart` imports `package:data/src/dtos/services/services_dtos.dart`.
// So `SimpleTerminalDto` should be available.

@JsonSerializable(createToJson: false)
@immutable
class FlightEndpointDto {
  @JsonKey(name: 'iataCode')
  final String? iataCode;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'airport_code')
  final String? airportCode;

  @JsonKey(name: 'airport_name')
  final String? airportName;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'photos')
  final List<PhotoDto>? photos;

  @JsonKey(name: 'serviceGroups')
  final List<ServiceGroupDto>? serviceGroups;

  @JsonKey(name: 'importantInfo')
  final Map<String, dynamic>? importantInfo;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'terminal')
  final String? terminal;

  @JsonKey(name: 'gate')
  final String? gate;

  @JsonKey(name: 'scheduled_time')
  final DateTime? scheduledTime;

  @JsonKey(name: 'estimated_time')
  final DateTime? estimatedTime;

  @JsonKey(name: 'timezone')
  final String? timezone;

  @JsonKey(name: 'city_name')
  final String? cityName;

  @JsonKey(name: 'system_airport_id')
  final int? systemAirportId;

  @JsonKey(name: 'terminals')
  final List<TerminalDto>? terminals;

  @JsonKey(name: 'isPublished')
  final bool? isPublished;

  @JsonKey(name: 'popularityScore')
  final int? popularityScore;

  const FlightEndpointDto({
    this.iataCode,
    this.city,
    this.country,
    this.airportCode,
    this.airportName,
    this.description,
    this.photos,
    this.serviceGroups,
    this.importantInfo,
    this.status,
    this.terminal,
    this.gate,
    this.scheduledTime,
    this.estimatedTime,
    this.timezone,
    this.cityName,
    this.systemAirportId,
    this.terminals,
    this.isPublished,
    this.popularityScore,
  });

  factory FlightEndpointDto.fromJson(Map<String, dynamic> json) =>
      _$FlightEndpointDtoFromJson(json);
}

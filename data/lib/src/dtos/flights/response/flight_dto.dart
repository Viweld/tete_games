part of '../flights_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class FlightDto {
  @JsonKey(name: 'flight_number')
  final String? flightNumber;

  @JsonKey(name: 'airline_iata')
  final String? airlineIata;

  @JsonKey(name: 'airline_name')
  final String? airlineName;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;

  @JsonKey(name: 'aircraft')
  final FlightAircraftDto? aircraft;

  @JsonKey(name: 'departure')
  final FlightEndpointDto? departure;

  @JsonKey(name: 'arrival')
  final FlightEndpointDto? arrival;

  const FlightDto({
    this.flightNumber,
    this.airlineIata,
    this.airlineName,
    this.status,
    this.durationMinutes,
    this.aircraft,
    this.departure,
    this.arrival,
  });

  factory FlightDto.fromJson(Map<String, dynamic> json) => _$FlightDtoFromJson(json);
}

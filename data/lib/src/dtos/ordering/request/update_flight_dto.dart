part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateFlightDto {
  @JsonKey(name: 'flight_number')
  final String? flightNumber;

  @JsonKey(name: 'flight_date')
  final String? flightDate;

  @JsonKey(name: 'departure_airport')
  final String? departureAirportCode;

  @JsonKey(name: 'arrival_airport')
  final String? arrivalAirportCode;

  @JsonKey(name: 'departure_airport_name')
  final String? departureAirportName;

  @JsonKey(name: 'arrival_airport_name')
  final String? arrivalAirportName;

  @JsonKey(name: 'departure_terminal_id')
  final int? departureTerminalId;

  @JsonKey(name: 'departure_terminal_name')
  final String? departureTerminalName;

  @JsonKey(name: 'arrival_terminal_id')
  final int? arrivalTerminalId;

  @JsonKey(name: 'arrival_terminal_name')
  final String? arrivalTerminalName;

  @JsonKey(name: 'airline_name')
  final String? airlineName;

  @JsonKey(name: 'departure_time')
  final String? departureTime;

  @JsonKey(name: 'arrival_time')
  final String? arrivalTime;

  const UpdateFlightDto({
    this.flightNumber,
    this.flightDate,
    this.departureAirportCode,
    this.arrivalAirportCode,
    this.departureAirportName,
    this.arrivalAirportName,
    this.departureTerminalId,
    this.departureTerminalName,
    this.arrivalTerminalId,
    this.arrivalTerminalName,
    this.airlineName,
    this.departureTime,
    this.arrivalTime,
  });

  Map<String, dynamic> toJson() => _$UpdateFlightDtoToJson(this);
}

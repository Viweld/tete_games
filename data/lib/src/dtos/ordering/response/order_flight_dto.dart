part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderFlightDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'flight_number')
  final String? flightNumber;

  @JsonKey(name: 'flight_date')
  final String? flightDate;

  @JsonKey(name: 'departure_terminal_id')
  final int? departureTerminalId;

  @JsonKey(name: 'departure_terminal_name')
  final String? departureTerminalName;

  @JsonKey(name: 'arrival_terminal_id')
  final int? arrivalTerminalId;

  @JsonKey(name: 'arrival_terminal_name')
  final String? arrivalTerminalName;

  @JsonKey(name: 'departure_airport')
  final String? departureAirportCode;

  @JsonKey(name: 'arrival_airport')
  final String? arrivalAirportCode;

  @JsonKey(name: 'departure_airport_name')
  final String? departureAirportName;

  @JsonKey(name: 'arrival_airport_name')
  final String? arrivalAirportName;

  @JsonKey(name: 'departure_country')
  final String? departureCountry;

  @JsonKey(name: 'arrival_country')
  final String? arrivalCountry;

  @JsonKey(name: 'departure_city')
  final String? departureCity;

  @JsonKey(name: 'arrival_city')
  final String? arrivalCity;

  @JsonKey(name: 'departure_time')
  final String? departureTime;

  @JsonKey(name: 'arrival_time')
  final String? arrivalTime;

  @JsonKey(name: 'airline_name')
  final String? airlineName;

  const OrderFlightDto({
    required this.id,
    this.flightNumber,
    this.flightDate,
    this.departureTerminalId,
    this.departureTerminalName,
    this.arrivalTerminalId,
    this.arrivalTerminalName,
    this.departureAirportCode,
    this.arrivalAirportCode,
    this.departureAirportName,
    this.arrivalAirportName,
    this.departureCountry,
    this.arrivalCountry,
    this.departureCity,
    this.arrivalCity,
    this.departureTime,
    this.arrivalTime,
    this.airlineName,
  });

  factory OrderFlightDto.fromJson(Map<String, dynamic> json) => _$OrderFlightDtoFromJson(json);
}

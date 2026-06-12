part of 'ordering_read_models.dart';

@immutable
class OrderFlight {
  final int id;
  final String? flightNumber;
  final String? flightDate;
  final int? departureTerminalId;
  final String? departureTerminalName;
  final int? arrivalTerminalId;
  final String? arrivalTerminalName;
  final String? departureAirportCode;
  final String? arrivalAirportCode;
  final String? departureAirportName;
  final String? arrivalAirportName;
  final String? departureCountry;
  final String? arrivalCountry;
  final String? departureCity;
  final String? arrivalCity;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? airlineName;

  const OrderFlight({
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
}

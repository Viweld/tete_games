part of 'ordering_write_models.dart';

class UpdateFlight {
  const UpdateFlight({
    this.flightNumber,
    this.flightDate,
    this.departureAirportCode,
    this.arrivalAirportCode,
    this.departureTerminalId,
    this.departureTerminalName,
    this.arrivalTerminalId,
    this.arrivalTerminalName,
    this.departureAirportName,
    this.arrivalAirportName,
    this.airlineName,
    this.departureTime,
    this.arrivalTime,
  });

  final String? flightNumber;
  final DateTime? flightDate;
  final String? departureAirportCode;
  final String? arrivalAirportCode;
  final int? departureTerminalId;
  final String? departureTerminalName;
  final int? arrivalTerminalId;
  final String? arrivalTerminalName;
  final String? departureAirportName;
  final String? arrivalAirportName;
  final String? airlineName;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
}

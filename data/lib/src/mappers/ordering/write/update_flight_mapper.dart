part of 'ordering_write_mappers.dart';

extension UpdateFlightMapper on UpdateFlight {
  UpdateFlightDto get toDto {
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    return UpdateFlightDto(
      flightNumber: flightNumber,
      flightDate: flightDate != null ? outputFormat.format(flightDate!) : null,
      departureAirportCode: departureAirportCode,
      arrivalAirportCode: arrivalAirportCode,
      departureAirportName: departureAirportName,
      arrivalAirportName: arrivalAirportName,
      departureTerminalId: effectiveTerminalIdForApi(departureTerminalId),
      departureTerminalName: departureTerminalName,
      arrivalTerminalId: effectiveTerminalIdForApi(arrivalTerminalId),
      arrivalTerminalName: arrivalTerminalName,
      airlineName: airlineName,
      departureTime: departureTime != null ? dateTimeFormat.format(departureTime!) : null,
      arrivalTime: arrivalTime != null ? dateTimeFormat.format(arrivalTime!) : null,
    );
  }
}

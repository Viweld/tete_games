part of 'ordering_read_mappers.dart';

extension OrderFlightDtoMapper on OrderFlightDto {
  OrderFlight get toModel => OrderFlight(
    id: id,
    flightNumber: flightNumber,
    flightDate: flightDate,
    departureTerminalId: departureTerminalId,
    departureTerminalName: departureTerminalName,
    arrivalTerminalId: arrivalTerminalId,
    arrivalTerminalName: arrivalTerminalName,
    departureAirportCode: departureAirportCode,
    arrivalAirportCode: arrivalAirportCode,
    departureAirportName: departureAirportName,
    arrivalAirportName: arrivalAirportName,
    departureCountry: departureCountry,
    arrivalCountry: arrivalCountry,
    departureCity: departureCity,
    arrivalCity: arrivalCity,
    departureTime: departureTime != null ? DateTime.tryParse(departureTime!) : null,
    arrivalTime: arrivalTime != null ? DateTime.tryParse(arrivalTime!) : null,
    airlineName: airlineName,
  );
}

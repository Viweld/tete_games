part of 'flight_models.dart';

@immutable
class Flight {
  final String? flightNumber;
  final String? airlineIata;
  final String? airlineName;
  final String? status;
  final int? durationMinutes;
  final FlightAircraft? aircraft;
  final FlightEndpoint? departure;
  final FlightEndpoint? arrival;

  const Flight({
    this.flightNumber,
    this.airlineIata,
    this.airlineName,
    this.status,
    this.durationMinutes,
    this.aircraft,
    this.departure,
    this.arrival,
  });
}

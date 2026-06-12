part of 'exceptions.dart';

/// Exception thrown when a flight lookup returns no results (404 with FLIGHT_NOT_FOUND code).
///
/// This indicates that the flight was not found in either the live feed or schedule
/// for the given flight number and date.
class FlightNotFoundException implements Exception {
  final String flightNumber;
  final String date;
  final String? message;

  const FlightNotFoundException({required this.flightNumber, required this.date, this.message});

  @override
  String toString() {
    return 'FlightNotFoundException: Flight $flightNumber not found for date $date'
        '${message != null ? ' - $message' : ''}';
  }
}

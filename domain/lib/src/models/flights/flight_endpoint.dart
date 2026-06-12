part of 'flight_models.dart';

@immutable
class FlightEndpoint {
  final String? iataCode;
  final String? city;
  final String? country;
  final String? description;
  final List<Photo> photos;
  final List<ServiceGroup> serviceGroups;
  final Map<String, dynamic>? importantInfo;
  final String? status;
  final String? airportCode;
  final String? terminal;
  final String? gate;
  final DateTime? scheduledTime;
  final DateTime? estimatedTime;
  final String? timezone;
  final String? airportName;
  final String? cityName;
  final int? systemAirportId;
  final List<Terminal> terminals;
  final bool isPublished;
  final int popularityScore;

  const FlightEndpoint({
    this.iataCode,
    this.city,
    this.country,
    this.description,
    this.photos = const <Photo>[],
    this.serviceGroups = const <ServiceGroup>[],
    this.importantInfo,
    this.status,
    this.airportCode,
    this.terminal,
    this.gate,
    this.scheduledTime,
    this.estimatedTime,
    this.timezone,
    this.airportName,
    this.cityName,
    this.systemAirportId,
    this.terminals = const <Terminal>[],
    this.isPublished = false,
    this.popularityScore = 0,
  });

  int? get terminalId => terminals.indexWhere((Terminal t) => t.name == terminal) != -1
      ? terminals.firstWhere((Terminal t) => t.name == terminal).id
      : null;
}

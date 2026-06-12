part of 'flight_models.dart';

@immutable
class Endpoint {
  final String? airportIataCode;
  final String? airportName;
  final int? terminalId;
  final String? terminalName;
  final String? country;
  final String? city;

  const Endpoint({
    this.airportIataCode,
    this.airportName,
    this.terminalId,
    this.terminalName,
    this.country,
    this.city,
  });

  Endpoint copyWith({
    Object? airportIataCode = const Object(),
    Object? airportName = const Object(),
    Object? terminalId = const Object(),
    Object? terminalName = const Object(),
  }) {
    return Endpoint(
      airportIataCode: airportIataCode == const Object()
          ? this.airportIataCode
          : airportIataCode as String?,
      airportName: airportName == const Object() ? this.airportName : airportName as String?,
      terminalId: terminalId == const Object() ? this.terminalId : terminalId as int?,
      terminalName: terminalName == const Object() ? this.terminalName : terminalName as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Endpoint &&
          runtimeType == other.runtimeType &&
          airportIataCode == other.airportIataCode &&
          airportName == other.airportName &&
          terminalId == other.terminalId &&
          terminalName == other.terminalName;

  @override
  int get hashCode =>
      airportIataCode.hashCode ^ airportName.hashCode ^ terminalId.hashCode ^ terminalName.hashCode;

  bool get isEmpty => isAirportEmpty && isTerminalEmpty;

  bool get isAirportEmpty => (airportIataCode ?? '').isEmpty && (airportName ?? '').isEmpty;

  bool get isTerminalEmpty => (terminalName ?? '').isEmpty || terminalId == null;
}

part of 'repositories.dart';

abstract interface class AirportTerminalsRepository {
  Future<List<Terminal>> getAirportTerminals({required String iataCode});
}

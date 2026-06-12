part of 'repositories.dart';

abstract interface class ServicesRepository {
  Future<List<Service>> getPopularServices();

  Future<List<Service>> getAirportTerminalServices({required String iataCode, int? terminalId});
}

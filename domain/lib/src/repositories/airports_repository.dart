part of 'repositories.dart';

abstract interface class AirportsRepository {
  Future<List<Airport>> searchAirports(String query);
  Future<PaginatedData<Airport>> searchAirportsPaginated({
    required String query,
    required bool? isPublished,
    required int page,
    required int limit,
  });
  Future<List<Airport>> getPopularAirports();
  Future<List<Terminal>> getAirportTerminals(String iataCode);
}

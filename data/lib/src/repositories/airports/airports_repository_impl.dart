part of '../repositories.dart';

@LazySingleton(as: AirportsRepository)
class AirportsRepositoryImpl implements AirportsRepository {
  final AirportsApiProvider _apiProvider;
  final ApiCallWrapper _apiCallWrapper;

  AirportsRepositoryImpl(this._apiProvider, this._apiCallWrapper);

  @override
  Future<List<Airport>> searchAirports(String query) async {
    final ApiPaginatedResponse<AirportDto> response = await _apiCallWrapper.call(
      () => _apiProvider.getAirports(search: query),
    );

    return response.results.map((AirportDto dto) => dto.toModel).toList();
  }

  @override
  Future<PaginatedData<Airport>> searchAirportsPaginated({
    required String query,
    required bool? isPublished,
    required int page,
    required int limit,
  }) async {
    final ApiPaginatedResponse<AirportDto> response = await _apiCallWrapper.call(
      () => _apiProvider.getAirports(
        search: query.isEmpty ? null : query,
        published: isPublished,
        page: page,
        limit: limit,
      ),
    );
    final List<Airport> data = response.results.map((AirportDto dto) => dto.toModel).toList();
    return PaginatedData<Airport>(data: data, page: page, perPage: limit, total: response.count);
  }

  @override
  Future<List<Airport>> getPopularAirports() async {
    final ApiPaginatedResponse<AirportDto> response = await _apiCallWrapper.call(
      () => _apiProvider.getAirports(popular: true),
    );

    return response.results.map((AirportDto dto) => dto.toModel).toList();
  }

  @override
  Future<List<Terminal>> getAirportTerminals(String iataCode) async {
    final ApiResponse<List<TerminalDto>> response = await _apiCallWrapper.call(
      () => _apiProvider.getAirportTerminals(iataCode: iataCode),
    );

    return response.data.map((TerminalDto dto) => dto.toModel).toList();
  }
}

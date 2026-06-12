part of '../repositories.dart';

@LazySingleton(as: ServicesRepository)
class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesApiProvider _apiProvider;
  final ApiCallWrapper _apiCallWrapper;

  ServicesRepositoryImpl(this._apiProvider, this._apiCallWrapper);

  @override
  Future<List<Service>> getPopularServices() async {
    final String json = await _apiCallWrapper.call(
      () => _apiProvider.getServicesRaw(popular: true),
    );
    return parseServiceListFromJsonInIsolate(json);
  }

  @override
  Future<List<Service>> getAirportTerminalServices({
    required String iataCode,
    int? terminalId,
  }) async {
    final int? effectiveTerminalId = terminalId != null && terminalId >= 0 ? terminalId : null;
    final String json = await _apiCallWrapper.call(
      () => _apiProvider.getServicesRaw(
        iataCode: iataCode,
        terminal: effectiveTerminalId?.toString(),
      ),
    );
    return parseServiceListFromJsonInIsolate(json);
  }
}

part of '../repositories.dart';

@LazySingleton(as: AirportDetailRepository)
class AirportDetailRepositoryImpl implements AirportDetailRepository {
  final AirportsApiProvider _apiProvider;
  final ApiCallWrapper _apiCallWrapper;

  AirportDetailRepositoryImpl(this._apiProvider, this._apiCallWrapper);

  @override
  Future<AirportDetail> getAirportDetail({
    required String iataCode,
    String? currency,
    String? lang,
  }) async {
    final String json = await _apiCallWrapper.call(
      () => _apiProvider.getAirportDetailRaw(iataCode: iataCode, currency: currency, lang: lang),
    );
    return parseAirportDetailFromJsonInIsolate(json);
  }
}

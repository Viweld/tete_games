part of '../repositories.dart';

@LazySingleton(as: CurrenciesRepository)
class CurrenciesRepositoryImpl implements CurrenciesRepository {
  final ReferenceDataApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  CurrenciesRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<List<Currency>> getCurrencies() async {
    final ApiResponse<List<CurrencyDto>> response = await _apiCallWrapper.call(
      _provider.getCurrencies,
    );
    return response.data.map((CurrencyDto dto) => dto.toModel).toList();
  }
}

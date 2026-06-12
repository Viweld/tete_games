part of '../repositories.dart';

@LazySingleton(as: CountriesRepository)
class CountriesRepositoryImpl implements CountriesRepository {
  final ReferenceDataApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  CountriesRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<List<Country>> getCountries() async {
    final ApiResponse<List<CountryDto>> response = await _apiCallWrapper.call(
      _provider.getCountries,
    );
    return response.data.map((CountryDto dto) => dto.toModel).toList();
  }
}

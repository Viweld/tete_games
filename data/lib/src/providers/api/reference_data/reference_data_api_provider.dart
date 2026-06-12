import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reference_data_api_provider.g.dart';

/// Retrofit provider for reference data API endpoints.
/// No authentication required.
@RestApi()
@injectable
abstract class ReferenceDataApiProvider {
  @factoryMethod
  factory ReferenceDataApiProvider(Dio dio) = _ReferenceDataApiProvider;

  /// Get supported countries.
  @GET('${ApiProvidersVersions.apiVersion}/users/config/countries/')
  Future<ApiResponse<List<CountryDto>>> getCountries();

  /// Get supported currencies.
  @GET('${ApiProvidersVersions.apiVersion}/users/config/currencies/')
  Future<ApiResponse<List<CurrencyDto>>> getCurrencies();

  /// Get supported languages.
  @GET('${ApiProvidersVersions.apiVersion}/users/config/languages/')
  Future<ApiResponse<List<LanguageDto>>> getLanguages();
}

import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/airports/airports_dtos.dart';
import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'airports_api_provider.g.dart';

@RestApi()
@injectable
abstract class AirportsApiProvider {
  @factoryMethod
  factory AirportsApiProvider(Dio dio) = _AirportsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/locations/airports/')
  Future<ApiPaginatedResponse<AirportDto>> getAirports({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('search') String? search,
    @Query('popular') bool? popular,
    @Query('published') bool? published,
    @Query('lang') String? lang,
  });

  @GET('${ApiProvidersVersions.apiVersion}/locations/airports/{iata_code}/')
  Future<AirportDetailDto> getAirportDetail({
    @Path('iata_code') required String iataCode,
    @Query('currency') String? currency,
    @Query('lang') String? lang,
  });

  /// Raw JSON body; parsed in a background isolate in the airport detail repository.
  @GET('${ApiProvidersVersions.apiVersion}/locations/airports/{iata_code}/')
  Future<String> getAirportDetailRaw({
    @Path('iata_code') required String iataCode,
    @Query('currency') String? currency,
    @Query('lang') String? lang,
  });

  @GET('${ApiProvidersVersions.apiVersion}/locations/airports/{iata_code}/terminals/')
  Future<ApiResponse<List<TerminalDto>>> getAirportTerminals({
    @Path('iata_code') required String iataCode,
  });
}

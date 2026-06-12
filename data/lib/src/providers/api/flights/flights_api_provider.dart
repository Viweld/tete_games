import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/flights/flights_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'flights_api_provider.g.dart';

@RestApi()
@injectable
abstract class FlightsApiProvider {
  @factoryMethod
  factory FlightsApiProvider(Dio dio) = _FlightsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/locations/flights/lookup/')
  Future<LookupFlightResponseDto> lookupFlight({
    @Query('flight_number') required String flightNumber,
    @Query('date') String? date,
    @Query('currency') String? currency,
    @Query('lang') String? lang,
  });
}

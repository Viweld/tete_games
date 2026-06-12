import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/jets/jets_dtos.dart';
import 'package:data/src/dtos/services/services_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'services_api_provider.g.dart';

@RestApi()
@injectable
abstract class ServicesApiProvider {
  @factoryMethod
  factory ServicesApiProvider(Dio dio) = _ServicesApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/locations/services/')
  Future<List<ServiceDto>> getServices({
    @Query('currency') String? currency,
    @Query('iataCode') String? iataCode,
    @Query('popular') bool? popular,
    @Query('terminal') String? terminal,
    @Query('scope') String? scope,
  });

  /// Raw JSON body; parsed in a background isolate in the services repository.
  @GET('${ApiProvidersVersions.apiVersion}/locations/services/')
  Future<String> getServicesRaw({
    @Query('currency') String? currency,
    @Query('iataCode') String? iataCode,
    @Query('popular') bool? popular,
    @Query('terminal') String? terminal,
    @Query('scope') String? scope,
  });

  /// Private jet catalog. `currency` and `lang` for guests are attached by interceptors.
  @GET('${ApiProvidersVersions.apiVersion}/locations/services/private-jets/')
  Future<PrivateJetsCatalogDto> getPrivateJets({
    @Query('iataCode') String? iataCode,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}

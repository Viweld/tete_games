import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/travelers/travelers_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'travelers_api_provider.g.dart';

@RestApi()
@injectable
abstract class TravelersApiProvider {
  @factoryMethod
  factory TravelersApiProvider(Dio dio) = _TravelersApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/users/profile/passengers/')
  Future<List<TravelerDto>> getTravelers({@Query('lang') String? lang});

  @POST('${ApiProvidersVersions.apiVersion}/users/profile/passengers/')
  Future<TravelerDto> createTravelers({@Body() required dynamic body, @Query('lang') String? lang});

  @GET('${ApiProvidersVersions.apiVersion}/users/profile/passengers/{id}/')
  Future<TravelerDto> getTraveler({@Path('id') required int id, @Query('lang') String? lang});

  @PATCH('${ApiProvidersVersions.apiVersion}/users/profile/passengers/{id}/')
  Future<TravelerDto> updateTraveler({
    @Path('id') required int id,
    @Body() required UpdateTravelerRequestDto body,
    @Query('lang') String? lang,
  });

  @PUT('${ApiProvidersVersions.apiVersion}/users/profile/passengers/{id}/')
  Future<TravelerDto> replaceTraveler({
    @Path('id') required int id,
    @Body() required dynamic body,
    @Query('lang') String? lang,
  });

  @DELETE('${ApiProvidersVersions.apiVersion}/users/profile/passengers/{id}/')
  Future<void> deleteTraveler({@Path('id') required int id, @Query('lang') String? lang});
}

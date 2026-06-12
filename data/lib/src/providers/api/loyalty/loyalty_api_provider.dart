import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:data/src/dtos/loyalty/loyalty_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'loyalty_api_provider.g.dart';

@RestApi()
@injectable
abstract class LoyaltyApiProvider {
  @factoryMethod
  factory LoyaltyApiProvider(Dio dio) = _LoyaltyApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/users/profile/me/loyalty-program/')
  Future<ApiResponse<LoyaltyProgramOverviewDto>> getAuthorizedLoyaltyProgramOverview();

  @GET('${ApiProvidersVersions.apiVersion}/users/config/loyalty-levels/')
  Future<ApiResponse<List<LoyaltyLevelDto>>> getPublicLoyaltyLevels();
}

import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/conditions/conditions_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'conditions_api_provider.g.dart';

@RestApi()
@injectable
abstract class ConditionsApiProvider {
  @factoryMethod
  factory ConditionsApiProvider(Dio dio) = _ConditionsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/locations/conditions/')
  Future<List<ConditionGroupDto>> getConditions({@Query('lang') String? lang});
}

import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'example_api_provider.g.dart';

@RestApi()
@injectable
abstract class ExampleApiProvider {
  @factoryMethod
  factory ExampleApiProvider(Dio dio) = _ExampleApiProvider;

  @POST('${ApiProvidersVersions.apiVersion}/examplePath')
  Future<void> exampleMethod();
}

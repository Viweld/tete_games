import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/documents/documents_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'documents_api_provider.g.dart';

@RestApi()
@injectable
abstract class DocumentsApiProvider {
  @factoryMethod
  factory DocumentsApiProvider(Dio dio) = _DocumentsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/info/pages/')
  Future<List<DocPageDto>> getDocuments({@Query('lang') String? lang});

  @GET('${ApiProvidersVersions.apiVersion}/info/pages/{slug}/')
  Future<DocPageDto> getDocDetails(@Path('slug') String slug, {@Query('lang') String? lang});
}

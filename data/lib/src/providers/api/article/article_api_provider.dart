import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'article_api_provider.g.dart';

@RestApi()
@injectable
abstract class ArticleApiProvider {
  @factoryMethod
  factory ArticleApiProvider(Dio dio) = _ArticleApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/info/articles/')
  Future<ApiPaginatedResponse<ArticleDto>> getArticles({
    @Query('lang') String? lang,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('search') String? search,
    @Query('popular') String? popular,
  });

  @GET('${ApiProvidersVersions.apiVersion}/info/articles/{id}/')
  Future<ArticleDetailDto> getArticleDetail({
    @Path('id') required int id,
    @Query('lang') String? lang,
  });
}

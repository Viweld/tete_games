part of '../repositories.dart';

@LazySingleton(as: ArticleRepository)
class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  const ArticleRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<PaginatedList<Article>> getArticles({
    String? lang,
    int? page,
    int? limit,
    String? search,
    bool? popular,
  }) async {
    final ApiPaginatedResponse<ArticleDto> response = await _apiCallWrapper.call(
      () => _provider.getArticles(
        lang: lang,
        page: page,
        limit: limit,
        search: search,
        popular: popular == true ? 'true' : null,
      ),
    );

    return response.toModel((ArticleDto dto) => dto.toModel);
  }

  @override
  Future<ArticleDetail> getArticleDetail({required int id, String? lang}) async {
    final ArticleDetailDto response = await _apiCallWrapper.call(
      () => _provider.getArticleDetail(id: id, lang: lang),
    );

    return response.toModel;
  }
}

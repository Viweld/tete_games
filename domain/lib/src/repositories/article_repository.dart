part of 'repositories.dart';

abstract interface class ArticleRepository {
  Future<PaginatedList<Article>> getArticles({
    String? lang,
    int? page,
    int? limit,
    String? search,
    bool? popular,
  });

  Future<ArticleDetail> getArticleDetail({required int id, String? lang});
}

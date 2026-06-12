part of 'info.dart';

@immutable
class ArticleBody {
  const ArticleBody({
    required this.id,
    required this.order,
    required this.content,
    this.images = const <ArticleImage>[],
  });

  final int id;
  final int order;
  final String content;
  final List<ArticleImage>? images;
}

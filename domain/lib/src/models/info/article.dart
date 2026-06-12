part of 'info.dart';

@immutable
class Article {
  const Article({
    required this.id,
    required this.title,
    this.summary,
    this.coverImage,
    required this.isPopular,
    this.popularityScore,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String? summary;
  final ArticleImageCover? coverImage;
  final bool isPopular;
  final int? popularityScore;
  final DateTime createdAt;
  final DateTime updatedAt;
}

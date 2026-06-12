part of 'info.dart';

@immutable
class ArticleDetail {
  const ArticleDetail({
    required this.id,
    required this.title,
    this.summary,
    required this.coverImage,
    this.isPopular,
    this.popularityScore,
    required this.createdAt,
    required this.updatedAt,
    required this.bodies,
    required this.carouselImages,
  });

  final int id;
  final String title;
  final String? summary;
  final ArticleImageCover? coverImage;
  final bool? isPopular;
  final int? popularityScore;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ArticleBody> bodies;
  final List<ArticleImage> carouselImages;
}

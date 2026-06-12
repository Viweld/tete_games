part of '../article_dtos.dart';

@JsonSerializable(createToJson: false)
class ArticleDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'summary')
  final String? summary;

  @JsonKey(name: 'cover_image')
  final ArticleImageCoverDto? coverImage;

  @JsonKey(name: 'is_popular')
  final bool isPopular;

  @JsonKey(name: 'popularity_score')
  final int? popularityScore;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const ArticleDto({
    required this.id,
    required this.title,
    this.summary,
    this.coverImage,
    required this.isPopular,
    this.popularityScore,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => _$ArticleDtoFromJson(json);
}

part of '../article_dtos.dart';

@JsonSerializable(createToJson: false)
class ArticleDetailDto {
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

  @JsonKey(name: 'popularit_score')
  final int? popularityScore;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'bodies')
  final List<ArticleBodyDto> bodies;

  @JsonKey(name: 'carousel_images')
  final List<ArticleImageDto>? carouselImages;

  const ArticleDetailDto({
    required this.id,
    required this.title,
    this.summary,
    this.coverImage,
    required this.isPopular,
    this.popularityScore,
    required this.createdAt,
    required this.updatedAt,
    required this.bodies,
    required this.carouselImages,
  });

  factory ArticleDetailDto.fromJson(Map<String, dynamic> json) => _$ArticleDetailDtoFromJson(json);
}

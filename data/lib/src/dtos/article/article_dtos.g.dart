// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleBodyDto _$ArticleBodyDtoFromJson(Map<String, dynamic> json) =>
    ArticleBodyDto(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num?)?.toInt(),
      content: json['content'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ArticleImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ArticleDetailDto _$ArticleDetailDtoFromJson(Map<String, dynamic> json) =>
    ArticleDetailDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      summary: json['summary'] as String?,
      coverImage: json['cover_image'] == null
          ? null
          : ArticleImageCoverDto.fromJson(
              json['cover_image'] as Map<String, dynamic>,
            ),
      isPopular: json['is_popular'] as bool,
      popularityScore: (json['popularit_score'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      bodies: (json['bodies'] as List<dynamic>)
          .map((e) => ArticleBodyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      carouselImages: (json['carousel_images'] as List<dynamic>?)
          ?.map((e) => ArticleImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ArticleImageCoverDto _$ArticleImageCoverDtoFromJson(
  Map<String, dynamic> json,
) => ArticleImageCoverDto(
  original: json['original'] as String?,
  large: json['large'] as String?,
  medium: json['medium'] as String?,
  small: json['small'] as String?,
);

ArticleImageDto _$ArticleImageDtoFromJson(Map<String, dynamic> json) =>
    ArticleImageDto(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      image: json['image'] == null
          ? null
          : ArticleImageCoverDto.fromJson(
              json['image'] as Map<String, dynamic>,
            ),
    );

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  summary: json['summary'] as String?,
  coverImage: json['cover_image'] == null
      ? null
      : ArticleImageCoverDto.fromJson(
          json['cover_image'] as Map<String, dynamic>,
        ),
  isPopular: json['is_popular'] as bool,
  popularityScore: (json['popularity_score'] as num?)?.toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

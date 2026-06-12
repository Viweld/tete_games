// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationReviewDto _$LocationReviewDtoFromJson(Map<String, dynamic> json) =>
    LocationReviewDto(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String?,
      text: json['text'] as String?,
      region: json['region'] as String?,
      rating: json['rating'] as String?,
      categorySlug: json['category_slug'] as String?,
      categoryName: json['category_name'] as String?,
      createdAt: json['created_at'] as String?,
    );

MarketingTagDto _$MarketingTagDtoFromJson(Map<String, dynamic> json) =>
    MarketingTagDto(
      label: json['label'] as String?,
      bgColor: json['bg_color'] as String?,
      textColor: json['text_color'] as String?,
    );

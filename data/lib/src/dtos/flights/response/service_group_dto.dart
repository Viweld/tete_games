part of '../flights_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class ServiceGroupDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'ordering')
  final int? ordering;

  @JsonKey(name: 'is_price_on_request')
  final bool? isPriceOnRequest;

  @JsonKey(name: 'icons')
  final VectorImageDto? icons;

  @JsonKey(name: 'guides')
  final List<ServiceGuideDto>? guides;

  @JsonKey(name: 'items')
  final List<ServiceDto>? items;

  @JsonKey(name: 'image')
  final PhotoDto? image;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'seo_title')
  final String? seoTitle;

  @JsonKey(name: 'seo_description')
  final String? seoDescription;

  @JsonKey(name: 'working_hours_text')
  final String? workingHoursText;

  @JsonKey(name: 'rating')
  final String? rating;

  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;

  @JsonKey(name: 'starting_from')
  final MoneyDto? startingFrom;

  @JsonKey(name: 'starting_from_auto_enabled')
  final bool? startingFromAutoEnabled;

  @JsonKey(name: 'tag')
  final MarketingTagDto? tag;

  @JsonKey(name: 'reviews')
  final List<LocationReviewDto>? reviews;

  @JsonKey(name: 'main_guide_id')
  final int? mainGuideId;

  const ServiceGroupDto({
    required this.id,
    this.slug,
    this.name,
    this.ordering,
    this.isPriceOnRequest,
    this.icons,
    this.guides,
    this.items,
    this.image,
    this.description,
    this.seoTitle,
    this.seoDescription,
    this.workingHoursText,
    this.rating,
    this.reviewsCount,
    this.startingFrom,
    this.startingFromAutoEnabled,
    this.tag,
    this.reviews,
    this.mainGuideId,
  });

  factory ServiceGroupDto.fromJson(Map<String, dynamic> json) => _$ServiceGroupDtoFromJson(json);
}

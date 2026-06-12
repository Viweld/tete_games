part of 'common_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class LocationReviewDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'nickname')
  final String? nickname;

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'region')
  final String? region;

  @JsonKey(name: 'rating')
  final String? rating;

  @JsonKey(name: 'category_slug')
  final String? categorySlug;

  @JsonKey(name: 'category_name')
  final String? categoryName;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const LocationReviewDto({
    required this.id,
    this.nickname,
    this.text,
    this.region,
    this.rating,
    this.categorySlug,
    this.categoryName,
    this.createdAt,
  });

  factory LocationReviewDto.fromJson(Map<String, dynamic> json) =>
      _$LocationReviewDtoFromJson(json);
}

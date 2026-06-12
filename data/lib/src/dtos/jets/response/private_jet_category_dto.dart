part of '../jets_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PrivateJetCategoryDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'seo_title')
  final String? seoTitle;

  @JsonKey(name: 'seo_description')
  final String? seoDescription;

  @JsonKey(name: 'working_hours_text')
  final String? workingHoursText;

  @JsonKey(name: 'tag')
  final MarketingTagDto? tag;

  @JsonKey(name: 'url_path')
  final String? urlPath;

  const PrivateJetCategoryDto({
    required this.id,
    this.name,
    this.slug,
    this.description,
    this.seoTitle,
    this.seoDescription,
    this.workingHoursText,
    this.tag,
    this.urlPath,
  });

  factory PrivateJetCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateJetCategoryDtoFromJson(json);
}

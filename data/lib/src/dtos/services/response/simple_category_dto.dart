part of '../services_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SimpleCategoryDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final PhotoDto? image;

  const SimpleCategoryDto({required this.id, this.name, this.slug, this.image});

  factory SimpleCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SimpleCategoryDtoFromJson(json);
}

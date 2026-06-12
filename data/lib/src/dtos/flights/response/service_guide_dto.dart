part of '../flights_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class ServiceGuideDto {
  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'color')
  final String? color;

  @JsonKey(name: 'ordering')
  final int? ordering;

  @JsonKey(name: 'render_variant')
  final String? renderVariant;

  @JsonKey(name: 'is_main')
  final bool? isMain;

  const ServiceGuideDto({
    this.title,
    this.description,
    this.color,
    this.ordering,
    this.renderVariant,
    this.isMain,
  });

  factory ServiceGuideDto.fromJson(Map<String, dynamic> json) => _$ServiceGuideDtoFromJson(json);
}

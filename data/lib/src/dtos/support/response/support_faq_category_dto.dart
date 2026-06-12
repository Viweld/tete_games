part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
class SupportFaqCategoryDto {
  final int id;
  final String name;
  final String slug;
  final List<SupportFaqItemDto> items;

  const SupportFaqCategoryDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.items,
  });

  factory SupportFaqCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SupportFaqCategoryDtoFromJson(json);
}

part of '../jets_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PrivateJetsCatalogDto {
  @JsonKey(name: 'category')
  final PrivateJetCategoryDto? category;

  @JsonKey(name: 'guides')
  final List<ServiceGuideDto>? guides;

  @JsonKey(name: 'jets')
  final List<PrivateJetDto>? jets;

  @JsonKey(name: 'pagination')
  final PrivateJetsPaginationDto? pagination;

  const PrivateJetsCatalogDto({this.category, this.guides, this.jets, this.pagination});

  factory PrivateJetsCatalogDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateJetsCatalogDtoFromJson(json);
}

part of '../api_core_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PaginationDto {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total')
  final int total;

  const PaginationDto({required this.page, required this.perPage, required this.total});

  factory PaginationDto.fromJson(Map<String, dynamic> json) => _$PaginationDtoFromJson(json);
}

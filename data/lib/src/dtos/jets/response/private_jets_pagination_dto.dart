part of '../jets_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PrivateJetsPaginationDto {
  @JsonKey(name: 'count')
  final int? count;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'previous')
  final String? previous;

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'limit')
  final int? limit;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  const PrivateJetsPaginationDto({
    this.count,
    this.next,
    this.previous,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory PrivateJetsPaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateJetsPaginationDtoFromJson(json);
}

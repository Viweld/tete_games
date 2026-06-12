part of '../api_core_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class ApiResponseMeta {
  @JsonKey(name: 'pagination')
  final PaginationDto pagination;

  const ApiResponseMeta({required this.pagination});

  factory ApiResponseMeta.fromJson(Map<String, dynamic> json) => _$ApiResponseMetaFromJson(json);
}

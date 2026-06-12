part of '../api_core_dtos.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
@immutable
class ApiResponse<T> {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final T data;

  @JsonKey(name: 'meta')
  final ApiResponseMeta? meta;

  const ApiResponse({required this.success, required this.data, this.meta});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

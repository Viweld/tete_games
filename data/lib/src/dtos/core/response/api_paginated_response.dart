part of '../api_core_dtos.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
@immutable
class ApiPaginatedResponse<T> {
  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'previous')
  final String? previous;

  @JsonKey(name: 'results')
  final List<T> results;

  const ApiPaginatedResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ApiPaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiPaginatedResponseFromJson(json, fromJsonT);
}

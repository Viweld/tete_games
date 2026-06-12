// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_core_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPaginatedResponse<T> _$ApiPaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiPaginatedResponse<T>(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
);

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponse<T>(
  success: json['success'] as bool,
  data: fromJsonT(json['data']),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

ApiResponseMeta _$ApiResponseMetaFromJson(Map<String, dynamic> json) =>
    ApiResponseMeta(
      pagination: PaginationDto.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

CountryFlagDto _$CountryFlagDtoFromJson(Map<String, dynamic> json) =>
    CountryFlagDto(
      original: json['original'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );

MoneyDto _$MoneyDtoFromJson(Map<String, dynamic> json) =>
    MoneyDto(amount: json['amount'], currency: json['currency'] as String?);

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
  original: json['original'] as String?,
  large: json['large'] as String?,
  medium: json['medium'] as String?,
  small: json['small'] as String?,
);

VectorImageDto _$VectorImageDtoFromJson(Map<String, dynamic> json) =>
    VectorImageDto(
      original: json['original'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );

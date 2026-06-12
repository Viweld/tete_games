// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) => CountryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  isoCode: json['iso_code'] as String,
);

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
  code: json['code'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String?,
);

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => LanguageDto(
  code: json['code'] as String,
  name: json['name'] as String,
  icons: json['icons'] == null
      ? null
      : VectorImageDto.fromJson(json['icons'] as Map<String, dynamic>),
);

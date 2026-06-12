part of '../reference_data_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class CurrencyDto {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'name')
  final String? name;

  const CurrencyDto({required this.code, required this.symbol, this.name});

  static CurrencyDto fromJson(Object json) => _$CurrencyDtoFromJson(json as Map<String, dynamic>);
}

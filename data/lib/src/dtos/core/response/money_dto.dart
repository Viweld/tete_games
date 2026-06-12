part of '../api_core_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class MoneyDto {
  @JsonKey(name: 'amount')
  final Object? amount;

  @JsonKey(name: 'currency')
  final String? currency;

  const MoneyDto({this.amount, this.currency});

  factory MoneyDto.fromJson(Map<String, dynamic> json) => _$MoneyDtoFromJson(json);
}

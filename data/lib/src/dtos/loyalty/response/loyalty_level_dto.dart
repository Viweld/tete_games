part of '../loyalty_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class LoyaltyLevelDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'rank')
  final int rank;
  @JsonKey(name: 'min_spend_usd')
  final String minSpendUsd;
  @JsonKey(name: 'cashback_percent')
  final String cashbackPercent;
  @JsonKey(name: 'icon_color_url')
  final String? iconColorUrl;
  @JsonKey(name: 'icon_mono_url')
  final String? iconMonoUrl;
  @JsonKey(name: 'is_current')
  final bool? isCurrent;
  @JsonKey(name: 'is_unlocked')
  final bool? isUnlocked;
  @JsonKey(name: 'amount_to_unlock')
  final double? amountToUnlock;

  const LoyaltyLevelDto({
    required this.id,
    required this.name,
    required this.rank,
    required this.minSpendUsd,
    required this.cashbackPercent,
    this.iconColorUrl,
    this.iconMonoUrl,
    this.isCurrent,
    this.isUnlocked,
    this.amountToUnlock,
  });

  static LoyaltyLevelDto fromJson(Object json) =>
      _$LoyaltyLevelDtoFromJson(json as Map<String, dynamic>);
}

part of '../profile_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class UserLoyaltyLevelDto {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'rank')
  final int rank;
  @JsonKey(name: 'min_spend_usd')
  final String minSpendUsd;
  @JsonKey(name: 'cashback_percent')
  final String cashbackPercent;
  @JsonKey(name: 'image')
  @LoyaltyLevelImageConverter()
  final PhotoDto? image;
  @JsonKey(name: 'icon_color', readValue: LoyaltyLevelIconConverters.readIconColor)
  final String? iconColor;
  @JsonKey(name: 'icon_mono', readValue: LoyaltyLevelIconConverters.readIconMono)
  final String? iconMono;

  const UserLoyaltyLevelDto({
    required this.name,
    required this.rank,
    required this.minSpendUsd,
    required this.cashbackPercent,
    this.image,
    this.iconColor,
    this.iconMono,
  });

  factory UserLoyaltyLevelDto.fromJson(Map<String, dynamic> json) =>
      _$UserLoyaltyLevelDtoFromJson(json);
}

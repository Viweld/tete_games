part of '../profile_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class UserLoyaltyInfoDto {
  @JsonKey(name: 'current_level')
  final UserLoyaltyLevelDto? currentLevel;
  @JsonKey(name: 'next_level')
  final UserLoyaltyLevelDto? nextLevel;
  @JsonKey(name: 'total_spend_usd', fromJson: JsonNumConverters.doubleFromJson)
  final double totalSpendUsd;
  @JsonKey(name: 'amount_to_next_level', fromJson: JsonNumConverters.doubleFromJson)
  final double amountToNextLevel;
  @JsonKey(name: 'progress_percent', fromJson: JsonNumConverters.doubleFromJson)
  final double progressPercent;

  const UserLoyaltyInfoDto({
    this.currentLevel,
    this.nextLevel,
    required this.totalSpendUsd,
    required this.amountToNextLevel,
    required this.progressPercent,
  });

  factory UserLoyaltyInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserLoyaltyInfoDtoFromJson(json);
}

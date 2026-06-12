part of '../loyalty_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class LoyaltyProgramOverviewDto {
  @JsonKey(name: 'bonus_balance')
  final double bonusBalance;
  @JsonKey(name: 'total_spend_usd')
  final double totalSpendUsd;
  @JsonKey(name: 'current_level')
  final LoyaltyLevelDto? currentLevel;
  @JsonKey(name: 'next_level')
  final LoyaltyLevelDto? nextLevel;
  @JsonKey(name: 'current_cashback_percent')
  final double currentCashbackPercent;
  @JsonKey(name: 'amount_to_next_level')
  final double amountToNextLevel;
  @JsonKey(name: 'progress_percent')
  final double progressPercent;
  @JsonKey(name: 'levels')
  final List<LoyaltyLevelDto> levels;

  const LoyaltyProgramOverviewDto({
    required this.bonusBalance,
    required this.totalSpendUsd,
    this.currentLevel,
    this.nextLevel,
    required this.currentCashbackPercent,
    required this.amountToNextLevel,
    required this.progressPercent,
    required this.levels,
  });

  static LoyaltyProgramOverviewDto fromJson(Object json) =>
      _$LoyaltyProgramOverviewDtoFromJson(json as Map<String, dynamic>);
}

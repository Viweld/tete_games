part of 'loyalty_mappers.dart';

extension LoyaltyProgramOverviewDtoMapper on LoyaltyProgramOverviewDto {
  LoyaltyProgramOverview get toModel => LoyaltyProgramOverview(
    bonusBalance: bonusBalance,
    totalSpendUsd: totalSpendUsd,
    currentLevel: currentLevel?.toModel,
    nextLevel: nextLevel?.toModel,
    currentCashbackPercent: currentCashbackPercent,
    amountToNextLevel: amountToNextLevel,
    progressPercent: progressPercent,
    levels: levels.map((LoyaltyLevelDto e) => e.toModel).toList(),
  );
}

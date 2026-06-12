part of 'loyalty.dart';

@immutable
class LoyaltyProgramOverview {
  final double bonusBalance;
  final double totalSpendUsd;
  final LoyaltyLevel? currentLevel;
  final LoyaltyLevel? nextLevel;
  final double currentCashbackPercent;
  final double amountToNextLevel;
  final double progressPercent;
  final List<LoyaltyLevel> levels;

  const LoyaltyProgramOverview({
    required this.bonusBalance,
    required this.totalSpendUsd,
    this.currentLevel,
    this.nextLevel,
    required this.currentCashbackPercent,
    required this.amountToNextLevel,
    required this.progressPercent,
    required this.levels,
  });
}

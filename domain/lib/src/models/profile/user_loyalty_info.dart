part of 'profile.dart';

@immutable
class UserLoyaltyInfo {
  final UserLoyaltyLevel? currentLevel;
  final UserLoyaltyLevel? nextLevel;
  final double totalSpendUsd;
  final double amountToNextLevel;
  final double progressPercent;

  const UserLoyaltyInfo({
    this.currentLevel,
    this.nextLevel,
    required this.totalSpendUsd,
    required this.amountToNextLevel,
    required this.progressPercent,
  });
}

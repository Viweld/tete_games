part of 'loyalty.dart';

@immutable
class LoyaltyLevel {
  final int id;
  final String name;
  final int rank;
  final double minSpendUsd;
  final double cashbackPercent;
  final String? iconColorUrl;
  final String? iconMonoUrl;
  final bool? isCurrent;
  final bool? isUnlocked;
  final double? amountToUnlock;

  const LoyaltyLevel({
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
}

part of 'profile.dart';

@immutable
class UserLoyaltyLevel {
  final String name;
  final int rank;
  final double minSpendUsd;
  final double cashbackPercent;
  final Photo? image;
  final String? iconColor;
  final String? iconMono;

  const UserLoyaltyLevel({
    required this.name,
    required this.rank,
    required this.minSpendUsd,
    required this.cashbackPercent,
    this.image,
    this.iconColor,
    this.iconMono,
  });
}

import 'package:meta/meta.dart';

@immutable
class BonusReceipt {
  final double? pointsDelta;
  final double orderPointsUsed;
  final double orderCashbackToEarn;
  final double currentUserBonusBalance;

  const BonusReceipt({
    this.pointsDelta,
    required this.orderPointsUsed,
    required this.orderCashbackToEarn,
    required this.currentUserBonusBalance,
  });
}

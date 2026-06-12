part of 'transactions_mappers.dart';

extension BonusReceiptDtoMapper on BonusReceiptDto {
  BonusReceipt get toModel => BonusReceipt(
    pointsDelta: pointsDelta,
    orderPointsUsed: orderPointsUsed ?? 0.0,
    orderCashbackToEarn: orderCashbackToEarn ?? 0.0,
    currentUserBonusBalance: currentUserBonusBalance ?? 0.0,
  );
}

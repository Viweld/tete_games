part of 'loyalty_mappers.dart';

extension LoyaltyLevelDtoMapper on LoyaltyLevelDto {
  LoyaltyLevel get toModel => LoyaltyLevel(
    id: id,
    name: name,
    rank: rank,
    minSpendUsd: double.tryParse(minSpendUsd) ?? 0.0,
    cashbackPercent: double.tryParse(cashbackPercent) ?? 0.0,
    iconColorUrl: iconColorUrl,
    iconMonoUrl: iconMonoUrl,
    isCurrent: isCurrent,
    isUnlocked: isUnlocked,
    amountToUnlock: amountToUnlock,
  );
}

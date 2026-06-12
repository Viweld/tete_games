part of 'profile_mappers.dart';

extension UserLoyaltyInfoDtoMapper on UserLoyaltyInfoDto {
  UserLoyaltyInfo get toModel => UserLoyaltyInfo(
    currentLevel: currentLevel?.toModel,
    nextLevel: nextLevel?.toModel,
    totalSpendUsd: totalSpendUsd,
    amountToNextLevel: amountToNextLevel,
    progressPercent: progressPercent,
  );
}

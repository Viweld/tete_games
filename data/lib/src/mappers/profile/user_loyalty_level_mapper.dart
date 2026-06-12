part of 'profile_mappers.dart';

extension UserLoyaltyLevelDtoMapper on UserLoyaltyLevelDto {
  UserLoyaltyLevel get toModel => UserLoyaltyLevel(
    name: name,
    rank: rank,
    minSpendUsd: double.tryParse(minSpendUsd) ?? 0.0,
    cashbackPercent: double.tryParse(cashbackPercent) ?? 0.0,
    image: image?.toModel,
    iconColor: iconColor,
    iconMono: iconMono,
  );
}

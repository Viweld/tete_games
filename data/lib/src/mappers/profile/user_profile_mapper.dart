part of 'profile_mappers.dart';

extension UserProfileDtoMapper on UserProfileDto {
  UserProfile get toModel => UserProfile(
    id: id,
    cardId: cardId,
    email: email,
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    dateOfBirth: dateOfBirth != null ? DateTime.tryParse(dateOfBirth!) : null,
    gender: mapGenderFromApi(gender),
    citizenshipInfo: citizenshipInfo?.toModel,
    isEmailVerified: isEmailVerified,
    avatar: avatar?.toModel,
    languageCode: languageCode,
    currencyCode: currencyCode,
    notificationSettings: notificationSettings is Map<String, dynamic>
        ? notificationSettings as Map<String, dynamic>
        : null,
    bonusBalance: bonusBalance,
    bonusBalanceUsd: bonusBalanceUsd,
    pointExchangeRateUsd: pointExchangeRateUsd,
    totalSpendUsd: double.tryParse(totalSpendUsd) ?? 0,
    loyaltyInfo: loyaltyInfo?.toModel,
  );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      id: (json['id'] as num).toInt(),
      cardId: json['card_id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      citizenshipInfo: json['citizenship_info'] == null
          ? null
          : CountryDto.fromJson(
              json['citizenship_info'] as Map<String, dynamic>,
            ),
      isEmailVerified: json['is_email_verified'] as bool,
      avatar: json['avatar'] == null
          ? null
          : PhotoDto.fromJson(json['avatar'] as Map<String, dynamic>),
      languageCode: json['language'] as String?,
      currencyCode: json['currency'] as String?,
      notificationSettings: json['notification_settings'],
      bonusBalance: json['bonus_balance'] == null
          ? 0
          : JsonNumConverters.intFromJson(json['bonus_balance']),
      bonusBalanceUsd: json['bonus_balance_usd'] == null
          ? 0
          : JsonNumConverters.doubleFromJson(json['bonus_balance_usd']),
      pointExchangeRateUsd: json['point_exchange_rate_usd'] == null
          ? 0
          : JsonNumConverters.doubleFromJson(json['point_exchange_rate_usd']),
      totalSpendUsd: json['total_spend_usd'] == null
          ? '0'
          : JsonNumConverters.stringFromJson(json['total_spend_usd']),
      loyaltyInfo: json['loyalty_info'] == null
          ? null
          : UserLoyaltyInfoDto.fromJson(
              json['loyalty_info'] as Map<String, dynamic>,
            ),
    );

UserLoyaltyInfoDto _$UserLoyaltyInfoDtoFromJson(Map<String, dynamic> json) =>
    UserLoyaltyInfoDto(
      currentLevel: json['current_level'] == null
          ? null
          : UserLoyaltyLevelDto.fromJson(
              json['current_level'] as Map<String, dynamic>,
            ),
      nextLevel: json['next_level'] == null
          ? null
          : UserLoyaltyLevelDto.fromJson(
              json['next_level'] as Map<String, dynamic>,
            ),
      totalSpendUsd: JsonNumConverters.doubleFromJson(json['total_spend_usd']),
      amountToNextLevel: JsonNumConverters.doubleFromJson(
        json['amount_to_next_level'],
      ),
      progressPercent: JsonNumConverters.doubleFromJson(
        json['progress_percent'],
      ),
    );

UserLoyaltyLevelDto _$UserLoyaltyLevelDtoFromJson(Map<String, dynamic> json) =>
    UserLoyaltyLevelDto(
      name: json['name'] as String,
      rank: (json['rank'] as num).toInt(),
      minSpendUsd: json['min_spend_usd'] as String,
      cashbackPercent: json['cashback_percent'] as String,
      image: const LoyaltyLevelImageConverter().fromJson(json['image']),
      iconColor:
          LoyaltyLevelIconConverters.readIconColor(json, 'icon_color')
              as String?,
      iconMono:
          LoyaltyLevelIconConverters.readIconMono(json, 'icon_mono') as String?,
    );

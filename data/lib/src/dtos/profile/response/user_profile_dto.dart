part of '../profile_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class UserProfileDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'card_id')
  final String cardId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'citizenship_info')
  final CountryDto? citizenshipInfo;
  @JsonKey(name: 'is_email_verified')
  final bool isEmailVerified;
  @JsonKey(name: 'avatar')
  final PhotoDto? avatar;
  @JsonKey(name: 'language')
  final String? languageCode;
  @JsonKey(name: 'currency')
  final String? currencyCode;
  @JsonKey(name: 'notification_settings')
  final dynamic notificationSettings;
  @JsonKey(name: 'bonus_balance', fromJson: JsonNumConverters.intFromJson)
  final int bonusBalance;
  @JsonKey(name: 'bonus_balance_usd', fromJson: JsonNumConverters.doubleFromJson)
  final double bonusBalanceUsd;
  @JsonKey(name: 'point_exchange_rate_usd', fromJson: JsonNumConverters.doubleFromJson)
  final double pointExchangeRateUsd;
  @JsonKey(name: 'total_spend_usd', fromJson: JsonNumConverters.stringFromJson)
  final String totalSpendUsd;
  @JsonKey(name: 'loyalty_info')
  final UserLoyaltyInfoDto? loyaltyInfo;

  const UserProfileDto({
    required this.id,
    required this.cardId,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.citizenshipInfo,
    required this.isEmailVerified,
    this.avatar,
    this.languageCode,
    this.currencyCode,
    this.notificationSettings,
    this.bonusBalance = 0,
    this.bonusBalanceUsd = 0,
    this.pointExchangeRateUsd = 0,
    this.totalSpendUsd = '0',
    this.loyaltyInfo,
  });

  static UserProfileDto fromJson(Object json) =>
      _$UserProfileDtoFromJson(json as Map<String, dynamic>);
}

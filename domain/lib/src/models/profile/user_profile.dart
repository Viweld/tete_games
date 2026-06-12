part of 'profile.dart';

@immutable
class UserProfile {
  final int id;
  final String cardId;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final DateTime? dateOfBirth;
  final Gender? gender;
  final Country? citizenshipInfo;
  final bool isEmailVerified;
  final Photo? avatar;
  final String? languageCode;
  final String? currencyCode;
  final Map<String, dynamic>? notificationSettings;
  final int bonusBalance;
  final double bonusBalanceUsd;
  final double pointExchangeRateUsd;
  final double totalSpendUsd;
  final UserLoyaltyInfo? loyaltyInfo;

  const UserProfile({
    required this.id,
    required this.cardId,
    required this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.citizenshipInfo,
    this.isEmailVerified = false,
    this.avatar,
    this.languageCode,
    this.currencyCode,
    this.notificationSettings,
    this.bonusBalance = 0,
    this.bonusBalanceUsd = 0,
    this.pointExchangeRateUsd = 0,
    this.totalSpendUsd = 0,
    this.loyaltyInfo,
  });

  String? get userName {
    final List<String> parts = <String>[?firstName, ?lastName];

    return parts.isEmpty ? null : parts.join(' ').trim();
  }
}

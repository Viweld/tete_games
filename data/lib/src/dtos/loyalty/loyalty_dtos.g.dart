// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyLevelDto _$LoyaltyLevelDtoFromJson(Map<String, dynamic> json) =>
    LoyaltyLevelDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      rank: (json['rank'] as num).toInt(),
      minSpendUsd: json['min_spend_usd'] as String,
      cashbackPercent: json['cashback_percent'] as String,
      iconColorUrl: json['icon_color_url'] as String?,
      iconMonoUrl: json['icon_mono_url'] as String?,
      isCurrent: json['is_current'] as bool?,
      isUnlocked: json['is_unlocked'] as bool?,
      amountToUnlock: (json['amount_to_unlock'] as num?)?.toDouble(),
    );

LoyaltyProgramOverviewDto _$LoyaltyProgramOverviewDtoFromJson(
  Map<String, dynamic> json,
) => LoyaltyProgramOverviewDto(
  bonusBalance: (json['bonus_balance'] as num).toDouble(),
  totalSpendUsd: (json['total_spend_usd'] as num).toDouble(),
  currentLevel: json['current_level'] == null
      ? null
      : LoyaltyLevelDto.fromJson(json['current_level'] as Map<String, dynamic>),
  nextLevel: json['next_level'] == null
      ? null
      : LoyaltyLevelDto.fromJson(json['next_level'] as Map<String, dynamic>),
  currentCashbackPercent: (json['current_cashback_percent'] as num).toDouble(),
  amountToNextLevel: (json['amount_to_next_level'] as num).toDouble(),
  progressPercent: (json['progress_percent'] as num).toDouble(),
  levels: (json['levels'] as List<dynamic>)
      .map((e) => LoyaltyLevelDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

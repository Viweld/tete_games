part of '../transactions_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class BonusReceiptDto {
  @JsonKey(name: 'points_delta')
  final double? pointsDelta;
  @JsonKey(name: 'order_points_used')
  final double? orderPointsUsed;
  @JsonKey(name: 'order_cashback_to_earn')
  final double? orderCashbackToEarn;
  @JsonKey(name: 'current_user_bonus_balance')
  final double? currentUserBonusBalance;

  const BonusReceiptDto({
    this.pointsDelta,
    this.orderPointsUsed,
    this.orderCashbackToEarn,
    this.currentUserBonusBalance,
  });

  factory BonusReceiptDto.fromJson(Map<String, dynamic> json) => _$BonusReceiptDtoFromJson(json);
}

part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class CheckoutPaymentResponseDto {
  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'cash_to_pay')
  final String? cashToPay;

  @JsonKey(name: 'points_used')
  final int? pointsUsed;

  @JsonKey(name: 'discount_amount')
  final String? discountAmount;

  @JsonKey(name: 'cashback_to_earn')
  final int? cashbackToEarn;

  @JsonKey(name: 'payment_intent')
  final String? paymentIntent;

  @JsonKey(name: 'customer')
  final String? customer;

  @JsonKey(name: 'ephemeral_key')
  final String? ephemeralKey;

  @JsonKey(name: 'publishable_key')
  final String? publishableKey;

  const CheckoutPaymentResponseDto({
    this.status,
    this.cashToPay,
    this.pointsUsed,
    this.discountAmount,
    this.cashbackToEarn,
    this.paymentIntent,
    this.customer,
    this.ephemeralKey,
    this.publishableKey,
  });

  factory CheckoutPaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutPaymentResponseDtoFromJson(json);
}

part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class FinalizePaymentResponseDto {
  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'reconciled')
  final bool? reconciled;

  @JsonKey(name: 'awaiting_webhook')
  final bool? awaitingWebhook;

  @JsonKey(name: 'payment_intent_id')
  final String? paymentIntentId;

  @JsonKey(name: 'has_payment_transaction')
  final bool? hasPaymentTransaction;

  const FinalizePaymentResponseDto({
    this.status,
    this.reconciled,
    this.awaitingWebhook,
    this.paymentIntentId,
    this.hasPaymentTransaction,
  });

  factory FinalizePaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FinalizePaymentResponseDtoFromJson(json);
}

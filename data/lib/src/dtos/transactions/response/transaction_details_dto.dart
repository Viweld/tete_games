part of '../transactions_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class TransactionDetailsDto extends TransactionDto {
  @JsonKey(name: 'external_id')
  final String? externalId;
  @JsonKey(name: 'order')
  final OrderDto? order;
  @JsonKey(name: 'payment_receipt')
  final PaymentReceiptDto? paymentReceipt;
  @JsonKey(name: 'bonus_receipt')
  final BonusReceiptDto? bonusReceipt;

  const TransactionDetailsDto({
    required super.id,
    super.amount,
    super.amountSign,
    super.signedAmount,
    super.currency,
    super.transactionType,
    super.paymentMethod,
    super.status,
    super.createdAt,
    super.orderRef,
    super.orderId,
    super.description,
    this.externalId,
    this.order,
    this.paymentReceipt,
    this.bonusReceipt,
  });

  factory TransactionDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsDtoFromJson(json);
}

part of '../transactions_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PaymentReceiptDto {
  @JsonKey(name: 'issued_at')
  final String? issuedAt;
  @JsonKey(name: 'transaction_reference')
  final String? transactionReference;
  @JsonKey(name: 'order_reference')
  final String? orderReference;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'amount_sign')
  final String? amountSign;
  @JsonKey(name: 'signed_amount')
  final String? signedAmount;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'description')
  final String? description;

  const PaymentReceiptDto({
    this.issuedAt,
    this.transactionReference,
    this.orderReference,
    this.status,
    this.paymentMethod,
    this.amount,
    this.amountSign,
    this.signedAmount,
    this.currency,
    this.description,
  });

  factory PaymentReceiptDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentReceiptDtoFromJson(json);
}

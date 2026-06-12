part of '../transactions_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class TransactionDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'amount_sign')
  final String? amountSign;

  @JsonKey(name: 'signed_amount')
  final String? signedAmount;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'transaction_type')
  final String? transactionType;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'order_ref')
  final String? orderRef;

  @JsonKey(name: 'order_id')
  final String? orderId;

  @JsonKey(name: 'description')
  final String? description;

  const TransactionDto({
    required this.id,
    this.amount,
    this.amountSign,
    this.signedAmount,
    this.currency,
    this.transactionType,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.orderRef,
    this.orderId,
    this.description,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);
}

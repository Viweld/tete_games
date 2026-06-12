// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    TransactionDto(
      id: (json['id'] as num).toInt(),
      amount: json['amount'] as String?,
      amountSign: json['amount_sign'] as String?,
      signedAmount: json['signed_amount'] as String?,
      currency: json['currency'] as String?,
      transactionType: json['transaction_type'] as String?,
      paymentMethod: json['payment_method'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      orderRef: json['order_ref'] as String?,
      orderId: json['order_id'] as String?,
      description: json['description'] as String?,
    );

TransactionDetailsDto _$TransactionDetailsDtoFromJson(
  Map<String, dynamic> json,
) => TransactionDetailsDto(
  id: (json['id'] as num).toInt(),
  amount: json['amount'] as String?,
  amountSign: json['amount_sign'] as String?,
  signedAmount: json['signed_amount'] as String?,
  currency: json['currency'] as String?,
  transactionType: json['transaction_type'] as String?,
  paymentMethod: json['payment_method'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  orderRef: json['order_ref'] as String?,
  orderId: json['order_id'] as String?,
  description: json['description'] as String?,
  externalId: json['external_id'] as String?,
  order: json['order'] == null
      ? null
      : OrderDto.fromJson(json['order'] as Map<String, dynamic>),
  paymentReceipt: json['payment_receipt'] == null
      ? null
      : PaymentReceiptDto.fromJson(
          json['payment_receipt'] as Map<String, dynamic>,
        ),
  bonusReceipt: json['bonus_receipt'] == null
      ? null
      : BonusReceiptDto.fromJson(json['bonus_receipt'] as Map<String, dynamic>),
);

PaymentReceiptDto _$PaymentReceiptDtoFromJson(Map<String, dynamic> json) =>
    PaymentReceiptDto(
      issuedAt: json['issued_at'] as String?,
      transactionReference: json['transaction_reference'] as String?,
      orderReference: json['order_reference'] as String?,
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      amountSign: json['amount_sign'] as String?,
      signedAmount: json['signed_amount'] as String?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
    );

BonusReceiptDto _$BonusReceiptDtoFromJson(Map<String, dynamic> json) =>
    BonusReceiptDto(
      pointsDelta: (json['points_delta'] as num?)?.toDouble(),
      orderPointsUsed: (json['order_points_used'] as num?)?.toDouble(),
      orderCashbackToEarn: (json['order_cashback_to_earn'] as num?)?.toDouble(),
      currentUserBonusBalance: (json['current_user_bonus_balance'] as num?)
          ?.toDouble(),
    );

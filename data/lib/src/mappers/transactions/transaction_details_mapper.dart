part of 'transactions_mappers.dart';

extension TransactionDetailsDtoMapper on TransactionDetailsDto {
  TransactionDetails get toModel => TransactionDetails(
    id: id,
    amount: double.tryParse(amount ?? '0') ?? 0.0,
    amountSign: amountSign ?? '',
    signedAmount: signedAmount ?? '',
    currency: currency ?? '',
    transactionType: transactionType.toTransactionType,
    paymentMethod: paymentMethod.toPaymentMethod,
    status: status.toTransactionStatus,
    createdAt: createdAt != null
        ? (DateTime.tryParse(createdAt!) ?? DateTime.now())
        : DateTime.now(),
    orderRef: orderRef,
    orderId: orderId,
    description: description,
    externalId: externalId,
    order: order?.toModel,
    paymentReceipt: paymentReceipt?.toModel,
    bonusReceipt: bonusReceipt?.toModel,
  );
}

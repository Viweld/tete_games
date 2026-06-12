part of 'transactions_mappers.dart';

extension TransactionDtoMapper on TransactionDto {
  Transaction get toModel => Transaction(
    id: id,
    amount: double.tryParse(amount ?? '0') ?? 0.0,
    amountSign: amountSign ?? '',
    signedAmount: signedAmount ?? '',
    currency: currency ?? '',
    createdAt: createdAt != null
        ? (DateTime.tryParse(createdAt!) ?? DateTime.now())
        : DateTime.now(),
    orderRef: orderRef,
    orderId: orderId,
    description: description,
    transactionType: transactionType.toTransactionType,
    paymentMethod: paymentMethod.toPaymentMethod,
    status: status.toTransactionStatus,
  );
}

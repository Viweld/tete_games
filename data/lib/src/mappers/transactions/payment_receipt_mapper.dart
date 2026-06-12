part of 'transactions_mappers.dart';

extension PaymentReceiptDtoMapper on PaymentReceiptDto {
  PaymentReceipt get toModel => PaymentReceipt(
    issuedAt: issuedAt != null ? (DateTime.tryParse(issuedAt!) ?? DateTime.now()) : DateTime.now(),
    transactionReference: transactionReference ?? '',
    orderReference: orderReference ?? '',
    status: status.toTransactionStatus,
    paymentMethod: paymentMethod.toPaymentMethod,
    amount: amount ?? 0.0,
    amountSign: amountSign ?? '',
    signedAmount: signedAmount ?? '',
    currency: currency ?? '',
    description: description ?? '',
  );
}

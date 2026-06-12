import 'package:domain/src/models/transactions/payment_method.dart';
import 'package:domain/src/models/transactions/transaction_status.dart';
import 'package:meta/meta.dart';

@immutable
class PaymentReceipt {
  final DateTime issuedAt;
  final String transactionReference;
  final String orderReference;
  final TransactionStatus status;
  final PaymentMethod paymentMethod;
  final double amount;
  final String amountSign;
  final String signedAmount;
  final String currency;
  final String description;

  const PaymentReceipt({
    required this.issuedAt,
    required this.transactionReference,
    required this.orderReference,
    required this.status,
    required this.paymentMethod,
    required this.amount,
    required this.amountSign,
    required this.signedAmount,
    required this.currency,
    required this.description,
  });
}

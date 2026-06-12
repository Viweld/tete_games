import 'package:domain/src/models/transactions/payment_method.dart';
import 'package:domain/src/models/transactions/transaction_status.dart';
import 'package:domain/src/models/transactions/transaction_type.dart';
import 'package:meta/meta.dart';

@immutable
class Transaction {
  final int id;
  final double amount;
  final String amountSign;
  final String signedAmount;
  final String currency;
  final TransactionType transactionType;
  final PaymentMethod paymentMethod;
  final TransactionStatus status;
  final DateTime createdAt;
  final String? orderRef;
  final String? orderId;
  final String? description;

  const Transaction({
    required this.id,
    required this.amount,
    required this.amountSign,
    required this.signedAmount,
    required this.currency,
    required this.transactionType,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    this.orderRef,
    this.orderId,
    this.description,
  });
}

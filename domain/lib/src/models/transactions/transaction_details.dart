import 'package:domain/src/models/ordering/read/ordering_read_models.dart';
import 'package:domain/src/models/transactions/bonus_receipt.dart';
import 'package:domain/src/models/transactions/payment_receipt.dart';
import 'package:domain/src/models/transactions/transaction.dart';
import 'package:meta/meta.dart';

@immutable
class TransactionDetails extends Transaction {
  final String? externalId;
  final OrderDraft? order;
  final PaymentReceipt? paymentReceipt;
  final BonusReceipt? bonusReceipt;

  const TransactionDetails({
    required super.id,
    required super.amount,
    required super.amountSign,
    required super.signedAmount,
    required super.currency,
    required super.transactionType,
    required super.paymentMethod,
    required super.status,
    required super.createdAt,
    super.orderRef,
    super.orderId,
    super.description,
    this.externalId,
    this.order,
    this.paymentReceipt,
    this.bonusReceipt,
  });
}

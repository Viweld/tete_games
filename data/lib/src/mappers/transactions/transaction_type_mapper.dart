part of 'transactions_mappers.dart';

extension TransactionTypeStringMapper on String? {
  TransactionType get toTransactionType => switch (this) {
    'payment' => TransactionType.payment,
    'refund' => TransactionType.refund,
    'deposit' => TransactionType.deposit,
    'adjustment' => TransactionType.adjustment,
    _ => TransactionType.unknown,
  };
}

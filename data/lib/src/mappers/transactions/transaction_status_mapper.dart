part of 'transactions_mappers.dart';

extension TransactionStatusStringMapper on String? {
  TransactionStatus get toTransactionStatus => switch (this) {
    'pending' => TransactionStatus.pending,
    'success' => TransactionStatus.success,
    'failed' => TransactionStatus.failed,
    _ => TransactionStatus.unknown,
  };
}

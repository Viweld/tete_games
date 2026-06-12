part of 'repositories.dart';

abstract class TransactionsRepository {
  Future<List<Transaction>> getAllTransactions();
  Future<List<Transaction>> getPaymentTransactions();
  Future<List<Transaction>> getRefundTransactions();
  Future<List<Transaction>> getBonusTransactions();
  Future<TransactionDetails> getTransactionDetails(int id);
}

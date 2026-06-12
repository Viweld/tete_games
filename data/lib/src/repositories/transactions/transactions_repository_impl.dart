part of '../repositories.dart';

@LazySingleton(as: TransactionsRepository)
class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  TransactionsRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final List<TransactionDto> response = await _apiCallWrapper.call(
      () => _provider.getUserTransactions(typeGroup: 'all'),
    );
    return response.map((TransactionDto e) => e.toModel).toList();
  }

  @override
  Future<List<Transaction>> getPaymentTransactions() async {
    final List<TransactionDto> response = await _apiCallWrapper.call(
      () => _provider.getUserTransactions(typeGroup: 'payments'),
    );
    return response.map((TransactionDto e) => e.toModel).toList();
  }

  @override
  Future<List<Transaction>> getRefundTransactions() async {
    final List<TransactionDto> response = await _apiCallWrapper.call(
      () => _provider.getUserTransactions(typeGroup: 'refunds'),
    );
    return response.map((TransactionDto e) => e.toModel).toList();
  }

  @override
  Future<List<Transaction>> getBonusTransactions() async {
    final List<TransactionDto> response = await _apiCallWrapper.call(
      () => _provider.getUserTransactions(typeGroup: 'bonuses'),
    );
    return response.map((TransactionDto e) => e.toModel).toList();
  }

  @override
  Future<TransactionDetails> getTransactionDetails(int id) async {
    final TransactionDetailsDto response = await _apiCallWrapper.call(
      () => _provider.getTransaction(id: id.toString()),
    );
    return response.toModel;
  }
}

part of 'repositories.dart';

abstract class CurrenciesRepository {
  /// Returns currencies list from the remote source
  Future<List<Currency>> getCurrencies();
}

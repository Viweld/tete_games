part of 'repositories.dart';

abstract class CountriesRepository {
  /// Returns countries list from the remote source
  Future<List<Country>> getCountries();
}

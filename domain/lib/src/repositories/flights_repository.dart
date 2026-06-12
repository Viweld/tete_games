part of 'repositories.dart';

abstract interface class FlightsRepository {
  /// Lookup flight information by flight number and date
  ///
  /// [flightNumber] - Flight number (e.g., 'SU1234')
  /// [date] - Flight date in format 'YYYY-MM-DD'
  /// [currency] - Optional currency code (e.g., 'RUB')
  /// [lang] - Optional language code (e.g., 'ru')
  Future<Flight> lookupFlight({
    required String flightNumber,
    required String date,
    String? currency,
    String? lang,
  });
}

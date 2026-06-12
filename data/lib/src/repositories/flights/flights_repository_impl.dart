part of '../repositories.dart';

@LazySingleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  final FlightsApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  FlightsRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<Flight> lookupFlight({
    required String flightNumber,
    required String date,
    String? currency,
    String? lang,
  }) async {
    try {
      final LookupFlightResponseDto response = await _apiCallWrapper.call(
        () => _provider.lookupFlight(
          flightNumber: flightNumber,
          date: date,
          currency: currency,
          lang: lang,
        ),
      );

      // If response data is null, throw FlightNotFoundException
      if (response.data == null) {
        throw FlightNotFoundException(
          flightNumber: flightNumber,
          date: date,
          message: 'No flight data in response',
        );
      }

      return response.data!.toModel;
    } on OtherException catch (e) {
      if (e.statusCode != 404) rethrow;

      final dynamic responseData = e.body;
      String? message;

      // Try to extract a specific error message if available
      if (responseData is Map<String, dynamic>) {
        final dynamic errorData = responseData['error'];
        if (errorData is String) {
          message = errorData;
        } else if (errorData != null) {
          message = errorData.toString();
        }
      }

      throw FlightNotFoundException(flightNumber: flightNumber, date: date, message: message);
    }
  }
}

part of 'repositories.dart';

abstract interface class AirportDetailRepository {
  Future<AirportDetail> getAirportDetail({
    required String iataCode,
    String? currency,
    String? lang,
  });
}

part of 'ordering_write_models.dart';

class PrivateJetBookingRequest {
  const PrivateJetBookingRequest({
    required this.departureAirport,
    required this.arrivalAirport,
    required this.date,
    required this.passengersCount,
    required this.contactName,
    required this.contactEmail,
    required this.contactPhone,
    this.jetId,
    this.jetModel,
    this.comment,
  });

  final String departureAirport;
  final String arrivalAirport;
  final DateTime date;
  final int passengersCount;
  final int? jetId;
  final String? jetModel;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final String? comment;
}

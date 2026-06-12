part of 'ordering_write_mappers.dart';

extension PrivateJetBookingRequestMapper on PrivateJetBookingRequest {
  PrivateJetBookingRequestDto get toDto => PrivateJetBookingRequestDto(
    departureAirport: departureAirport,
    arrivalAirport: arrivalAirport,
    date: DateFormat('yyyy-MM-dd').format(date),
    passengersCount: passengersCount,
    jetId: jetId,
    jetModel: jetModel,
    contactName: contactName,
    contactEmail: contactEmail,
    contactPhone: contactPhone,
    comment: comment,
  );
}

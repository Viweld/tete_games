part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class PrivateJetBookingRequestDto {
  @JsonKey(name: 'departure_airport')
  final String departureAirport;

  @JsonKey(name: 'arrival_airport')
  final String arrivalAirport;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'passengers_count')
  final int passengersCount;

  @JsonKey(name: 'jet_id')
  final int? jetId;

  @JsonKey(name: 'jet_model')
  final String? jetModel;

  @JsonKey(name: 'contact_name')
  final String contactName;

  @JsonKey(name: 'contact_email')
  final String contactEmail;

  @JsonKey(name: 'contact_phone')
  final String contactPhone;

  @JsonKey(name: 'comment')
  final String? comment;

  const PrivateJetBookingRequestDto({
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

  Map<String, dynamic> toJson() => _$PrivateJetBookingRequestDtoToJson(this);
}

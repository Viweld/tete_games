part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderPassengerDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'citizenship_iso')
  final String? citizenshipIso;

  const OrderPassengerDto({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });

  factory OrderPassengerDto.fromJson(Map<String, dynamic> json) =>
      _$OrderPassengerDtoFromJson(json);
}

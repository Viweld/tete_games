part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateOrderPassengerDto {
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

  const UpdateOrderPassengerDto({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });

  Map<String, dynamic> toJson() => _$UpdateOrderPassengerDtoToJson(this);
}

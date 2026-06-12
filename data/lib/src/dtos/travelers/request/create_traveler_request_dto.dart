part of '../travelers_dtos.dart';

@JsonSerializable(createFactory: false)
@immutable
class CreateTravelerRequestDto {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'citizenship_iso', includeIfNull: false)
  final String? citizenshipIso;

  const CreateTravelerRequestDto({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    this.citizenshipIso,
  });

  Map<String, dynamic> toJson() => _$CreateTravelerRequestDtoToJson(this);
}

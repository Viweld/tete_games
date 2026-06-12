part of '../travelers_dtos.dart';

@JsonSerializable(createFactory: false)
@immutable
class UpdateTravelerRequestDto {
  @JsonKey(name: 'first_name', includeIfNull: false)
  final String? firstName;

  @JsonKey(name: 'last_name', includeIfNull: false)
  final String? lastName;

  @JsonKey(name: 'date_of_birth', includeIfNull: false)
  final String? dateOfBirth;

  @JsonKey(name: 'gender', includeIfNull: false)
  final String? gender;

  @JsonKey(name: 'citizenship_iso', includeIfNull: false)
  final String? citizenshipIso;

  const UpdateTravelerRequestDto({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });

  Map<String, dynamic> toJson() => _$UpdateTravelerRequestDtoToJson(this);
}

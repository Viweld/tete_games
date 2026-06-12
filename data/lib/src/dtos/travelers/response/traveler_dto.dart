part of '../travelers_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class TravelerDto {
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

  @JsonKey(name: 'citizenship_info')
  final CountryDto? citizenshipInfo;

  const TravelerDto({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipInfo,
  });

  factory TravelerDto.fromJson(Map<String, dynamic> json) => _$TravelerDtoFromJson(json);
}

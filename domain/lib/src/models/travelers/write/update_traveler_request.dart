part of 'travelers_write_models.dart';

@immutable
class UpdateTravelerRequest {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final Gender? gender;
  final String? citizenshipIso;

  const UpdateTravelerRequest({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });
}

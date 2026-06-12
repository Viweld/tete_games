part of 'travelers_write_models.dart';

@immutable
class CreateTravelerRequest {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final Gender gender;
  final String? citizenshipIso;

  const CreateTravelerRequest({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    this.citizenshipIso,
  });
}

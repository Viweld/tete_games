part of 'travelers_read_models.dart';

@immutable
class Traveler {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final Gender? gender;
  final Country? citizenshipInfo;

  const Traveler({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipInfo,
  });
}

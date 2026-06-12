part of 'ordering_write_models.dart';

class UpdateOrderPassenger {
  const UpdateOrderPassenger({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });

  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? citizenshipIso;
}

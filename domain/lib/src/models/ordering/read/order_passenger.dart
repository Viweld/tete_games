part of 'ordering_read_models.dart';

@immutable
class OrderPassenger {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final String? citizenshipIso;

  const OrderPassenger({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.citizenshipIso,
  });

  String? get fullName => firstName == null && lastName == null
      ? null
      : <String>[
          if (firstName?.trim().isNotEmpty ?? false) firstName!.trim(),
          if (lastName?.trim().isNotEmpty ?? false) lastName!.trim(),
        ].join(' ');
}

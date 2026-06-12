part of 'ordering_read_models.dart';

@immutable
class OrderAccompanyingPerson {
  final int id;
  final String? firstName;
  final String? lastName;

  const OrderAccompanyingPerson({required this.id, this.firstName, this.lastName});

  String? get fullName => firstName == null && lastName == null
      ? null
      : <String>[
          if (firstName?.trim().isNotEmpty ?? false) firstName!.trim(),
          if (lastName?.trim().isNotEmpty ?? false) lastName!.trim(),
        ].join(' ');
}

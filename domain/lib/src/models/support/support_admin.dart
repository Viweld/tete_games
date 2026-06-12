part of 'support.dart';

@immutable
class SupportAdmin {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? avatar;
  final int? bitrixUserId;

  const SupportAdmin({
    required this.id,
    required this.fullName,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
    this.bitrixUserId,
  });
}

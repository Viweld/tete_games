/// Returns whether [dateOfBirth] is on or before the calendar date that is
/// [minimumAge] full years before [referenceDate] (inclusive minimum age).
bool isAtLeastAgeYearsOld({
  required DateTime dateOfBirth,
  required int minimumAge,
  DateTime? referenceDate,
}) {
  final DateTime reference = referenceDate ?? DateTime.now();
  final DateTime latestAllowedBirthDate = DateTime(
    reference.year - minimumAge,
    reference.month,
    reference.day,
  );

  final DateTime birthDate = DateTime(dateOfBirth.year, dateOfBirth.month, dateOfBirth.day);

  return !birthDate.isAfter(latestAllowedBirthDate);
}

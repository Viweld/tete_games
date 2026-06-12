part of 'profile_mappers.dart';

/// Mapper for converting `Gender` between the domain model and the API.
extension GenderMapper on Gender {
  /// Converts `Gender` enum to an API string ("M" or "F").
  String toApiString() {
    switch (this) {
      case Gender.male:
        return 'M';
      case Gender.female:
        return 'F';
    }
  }
}

/// Helper for converting an API string to `Gender`.
Gender? mapGenderFromApi(String? val) {
  if (val == 'M') return Gender.male;
  if (val == 'F') return Gender.female;
  return null;
}

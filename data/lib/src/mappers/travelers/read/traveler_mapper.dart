part of 'travelers_read_mappers.dart';

extension TravelerDtoMapper on TravelerDto {
  Traveler get toModel {
    String? formattedDob = dateOfBirth;
    if (formattedDob != null && formattedDob.length == 10 && formattedDob.contains('-')) {
      final List<String> parts = formattedDob.split('-');
      if (parts.length == 3) {
        formattedDob = '${parts[2]}.${parts[1]}.${parts[0]}';
      }
    }

    return Traveler(
      id: id,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: formattedDob,
      gender: mapGenderFromApi(gender),
      citizenshipInfo: citizenshipInfo?.toModel,
    );
  }
}

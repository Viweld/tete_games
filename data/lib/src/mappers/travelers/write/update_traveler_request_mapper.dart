part of 'travelers_write_mappers.dart';

extension UpdateTravelerRequestMapper on UpdateTravelerRequest {
  UpdateTravelerRequestDto get toDto {
    String? formattedDob = dateOfBirth;
    if (formattedDob != null && formattedDob.length == 10 && formattedDob.contains('.')) {
      final List<String> parts = formattedDob.split('.');
      if (parts.length == 3) {
        formattedDob = '${parts[2]}-${parts[1]}-${parts[0]}';
      }
    }

    return UpdateTravelerRequestDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: formattedDob,
      gender: gender?.toApiString(),
      citizenshipIso: citizenshipIso,
    );
  }
}

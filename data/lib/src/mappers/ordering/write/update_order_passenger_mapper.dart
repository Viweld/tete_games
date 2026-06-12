part of 'ordering_write_mappers.dart';

extension UpdateOrderPassengerMapper on UpdateOrderPassenger {
  UpdateOrderPassengerDto get toDto {
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return UpdateOrderPassengerDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth != null ? outputFormat.format(dateOfBirth!) : null,
      gender: gender,
      citizenshipIso: citizenshipIso,
    );
  }
}

part of 'ordering_read_mappers.dart';

extension OrderPassengerDtoMapper on OrderPassengerDto {
  OrderPassenger get toModel => OrderPassenger(
    id: id,
    firstName: firstName,
    lastName: lastName,
    dateOfBirth: dateOfBirth,
    gender: gender,
    citizenshipIso: citizenshipIso,
  );
}

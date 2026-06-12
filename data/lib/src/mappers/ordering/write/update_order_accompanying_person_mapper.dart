part of 'ordering_write_mappers.dart';

extension UpdateOrderAccompanyingPersonMapper on UpdateOrderAccompanyingPerson {
  UpdateOrderAccompanyingPersonDto get toDto {
    return UpdateOrderAccompanyingPersonDto(firstName: firstName, lastName: lastName);
  }
}

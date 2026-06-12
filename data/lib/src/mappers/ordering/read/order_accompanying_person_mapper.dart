part of 'ordering_read_mappers.dart';

extension OrderAccompanyingPersonDtoMapper on OrderAccompanyingPersonDto {
  OrderAccompanyingPerson get toModel =>
      OrderAccompanyingPerson(id: id, firstName: firstName, lastName: lastName);
}

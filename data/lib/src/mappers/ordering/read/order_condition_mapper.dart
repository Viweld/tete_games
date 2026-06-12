part of 'ordering_read_mappers.dart';

extension OrderConditionDtoMapper on OrderConditionDto {
  OrderCondition get toModel => OrderCondition(id: id, key: key, title: title, value: value);
}

part of 'ordering_write_mappers.dart';

extension UpdateOrderConditionMapper on UpdateOrderCondition {
  UpdateOrderConditionDto get toDto {
    return UpdateOrderConditionDto(id: id, text: text);
  }
}

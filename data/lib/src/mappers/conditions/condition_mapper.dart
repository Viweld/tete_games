part of 'conditions_mappers.dart';

extension ConditionDtoMapper on ConditionDto {
  Condition get toModel => Condition(id: id, key: key, title: title, needsText: needsText ?? false);
}

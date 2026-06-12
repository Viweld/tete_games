part of '../repositories.dart';

@LazySingleton(as: ConditionsRepository)
class ConditionsRepositoryImpl implements ConditionsRepository {
  final ConditionsApiProvider _apiProvider;
  final ApiCallWrapper _apiCallWrapper;

  ConditionsRepositoryImpl(this._apiProvider, this._apiCallWrapper);

  @override
  Future<List<Condition>> getGeneralOrderConditions() async {
    final List<ConditionGroupDto> groups = await _apiCallWrapper.call(_apiProvider.getConditions);
    final ConditionGroupDto? generalOrderGroup = groups.firstWhereOrNull(
      (ConditionGroupDto group) => group.key == 'general_order',
    );
    return generalOrderGroup?.items?.map((ConditionDto e) => e.toModel).toList() ?? <Condition>[];
  }

  @override
  Future<List<Condition>> getTransferConditions() async {
    final List<ConditionGroupDto> groups = await _apiCallWrapper.call(_apiProvider.getConditions);
    final ConditionGroupDto transferGroup = groups.firstWhere(
      (ConditionGroupDto group) => group.key == 'transfer',
      orElse: () => throw Exception('Transfer group not found'), // Or handle gracefully
    );
    return transferGroup.items?.map((ConditionDto e) => e.toModel).toList() ?? <Condition>[];
  }
}

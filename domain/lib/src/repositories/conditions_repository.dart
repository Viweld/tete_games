part of 'repositories.dart';

abstract class ConditionsRepository {
  Future<List<Condition>> getGeneralOrderConditions();
  Future<List<Condition>> getTransferConditions();
}

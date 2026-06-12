part of 'repositories.dart';

abstract interface class TransfersTypesRepository {
  Future<List<Service>> getTransferTypes();
}

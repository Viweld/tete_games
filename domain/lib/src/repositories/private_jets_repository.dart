part of 'repositories.dart';

abstract interface class PrivateJetsRepository {
  Future<PrivateJetsCatalog> getPrivateJets({String? iataCode, int? page, int? limit});
}

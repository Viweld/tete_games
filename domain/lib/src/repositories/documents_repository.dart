part of 'repositories.dart';

abstract interface class DocumentsRepository {
  Future<List<DocPage>> getDocuments({String? lang});

  Future<DocPage> getDocDetails(String slug, {String? lang});
}

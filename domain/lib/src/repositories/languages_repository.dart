part of 'repositories.dart';

abstract class LanguagesRepository {
  /// Returns languages list from the remote source
  Future<List<Language>> getLanguages();
}

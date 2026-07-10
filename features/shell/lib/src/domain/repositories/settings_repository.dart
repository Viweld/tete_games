abstract interface class SettingsRepository {
  Future<String?> getSavedLanguageCode();

  Future<void> saveLanguageCode(String languageCode);
}

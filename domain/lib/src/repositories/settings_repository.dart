part of 'repositories.dart';

abstract interface class SettingsRepository {
  Future<bool> isInvitationDialogShown();

  Future<void> setInvitationDialogShown();

  Future<String?> getSavedLanguageCode();

  Future<void> saveLanguageCode(String languageCode);

  Future<String?> getSavedCurrencyCode();

  Future<void> saveCurrencyCode(String currencyCode);
}

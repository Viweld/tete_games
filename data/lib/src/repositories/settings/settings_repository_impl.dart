part of '../repositories.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final LocalDataProvider _localDataProvider;

  SettingsRepositoryImpl(this._localDataProvider);

  static const String _isInvitationDialogShownKey = 'is_invitation_dialog_shown';
  static const String _languageCodeKey = 'language_code';
  static const String _currencyCodeKey = 'currency_code';

  @override
  Future<bool> isInvitationDialogShown() async {
    final Object? result = await _localDataProvider.getValue(key: _isInvitationDialogShownKey);
    return result is bool ? result : false;
  }

  @override
  Future<void> setInvitationDialogShown() async {
    await _localDataProvider.setValue(key: _isInvitationDialogShownKey, value: true);
  }

  @override
  Future<String?> getSavedLanguageCode() async {
    final Object? result = await _localDataProvider.getValue(key: _languageCodeKey);
    return result is String ? result : null;
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    await _localDataProvider.setValue(key: _languageCodeKey, value: languageCode);
  }

  @override
  Future<String?> getSavedCurrencyCode() async {
    final Object? result = await _localDataProvider.getValue(key: _currencyCodeKey);
    return result is String ? result : null;
  }

  @override
  Future<void> saveCurrencyCode(String currencyCode) async {
    await _localDataProvider.setValue(key: _currencyCodeKey, value: currencyCode);
  }
}

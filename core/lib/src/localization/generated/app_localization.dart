import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_en.dart';
import 'app_localization_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalization
/// returned by `AppLocalization.of(context)`.
///
/// Applications need to include `AppLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalization.localizationsDelegates,
///   supportedLocales: AppLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalization.supportedLocales
/// property.
abstract class AppLocalization {
  AppLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru'), Locale('en')];

  /// No description provided for @citizenship_search_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию страны'**
  String get citizenship_search_placeholder;

  /// No description provided for @core_back_button.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get core_back_button;

  /// No description provided for @description_validator_overflow_message.
  ///
  /// In ru, this message translates to:
  /// **'Длина описания не должна превышать 300 символов'**
  String get description_validator_overflow_message;

  /// No description provided for @email_validator_invalid_message.
  ///
  /// In ru, this message translates to:
  /// **'Некорректный формат email'**
  String get email_validator_invalid_message;

  /// No description provided for @email_validator_overflow_message.
  ///
  /// In ru, this message translates to:
  /// **'Email не должен превышать 50 символов'**
  String get email_validator_overflow_message;

  /// No description provided for @expandable_text_expand_label.
  ///
  /// In ru, this message translates to:
  /// **'больше'**
  String get expandable_text_expand_label;

  /// No description provided for @expandable_text_fold_label.
  ///
  /// In ru, this message translates to:
  /// **'свернуть'**
  String get expandable_text_fold_label;

  /// No description provided for @name_validator_empty_message.
  ///
  /// In ru, this message translates to:
  /// **'Не может быть пустым'**
  String get name_validator_empty_message;

  /// No description provided for @name_validator_invalid_message.
  ///
  /// In ru, this message translates to:
  /// **'Некорректный формат имени'**
  String get name_validator_invalid_message;

  /// No description provided for @name_validator_overflow_message.
  ///
  /// In ru, this message translates to:
  /// **'Имя не должно превышать 30 символов'**
  String get name_validator_overflow_message;

  /// No description provided for @peer_client_devices_title.
  ///
  /// In ru, this message translates to:
  /// **'Найденные устройства'**
  String get peer_client_devices_title;

  /// No description provided for @peer_client_error_connection.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка подключения'**
  String get peer_client_error_connection;

  /// No description provided for @peer_client_error_discovery.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка запуска поиска'**
  String get peer_client_error_discovery;

  /// No description provided for @peer_client_invitation_rejected_body.
  ///
  /// In ru, this message translates to:
  /// **'Соперник отклонил приглашение'**
  String get peer_client_invitation_rejected_body;

  /// No description provided for @peer_client_invitation_rejected_button.
  ///
  /// In ru, this message translates to:
  /// **'Жаль...'**
  String get peer_client_invitation_rejected_button;

  /// No description provided for @peer_client_invitation_rejected_title.
  ///
  /// In ru, this message translates to:
  /// **'Приглашение отклонено'**
  String get peer_client_invitation_rejected_title;

  /// No description provided for @peer_client_invitation_sent_title.
  ///
  /// In ru, this message translates to:
  /// **'Приглашение отправлено'**
  String get peer_client_invitation_sent_title;

  /// No description provided for @peer_client_invite_button.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить'**
  String get peer_client_invite_button;

  /// No description provided for @peer_client_loading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка...'**
  String get peer_client_loading;

  /// No description provided for @peer_client_our_app_badge.
  ///
  /// In ru, this message translates to:
  /// **'Приложение tete games'**
  String get peer_client_our_app_badge;

  /// No description provided for @peer_client_searching.
  ///
  /// In ru, this message translates to:
  /// **'Поиск...'**
  String get peer_client_searching;

  /// No description provided for @peer_client_unknown_device.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестное устройство'**
  String get peer_client_unknown_device;

  /// No description provided for @peer_client_wait_confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Ждите подтверждения'**
  String get peer_client_wait_confirmation;

  /// No description provided for @peer_client_waiting_hosts_title.
  ///
  /// In ru, this message translates to:
  /// **'Ждут приглашения:'**
  String get peer_client_waiting_hosts_title;

  /// No description provided for @peer_dialog_cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get peer_dialog_cancel;

  /// No description provided for @peer_dialog_error_title.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get peer_dialog_error_title;

  /// No description provided for @peer_error_bluetooth_unavailable.
  ///
  /// In ru, this message translates to:
  /// **'Bluetooth выключен или недоступен'**
  String get peer_error_bluetooth_unavailable;

  /// No description provided for @peer_games_list_stub.
  ///
  /// In ru, this message translates to:
  /// **'Список игр скоро появится'**
  String get peer_games_list_stub;

  /// No description provided for @peer_games_list_title.
  ///
  /// In ru, this message translates to:
  /// **'Игры'**
  String get peer_games_list_title;

  /// No description provided for @peer_home_mode_prompt.
  ///
  /// In ru, this message translates to:
  /// **'Выберите режим подключения'**
  String get peer_home_mode_prompt;

  /// No description provided for @peer_home_retry_button.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get peer_home_retry_button;

  /// No description provided for @peer_home_start_client_button.
  ///
  /// In ru, this message translates to:
  /// **'Найти и подключиться'**
  String get peer_home_start_client_button;

  /// No description provided for @peer_home_start_server_button.
  ///
  /// In ru, this message translates to:
  /// **'Ожидать присоединения'**
  String get peer_home_start_server_button;

  /// No description provided for @peer_home_title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в tete games'**
  String get peer_home_title;

  /// No description provided for @peer_nickname_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Придумайте себе псевдоним'**
  String get peer_nickname_dialog_title;

  /// No description provided for @peer_nickname_field_hint.
  ///
  /// In ru, this message translates to:
  /// **'Введите псевдоним'**
  String get peer_nickname_field_hint;

  /// No description provided for @peer_nickname_field_label.
  ///
  /// In ru, this message translates to:
  /// **'Псевдоним'**
  String get peer_nickname_field_label;

  /// No description provided for @peer_nickname_save_button.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get peer_nickname_save_button;

  /// No description provided for @peer_nickname_save_failed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось сохранить псевдоним'**
  String get peer_nickname_save_failed;

  /// No description provided for @peer_nickname_validation_empty.
  ///
  /// In ru, this message translates to:
  /// **'Псевдоним не должен быть пустым'**
  String get peer_nickname_validation_empty;

  /// No description provided for @peer_nickname_validation_too_long.
  ///
  /// In ru, this message translates to:
  /// **'Псевдоним не должен быть длиннее 20 символов'**
  String get peer_nickname_validation_too_long;

  /// No description provided for @peer_nickname_validation_wrong_format.
  ///
  /// In ru, this message translates to:
  /// **'Не допускаются пробелы между символами'**
  String get peer_nickname_validation_wrong_format;

  /// No description provided for @peer_server_accept_button.
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get peer_server_accept_button;

  /// No description provided for @peer_server_invitation_device.
  ///
  /// In ru, this message translates to:
  /// **'Приглашение от устройства {deviceName}'**
  String peer_server_invitation_device(String deviceName);

  /// No description provided for @peer_server_invitation_player.
  ///
  /// In ru, this message translates to:
  /// **'Имя пользователя: {playerName}'**
  String peer_server_invitation_player(String playerName);

  /// No description provided for @peer_server_invitation_prompt.
  ///
  /// In ru, this message translates to:
  /// **'Примите решение'**
  String get peer_server_invitation_prompt;

  /// No description provided for @peer_server_invitation_title.
  ///
  /// In ru, this message translates to:
  /// **'Получено приглашение'**
  String get peer_server_invitation_title;

  /// No description provided for @peer_server_reject_button.
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get peer_server_reject_button;

  /// No description provided for @peer_server_waiting_body.
  ///
  /// In ru, this message translates to:
  /// **'Ваше устройство видимо для других устройств'**
  String get peer_server_waiting_body;

  /// No description provided for @peer_server_waiting_title.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание подключения...'**
  String get peer_server_waiting_title;

  /// No description provided for @secret_mode_no.
  ///
  /// In ru, this message translates to:
  /// **'No'**
  String get secret_mode_no;

  /// No description provided for @secret_mode_ok.
  ///
  /// In ru, this message translates to:
  /// **'OK'**
  String get secret_mode_ok;

  /// No description provided for @secret_mode_password_hint.
  ///
  /// In ru, this message translates to:
  /// **'Password'**
  String get secret_mode_password_hint;

  /// No description provided for @secret_mode_production_mode_title.
  ///
  /// In ru, this message translates to:
  /// **'Production mode'**
  String get secret_mode_production_mode_title;

  /// No description provided for @secret_mode_return_to_production_message.
  ///
  /// In ru, this message translates to:
  /// **'Return to production mode?'**
  String get secret_mode_return_to_production_message;

  /// No description provided for @secret_mode_test_api_title.
  ///
  /// In ru, this message translates to:
  /// **'Test API'**
  String get secret_mode_test_api_title;

  /// No description provided for @secret_mode_version_label.
  ///
  /// In ru, this message translates to:
  /// **'Version'**
  String get secret_mode_version_label;

  /// No description provided for @secret_mode_wrong_password.
  ///
  /// In ru, this message translates to:
  /// **'Wrong password'**
  String get secret_mode_wrong_password;

  /// No description provided for @secret_mode_yes.
  ///
  /// In ru, this message translates to:
  /// **'Yes'**
  String get secret_mode_yes;

  /// No description provided for @something_went_wrong.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get something_went_wrong;
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(lookupAppLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}

AppLocalization lookupAppLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationEn();
    case 'ru':
      return AppLocalizationRu();
  }

  throw FlutterError(
    'AppLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

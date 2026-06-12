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

  /// No description provided for @all_documents_title.
  ///
  /// In ru, this message translates to:
  /// **'Все документы'**
  String get all_documents_title;

  /// No description provided for @core_error_unknown.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так...'**
  String get core_error_unknown;

  /// No description provided for @something_went_wrong.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get something_went_wrong;

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

  /// No description provided for @name_validator_invalid_detailed_message.
  ///
  /// In ru, this message translates to:
  /// **'Неверный формат имени. Используйте только латинские буквы, пробелы, дефисы или апострофы.'**
  String get name_validator_invalid_detailed_message;

  /// No description provided for @name_validator_overflow_message.
  ///
  /// In ru, this message translates to:
  /// **'Имя не должно превышать 30 символов'**
  String get name_validator_overflow_message;

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

  /// No description provided for @description_validator_overflow_message.
  ///
  /// In ru, this message translates to:
  /// **'Длина описания не должна превышать 300 символов'**
  String get description_validator_overflow_message;

  /// No description provided for @expandable_text_fold_label.
  ///
  /// In ru, this message translates to:
  /// **'свернуть'**
  String get expandable_text_fold_label;

  /// No description provided for @expandable_text_expand_label.
  ///
  /// In ru, this message translates to:
  /// **'больше'**
  String get expandable_text_expand_label;

  /// No description provided for @service_category_airport_title.
  ///
  /// In ru, this message translates to:
  /// **'Сервисы аэропорта'**
  String get service_category_airport_title;

  /// No description provided for @service_category_transfer_title.
  ///
  /// In ru, this message translates to:
  /// **'Трансфер'**
  String get service_category_transfer_title;

  /// No description provided for @service_category_private_jet_title.
  ///
  /// In ru, this message translates to:
  /// **'Частный джет'**
  String get service_category_private_jet_title;

  /// No description provided for @service_category_promo_title.
  ///
  /// In ru, this message translates to:
  /// **'Промо'**
  String get service_category_promo_title;

  /// No description provided for @nav_bar_main_title.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get nav_bar_main_title;

  /// No description provided for @nav_bar_ordering_title.
  ///
  /// In ru, this message translates to:
  /// **'Оформить'**
  String get nav_bar_ordering_title;

  /// No description provided for @nav_bar_my_trips_title.
  ///
  /// In ru, this message translates to:
  /// **'Мои поездки'**
  String get nav_bar_my_trips_title;

  /// No description provided for @nav_bar_profile_title.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get nav_bar_profile_title;

  /// No description provided for @auth_login_title.
  ///
  /// In ru, this message translates to:
  /// **'Войдите или создайте аккаунт'**
  String get auth_login_title;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправим код для входа на указанную почту'**
  String get auth_login_subtitle;

  /// No description provided for @auth_email_hint.
  ///
  /// In ru, this message translates to:
  /// **'Введите электронный адрес'**
  String get auth_email_hint;

  /// No description provided for @auth_email_label.
  ///
  /// In ru, this message translates to:
  /// **'Введите почту'**
  String get auth_email_label;

  /// No description provided for @auth_email_invalid_error.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте правильность ввода'**
  String get auth_email_invalid_error;

  /// No description provided for @auth_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get auth_continue_button;

  /// No description provided for @auth_terms_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Входя в аккаунт или создавая новый, вы соглашаетесь с нашими '**
  String get auth_terms_prefix;

  /// No description provided for @auth_terms_link.
  ///
  /// In ru, this message translates to:
  /// **'Правилами и условиями'**
  String get auth_terms_link;

  /// No description provided for @auth_terms_separator.
  ///
  /// In ru, this message translates to:
  /// **' и '**
  String get auth_terms_separator;

  /// No description provided for @auth_privacy_link.
  ///
  /// In ru, this message translates to:
  /// **'Положением о конфиденциальности'**
  String get auth_privacy_link;

  /// No description provided for @auth_copyright.
  ///
  /// In ru, this message translates to:
  /// **'2026. Все права защищены'**
  String get auth_copyright;

  /// No description provided for @auth_code_title.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте электронную почту'**
  String get auth_code_title;

  /// No description provided for @auth_code_sent_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили код подтверждения на адрес '**
  String get auth_code_sent_prefix;

  /// No description provided for @auth_code_sent_suffix.
  ///
  /// In ru, this message translates to:
  /// **'. Введите его, чтобы продолжить вход'**
  String get auth_code_sent_suffix;

  /// No description provided for @auth_code_resend_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Письмо не пришло? Проверьте папку «Спам» или запросите новый код через '**
  String get auth_code_resend_prefix;

  /// No description provided for @auth_code_resend_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get auth_code_resend_button;

  /// No description provided for @auth_code_expired_error.
  ///
  /// In ru, this message translates to:
  /// **'Срок действия кода истёк. Запросите новый и попробуйте ещё раз'**
  String get auth_code_expired_error;

  /// No description provided for @main_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get main_screen_title;

  /// No description provided for @my_trips_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Мои путешествия'**
  String get my_trips_screen_title;

  /// No description provided for @profile_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile_screen_title;

  /// No description provided for @example_action_navigateExample_title.
  ///
  /// In ru, this message translates to:
  /// **'Пример навигации'**
  String get example_action_navigateExample_title;

  /// No description provided for @estimate_seconds.
  ///
  /// In ru, this message translates to:
  /// **'{seconds, plural, one{{seconds} секунда} few{{seconds} секунды} many{{seconds} секунд} other{{seconds} секунд}}'**
  String estimate_seconds(int seconds);

  /// No description provided for @profile_welcome_anon_title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get profile_welcome_anon_title;

  /// No description provided for @profile_welcome_title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать, {name}!'**
  String profile_welcome_title(String name);

  /// No description provided for @profile_level_status.
  ///
  /// In ru, this message translates to:
  /// **'У вас базовый уровень — {level}'**
  String profile_level_status(String level);

  /// No description provided for @profile_level_remaining.
  ///
  /// In ru, this message translates to:
  /// **'До уровня {nextLevel} осталось: {amountRemaining, plural, =0{0 баллов} one{{amountRemaining} балл} few{{amountRemaining} балла} many{{amountRemaining} баллов} other{{amountRemaining} балла}}'**
  String profile_level_remaining(String nextLevel, num amountRemaining);

  /// No description provided for @profile_details_button.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get profile_details_button;

  /// No description provided for @profile_header_current_status_title.
  ///
  /// In ru, this message translates to:
  /// **'ВАШ ТЕКУЩИЙ СТАТУС'**
  String get profile_header_current_status_title;

  /// No description provided for @profile_header_spent_for_period.
  ///
  /// In ru, this message translates to:
  /// **'Потрачено за период'**
  String get profile_header_spent_for_period;

  /// No description provided for @profile_header_to_level.
  ///
  /// In ru, this message translates to:
  /// **'До уровня {levelName}'**
  String profile_header_to_level(String levelName);

  /// No description provided for @profile_header_amount_remaining.
  ///
  /// In ru, this message translates to:
  /// **'{amount} осталось'**
  String profile_header_amount_remaining(String amount);

  /// No description provided for @profile_header_percent_to_next_level.
  ///
  /// In ru, this message translates to:
  /// **'{percent}% до следующего уровня'**
  String profile_header_percent_to_next_level(String percent);

  /// No description provided for @profile_header_bonus_usd_equivalent.
  ///
  /// In ru, this message translates to:
  /// **'≈ {amount} к оплате'**
  String profile_header_bonus_usd_equivalent(String amount);

  /// No description provided for @profile_header_cashback_percent.
  ///
  /// In ru, this message translates to:
  /// **'{percent}% кэшбек'**
  String profile_header_cashback_percent(String percent);

  /// No description provided for @profile_header_cashback_description.
  ///
  /// In ru, this message translates to:
  /// **' — вы получаете баллы с каждой покупки'**
  String get profile_header_cashback_description;

  /// No description provided for @profile_header_cashback_at_level.
  ///
  /// In ru, this message translates to:
  /// **' на уровне {levelName}'**
  String profile_header_cashback_at_level(String levelName);

  /// No description provided for @profile_header_your_bonuses.
  ///
  /// In ru, this message translates to:
  /// **'Ваши бонусы'**
  String get profile_header_your_bonuses;

  /// No description provided for @profile_header_points.
  ///
  /// In ru, this message translates to:
  /// **'баллов'**
  String get profile_header_points;

  /// No description provided for @profile_section_my_travels.
  ///
  /// In ru, this message translates to:
  /// **'Мои путешествия'**
  String get profile_section_my_travels;

  /// No description provided for @profile_item_bookings.
  ///
  /// In ru, this message translates to:
  /// **'Бронирования'**
  String get profile_item_bookings;

  /// No description provided for @profile_item_my_reviews.
  ///
  /// In ru, this message translates to:
  /// **'Мои отзывы'**
  String get profile_item_my_reviews;

  /// No description provided for @profile_section_account_management.
  ///
  /// In ru, this message translates to:
  /// **'Управление аккаунтом'**
  String get profile_section_account_management;

  /// No description provided for @profile_item_personal_data.
  ///
  /// In ru, this message translates to:
  /// **'Персональные данные'**
  String get profile_item_personal_data;

  /// No description provided for @profile_item_other_travelers.
  ///
  /// In ru, this message translates to:
  /// **'Другие путешественники'**
  String get profile_item_other_travelers;

  /// No description provided for @profile_section_help.
  ///
  /// In ru, this message translates to:
  /// **'Помощь'**
  String get profile_section_help;

  /// No description provided for @profile_item_contact_support.
  ///
  /// In ru, this message translates to:
  /// **'Связаться со службой поддержки'**
  String get profile_item_contact_support;

  /// No description provided for @profile_item_articles.
  ///
  /// In ru, this message translates to:
  /// **'Наш блог'**
  String get profile_item_articles;

  /// No description provided for @profile_item_our_blog.
  ///
  /// In ru, this message translates to:
  /// **'Наш блог'**
  String get profile_item_our_blog;

  /// No description provided for @profile_item_security_center.
  ///
  /// In ru, this message translates to:
  /// **'Центр знаний по безопасности'**
  String get profile_item_security_center;

  /// No description provided for @profile_section_payment_info.
  ///
  /// In ru, this message translates to:
  /// **'Платежная информация'**
  String get profile_section_payment_info;

  /// No description provided for @profile_item_rewards_wallet.
  ///
  /// In ru, this message translates to:
  /// **'Вознаграждения и кошелек'**
  String get profile_item_rewards_wallet;

  /// No description provided for @profile_item_transactions.
  ///
  /// In ru, this message translates to:
  /// **'Транзакции'**
  String get profile_item_transactions;

  /// No description provided for @profile_section_legal.
  ///
  /// In ru, this message translates to:
  /// **'Юридические данные'**
  String get profile_section_legal;

  /// No description provided for @profile_item_privacy.
  ///
  /// In ru, this message translates to:
  /// **'Конфиденциальность'**
  String get profile_item_privacy;

  /// No description provided for @profile_item_terms.
  ///
  /// In ru, this message translates to:
  /// **'Условия использования'**
  String get profile_item_terms;

  /// No description provided for @profile_item_all_documents.
  ///
  /// In ru, this message translates to:
  /// **'Все документы'**
  String get profile_item_all_documents;

  /// No description provided for @profile_section_settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get profile_section_settings;

  /// No description provided for @profile_item_personalization.
  ///
  /// In ru, this message translates to:
  /// **'Настройки персонализации'**
  String get profile_item_personalization;

  /// No description provided for @profile_item_mailing.
  ///
  /// In ru, this message translates to:
  /// **'Настройки рассылки'**
  String get profile_item_mailing;

  /// No description provided for @personalization_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Настройки персонализации'**
  String get personalization_screen_title;

  /// No description provided for @personalization_language_label.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get personalization_language_label;

  /// No description provided for @personalization_language_search_hint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию'**
  String get personalization_language_search_hint;

  /// No description provided for @personalization_currency_label.
  ///
  /// In ru, this message translates to:
  /// **'Валюта'**
  String get personalization_currency_label;

  /// No description provided for @personalization_currency_search_hint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию'**
  String get personalization_currency_search_hint;

  /// No description provided for @personalization_region_label.
  ///
  /// In ru, this message translates to:
  /// **'Регион/Страна'**
  String get personalization_region_label;

  /// No description provided for @profile_logout_button.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get profile_logout_button;

  /// No description provided for @profile_delete_account_button.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get profile_delete_account_button;

  /// No description provided for @auth_or_divider.
  ///
  /// In ru, this message translates to:
  /// **'или'**
  String get auth_or_divider;

  /// No description provided for @auth_and.
  ///
  /// In ru, this message translates to:
  /// **'и'**
  String get auth_and;

  /// No description provided for @profile_not_auth_title.
  ///
  /// In ru, this message translates to:
  /// **'Войдите в аккаунт'**
  String get profile_not_auth_title;

  /// No description provided for @profile_not_auth_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Сохраняйте поездки, маршруты и избранные места. Копите баллы и экономьте на заказах'**
  String get profile_not_auth_subtitle;

  /// No description provided for @profile_login_button.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get profile_login_button;

  /// No description provided for @auth_plug_title.
  ///
  /// In ru, this message translates to:
  /// **'Ещё несколько секунд…'**
  String get auth_plug_title;

  /// No description provided for @auth_plug_comment.
  ///
  /// In ru, this message translates to:
  /// **'Мы завершаем вход в аккаунт'**
  String get auth_plug_comment;

  /// No description provided for @main_hero_title.
  ///
  /// In ru, this message translates to:
  /// **'VIP-сервисы в аэропортах\nпо всему миру'**
  String get main_hero_title;

  /// No description provided for @main_search_hint.
  ///
  /// In ru, this message translates to:
  /// **'Аэропорт, город или номер рейса...'**
  String get main_search_hint;

  /// No description provided for @main_search_date_hint.
  ///
  /// In ru, this message translates to:
  /// **'Дата рейса...'**
  String get main_search_date_hint;

  /// No description provided for @main_search_button.
  ///
  /// In ru, this message translates to:
  /// **'Найти'**
  String get main_search_button;

  /// No description provided for @main_search_button_continue.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get main_search_button_continue;

  /// No description provided for @main_search_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование за пару минут • Поддержка 24/7'**
  String get main_search_subtitle;

  /// No description provided for @main_services_title.
  ///
  /// In ru, this message translates to:
  /// **'Услуги'**
  String get main_services_title;

  /// No description provided for @main_loyalty_title.
  ///
  /// In ru, this message translates to:
  /// **'Программа лояльности'**
  String get main_loyalty_title;

  /// No description provided for @main_loyalty_description.
  ///
  /// In ru, this message translates to:
  /// **'Возвращаем часть стоимости поездок в бонусных баллах'**
  String get main_loyalty_description;

  /// No description provided for @main_loyalty_link.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get main_loyalty_link;

  /// No description provided for @main_airports_title.
  ///
  /// In ru, this message translates to:
  /// **'Популярные аэропорты'**
  String get main_airports_title;

  /// No description provided for @main_airports_all.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get main_airports_all;

  /// No description provided for @all_airports_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Аэропорты с лучшими предложениями'**
  String get all_airports_screen_title;

  /// No description provided for @all_airports_section_title.
  ///
  /// In ru, this message translates to:
  /// **'Выбор аэропорта'**
  String get all_airports_section_title;

  /// No description provided for @all_airports_book_button.
  ///
  /// In ru, this message translates to:
  /// **'Оформить'**
  String get all_airports_book_button;

  /// No description provided for @all_airports_empty.
  ///
  /// In ru, this message translates to:
  /// **'Нет результатов'**
  String get all_airports_empty;

  /// No description provided for @all_airports_search_hint.
  ///
  /// In ru, this message translates to:
  /// **'Аэропорт или город'**
  String get all_airports_search_hint;

  /// No description provided for @search_services_search_title.
  ///
  /// In ru, this message translates to:
  /// **'Поиск аэропорта'**
  String get search_services_search_title;

  /// No description provided for @search_services_all_airports_button.
  ///
  /// In ru, this message translates to:
  /// **'Все аэропорты'**
  String get search_services_all_airports_button;

  /// No description provided for @empty_search_title.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get empty_search_title;

  /// No description provided for @empty_search_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить запрос\nили повторить позже'**
  String get empty_search_subtitle;

  /// No description provided for @main_transfer_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Раздел трансфера в разработке'**
  String get main_transfer_placeholder;

  /// No description provided for @personal_data_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Персональные данные'**
  String get personal_data_screen_title;

  /// No description provided for @personal_data_name_label.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get personal_data_name_label;

  /// No description provided for @personal_data_name_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Укажите ваше имя'**
  String get personal_data_name_placeholder;

  /// No description provided for @personal_data_email_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес электронной почты'**
  String get personal_data_email_label;

  /// No description provided for @personal_data_phone_label.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get personal_data_phone_label;

  /// No description provided for @personal_data_phone_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Укажите ваш номер телефона'**
  String get personal_data_phone_placeholder;

  /// No description provided for @personal_data_birthdate_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get personal_data_birthdate_label;

  /// No description provided for @personal_data_birthdate_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Укажите вашу дату рождения'**
  String get personal_data_birthdate_placeholder;

  /// No description provided for @personal_data_gender_label.
  ///
  /// In ru, this message translates to:
  /// **'Пол'**
  String get personal_data_gender_label;

  /// No description provided for @personal_data_gender_male.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get personal_data_gender_male;

  /// No description provided for @personal_data_gender_female.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get personal_data_gender_female;

  /// No description provided for @personal_data_citizenship_label.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get personal_data_citizenship_label;

  /// No description provided for @personal_data_citizenship_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Укажите ваше гражданство'**
  String get personal_data_citizenship_placeholder;

  /// No description provided for @personal_data_delete_account.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get personal_data_delete_account;

  /// No description provided for @main_transfer_title.
  ///
  /// In ru, this message translates to:
  /// **'Трансфер по всему миру'**
  String get main_transfer_title;

  /// No description provided for @main_transfer_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Без привязки к рейсу\nРаботает как персональный трансфер из любой точки'**
  String get main_transfer_subtitle;

  /// No description provided for @main_transfer_types_title.
  ///
  /// In ru, this message translates to:
  /// **'Типы трансфера'**
  String get main_transfer_types_title;

  /// No description provided for @main_search_transfer_date_title.
  ///
  /// In ru, this message translates to:
  /// **'Дата поездки'**
  String get main_search_transfer_date_title;

  /// No description provided for @main_search_transfer_date_hint.
  ///
  /// In ru, this message translates to:
  /// **'Дата поездки'**
  String get main_search_transfer_date_hint;

  /// No description provided for @main_search_transfer_from_title.
  ///
  /// In ru, this message translates to:
  /// **'Адрес отправления'**
  String get main_search_transfer_from_title;

  /// No description provided for @main_search_transfer_from_hint.
  ///
  /// In ru, this message translates to:
  /// **'Адрес отправления'**
  String get main_search_transfer_from_hint;

  /// No description provided for @main_search_transfer_to_title.
  ///
  /// In ru, this message translates to:
  /// **'Адрес прибытия'**
  String get main_search_transfer_to_title;

  /// No description provided for @main_search_transfer_to_hint.
  ///
  /// In ru, this message translates to:
  /// **'Адрес прибытия'**
  String get main_search_transfer_to_hint;

  /// No description provided for @edit_name_title.
  ///
  /// In ru, this message translates to:
  /// **'Укажите ваше имя'**
  String get edit_name_title;

  /// No description provided for @edit_name_avatar_changed_message.
  ///
  /// In ru, this message translates to:
  /// **'Аватар профиля изменен'**
  String get edit_name_avatar_changed_message;

  /// No description provided for @edit_name_photo_recommendation.
  ///
  /// In ru, this message translates to:
  /// **'Для корректной работы сервиса Example App рекомендуем загрузить ваше реальное фото в профиль. Это позволит сотрудникам аэропорта легко вас идентифицировать и сопровождать без задержек.'**
  String get edit_name_photo_recommendation;

  /// No description provided for @personal_data_firstname_label.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get personal_data_firstname_label;

  /// No description provided for @personal_data_firstname_hint.
  ///
  /// In ru, this message translates to:
  /// **'Имя (латиницей, например, Ivan)'**
  String get personal_data_firstname_hint;

  /// No description provided for @personal_data_lastname_label.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get personal_data_lastname_label;

  /// No description provided for @personal_data_lastname_hint.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия (латиницей, например, Ivanov)'**
  String get personal_data_lastname_hint;

  /// No description provided for @personal_data_photo_label.
  ///
  /// In ru, this message translates to:
  /// **'Фотография профиля'**
  String get personal_data_photo_label;

  /// No description provided for @personal_data_upload.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить'**
  String get personal_data_upload;

  /// No description provided for @personal_data_save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get personal_data_save;

  /// No description provided for @change_email_confirm_button.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get change_email_confirm_button;

  /// No description provided for @confirm_email_title.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте электронную почту'**
  String get confirm_email_title;

  /// No description provided for @confirm_email_sent_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили код подтверждения на адрес '**
  String get confirm_email_sent_prefix;

  /// No description provided for @confirm_email_sent_suffix.
  ///
  /// In ru, this message translates to:
  /// **'. Введите его, для подтверждения электронной почты'**
  String get confirm_email_sent_suffix;

  /// No description provided for @confirm_email_resend_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Письмо не пришло? Проверьте папку «Спам» или запросите новый код через '**
  String get confirm_email_resend_prefix;

  /// No description provided for @confirm_email_resend_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get confirm_email_resend_button;

  /// No description provided for @confirm_email_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm_email_submit_button;

  /// No description provided for @confirm_email_plug_title.
  ///
  /// In ru, this message translates to:
  /// **'Ещё несколько секунд…'**
  String get confirm_email_plug_title;

  /// No description provided for @confirm_email_plug_comment.
  ///
  /// In ru, this message translates to:
  /// **'Идет смена электронной почты'**
  String get confirm_email_plug_comment;

  /// No description provided for @confirm_delete_account_title.
  ///
  /// In ru, this message translates to:
  /// **'Удаление аккаунта'**
  String get confirm_delete_account_title;

  /// No description provided for @confirm_delete_account_sent_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили код подтверждения на адрес '**
  String get confirm_delete_account_sent_prefix;

  /// No description provided for @confirm_delete_account_sent_suffix.
  ///
  /// In ru, this message translates to:
  /// **'. Введите его, чтобы безвозвратно удалить аккаунт'**
  String get confirm_delete_account_sent_suffix;

  /// No description provided for @confirm_delete_account_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get confirm_delete_account_submit_button;

  /// No description provided for @confirm_delete_account_plug_title.
  ///
  /// In ru, this message translates to:
  /// **'Ещё несколько секунд…'**
  String get confirm_delete_account_plug_title;

  /// No description provided for @confirm_delete_account_plug_comment.
  ///
  /// In ru, this message translates to:
  /// **'Удаление аккаунта'**
  String get confirm_delete_account_plug_comment;

  /// No description provided for @birthday_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get birthday_screen_title;

  /// No description provided for @birthday_field_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get birthday_field_label;

  /// No description provided for @save_button.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save_button;

  /// No description provided for @invalid_date_error.
  ///
  /// In ru, this message translates to:
  /// **'Введите корректную дату'**
  String get invalid_date_error;

  /// No description provided for @citizenship_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get citizenship_screen_title;

  /// No description provided for @citizenship_search_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию страны'**
  String get citizenship_search_placeholder;

  /// No description provided for @main_transfer_date_modal_title.
  ///
  /// In ru, this message translates to:
  /// **'Выбор даты поездки'**
  String get main_transfer_date_modal_title;

  /// No description provided for @main_flight_date_modal_title.
  ///
  /// In ru, this message translates to:
  /// **'Выбор даты рейса'**
  String get main_flight_date_modal_title;

  /// No description provided for @invitation_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Войти в аккаунт'**
  String get invitation_dialog_title;

  /// No description provided for @invitation_dialog_message.
  ///
  /// In ru, this message translates to:
  /// **'Войдите в профиль, чтобы сохранять данные пассажиров и историю поездок'**
  String get invitation_dialog_message;

  /// No description provided for @invitation_dialog_button.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get invitation_dialog_button;

  /// No description provided for @welcome_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get welcome_screen_title;

  /// No description provided for @welcome_screen_message.
  ///
  /// In ru, this message translates to:
  /// **'🎉 вы успешно зарегистрировались\nи вам навсегда доступны вознаграждения\nв программе лояльности. Ваш текущий уровень:'**
  String get welcome_screen_message;

  /// No description provided for @welcome_screen_level.
  ///
  /// In ru, this message translates to:
  /// **'Start'**
  String get welcome_screen_level;

  /// No description provided for @welcome_screen_description.
  ///
  /// In ru, this message translates to:
  /// **'За каждую оплату вам возвращаются бонусные\nбаллы. Чем больше поездок, тем выше статус\nи больше выгода!'**
  String get welcome_screen_description;

  /// No description provided for @welcome_screen_got_it.
  ///
  /// In ru, this message translates to:
  /// **'Понятно'**
  String get welcome_screen_got_it;

  /// No description provided for @welcome_screen_details.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее о программе'**
  String get welcome_screen_details;

  /// No description provided for @welcome_screen_footer.
  ///
  /// In ru, this message translates to:
  /// **'Повышайте уровень — получайте больше бонусов,\nподробнее можно прочитать на странице программы\nлояльности'**
  String get welcome_screen_footer;

  /// No description provided for @flights_input_title.
  ///
  /// In ru, this message translates to:
  /// **'Введите свои данные'**
  String get flights_input_title;

  /// No description provided for @stepped_header_step_label.
  ///
  /// In ru, this message translates to:
  /// **'Шаг {current}/{total}'**
  String stepped_header_step_label(int current, int total);

  /// No description provided for @flights_input_description.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, укажите свои данные латинскими буквами, чтобы сотрудники аэропорта смогли их понять'**
  String get flights_input_description;

  /// No description provided for @flights_input_flight_data_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные рейса'**
  String get flights_input_flight_data_title;

  /// No description provided for @flights_input_with_transfer.
  ///
  /// In ru, this message translates to:
  /// **'С пересадкой'**
  String get flights_input_with_transfer;

  /// No description provided for @flights_input_second_flight_data_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные второго рейса'**
  String get flights_input_second_flight_data_title;

  /// No description provided for @flights_input_remove_flight.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get flights_input_remove_flight;

  /// No description provided for @flights_input_flight_number_label.
  ///
  /// In ru, this message translates to:
  /// **'Номер'**
  String get flights_input_flight_number_label;

  /// No description provided for @flights_input_flight_number_hint.
  ///
  /// In ru, this message translates to:
  /// **'Номер рейса, например, CU 6456'**
  String get flights_input_flight_number_hint;

  /// No description provided for @flights_input_flight_date_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get flights_input_flight_date_label;

  /// No description provided for @flights_input_flight_date_hint.
  ///
  /// In ru, this message translates to:
  /// **'Дата рейса, ДД.ММ.ГГГГ'**
  String get flights_input_flight_date_hint;

  /// No description provided for @flights_input_footer_text.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер рейса — аэропорт подгрузится автоматически, и вы сможете выбрать услугу'**
  String get flights_input_footer_text;

  /// No description provided for @flights_input_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get flights_input_continue_button;

  /// No description provided for @flight_not_found_title.
  ///
  /// In ru, this message translates to:
  /// **'Рейс не найден.'**
  String get flight_not_found_title;

  /// No description provided for @flight_not_found_message.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте номер рейса и дату, если всё указано верно, то заполните время вылета вручную. Информация по рейсу может обновиться позже.'**
  String get flight_not_found_message;

  /// No description provided for @departure_time_label.
  ///
  /// In ru, this message translates to:
  /// **'Время вылета'**
  String get departure_time_label;

  /// No description provided for @airport_header_departure_title.
  ///
  /// In ru, this message translates to:
  /// **'Аэропорт вылета'**
  String get airport_header_departure_title;

  /// No description provided for @airport_header_arrival_title.
  ///
  /// In ru, this message translates to:
  /// **'Аэропорт прилета'**
  String get airport_header_arrival_title;

  /// No description provided for @airport_header_transit_title.
  ///
  /// In ru, this message translates to:
  /// **'Транзитный пункт'**
  String get airport_header_transit_title;

  /// No description provided for @airport_header_transit_arrival_title.
  ///
  /// In ru, this message translates to:
  /// **'Транзитный пункт (Прилет)'**
  String get airport_header_transit_arrival_title;

  /// No description provided for @airport_header_transit_departure_title.
  ///
  /// In ru, this message translates to:
  /// **'Транзитный пункт (Вылет)'**
  String get airport_header_transit_departure_title;

  /// No description provided for @flights_input_step_2.
  ///
  /// In ru, this message translates to:
  /// **'Шаг 2/6'**
  String get flights_input_step_2;

  /// No description provided for @flights_input_conditions_title.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные условия'**
  String get flights_input_conditions_title;

  /// No description provided for @flights_input_next_step_hint.
  ///
  /// In ru, this message translates to:
  /// **'Следующим шагом вы сможете выбрать услуги'**
  String get flights_input_next_step_hint;

  /// No description provided for @flight_details_first_flight.
  ///
  /// In ru, this message translates to:
  /// **'Первый рейс'**
  String get flight_details_first_flight;

  /// No description provided for @flight_details_second_flight.
  ///
  /// In ru, this message translates to:
  /// **'Второй рейс'**
  String get flight_details_second_flight;

  /// No description provided for @flight_details_auto_filled_hint.
  ///
  /// In ru, this message translates to:
  /// **'Данные рейса заполнены автоматически\nПроверьте корректность'**
  String get flight_details_auto_filled_hint;

  /// No description provided for @flight_details_transit_exit.
  ///
  /// In ru, this message translates to:
  /// **'Выход в город'**
  String get flight_details_transit_exit;

  /// No description provided for @flight_details_terminal_hint.
  ///
  /// In ru, this message translates to:
  /// **'Укажите терминал'**
  String get flight_details_terminal_hint;

  /// No description provided for @flight_details_terminal_label.
  ///
  /// In ru, this message translates to:
  /// **'Терминал'**
  String get flight_details_terminal_label;

  /// No description provided for @flight_details_airport_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Название аэропорта'**
  String get flight_details_airport_name_hint;

  /// No description provided for @flight_details_single_terminal_name.
  ///
  /// In ru, this message translates to:
  /// **'Единый терминал'**
  String get flight_details_single_terminal_name;

  /// No description provided for @info_card_tariffs_description.
  ///
  /// In ru, this message translates to:
  /// **'Тарифы зависят от аэропорта, услуги и возраста пассажира. Нажми сюда, чтобы посмотреть подробности'**
  String get info_card_tariffs_description;

  /// No description provided for @select_services_title.
  ///
  /// In ru, this message translates to:
  /// **'Выберите услуги'**
  String get select_services_title;

  /// No description provided for @select_services_airport_prompt.
  ///
  /// In ru, this message translates to:
  /// **'На основе данных рейса выберите услугу для этого аэропорта: {airportName}'**
  String select_services_airport_prompt(String airportName);

  /// No description provided for @select_services_main_services_hint.
  ///
  /// In ru, this message translates to:
  /// **'Выберите основные услуги — дополнительные параметры появятся ниже'**
  String get select_services_main_services_hint;

  /// No description provided for @select_services_no_service_needed.
  ///
  /// In ru, this message translates to:
  /// **'Не нужна услуга в этом аэропорту'**
  String get select_services_no_service_needed;

  /// No description provided for @select_services_fast_track_notice.
  ///
  /// In ru, this message translates to:
  /// **'В этом аэропорту доступно несколько услуг Fast Track. Стоимость и условия могут отличаться в зависимости от выбранной услуги.'**
  String get select_services_fast_track_notice;

  /// No description provided for @select_services_vip_lounge_notice.
  ///
  /// In ru, this message translates to:
  /// **'В этом аэропорту доступно несколько VIP-залов. Стоимость и условия могут отличаться в зависимости от выбранного зала.'**
  String get select_services_vip_lounge_notice;

  /// No description provided for @select_services_transfer_notice.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость трансфера рассчитывается индивидуально. Менеджер свяжется с вами и согласует финальную цену. Сейчас оплата не требуется. Укажите данные, чтобы зафиксировать заказ.'**
  String get select_services_transfer_notice;

  /// No description provided for @select_services_accompaniment_notice.
  ///
  /// In ru, this message translates to:
  /// **'В этом аэропорту доступно несколько услуг сопровождения. Стоимость и условия могут отличаться в зависимости от выбранной услуги.'**
  String get select_services_accompaniment_notice;

  /// No description provided for @select_services_at_least_one_required_toast.
  ///
  /// In ru, this message translates to:
  /// **'Для оформления заказа нужно выбрать хотя бы одну услугу в любом из аэропортов по вашему маршруту'**
  String get select_services_at_least_one_required_toast;

  /// No description provided for @auth_choice_title.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить бронирование в личном кабинете?'**
  String get auth_choice_title;

  /// No description provided for @auth_choice_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Если у вас уже есть аккаунт — просто войдите.\nЕсли нет, мы можем создать аккаунт и сохранить бронирование в «Моих путешествиях»'**
  String get auth_choice_subtitle;

  /// No description provided for @auth_choice_login_button.
  ///
  /// In ru, this message translates to:
  /// **'Войти в аккаунт'**
  String get auth_choice_login_button;

  /// No description provided for @auth_choice_create_account_label.
  ///
  /// In ru, this message translates to:
  /// **'Создать аккаунт и сохранить бронь'**
  String get auth_choice_create_account_label;

  /// No description provided for @auth_choice_create_account_hint.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправим код на почту. После подтверждения все данные сохранятся.'**
  String get auth_choice_create_account_hint;

  /// No description provided for @auth_choice_without_auth_label.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить без регистрации'**
  String get auth_choice_without_auth_label;

  /// No description provided for @auth_choice_without_auth_hint.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование не появится в «Моих путешествиях».\nДля управления заказом потребуется код бронирования — сохраните его.'**
  String get auth_choice_without_auth_hint;

  /// No description provided for @auth_choice_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get auth_choice_continue_button;

  /// No description provided for @flight_input_time_hint.
  ///
  /// In ru, this message translates to:
  /// **'ЧЧ:ММ'**
  String get flight_input_time_hint;

  /// No description provided for @select_services_vip_lounge.
  ///
  /// In ru, this message translates to:
  /// **'VIP-зал'**
  String get select_services_vip_lounge;

  /// No description provided for @transfer_field_required_error.
  ///
  /// In ru, this message translates to:
  /// **'Поле не может быть пустым'**
  String get transfer_field_required_error;

  /// No description provided for @transfer_route_title.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут трансфера'**
  String get transfer_route_title;

  /// No description provided for @transfer_departure_address_hint.
  ///
  /// In ru, this message translates to:
  /// **'Адрес отправления'**
  String get transfer_departure_address_hint;

  /// No description provided for @transfer_intermediate_point_hint.
  ///
  /// In ru, this message translates to:
  /// **'Промежуточная точка'**
  String get transfer_intermediate_point_hint;

  /// No description provided for @transfer_arrival_address_hint.
  ///
  /// In ru, this message translates to:
  /// **'Адрес назначения'**
  String get transfer_arrival_address_hint;

  /// No description provided for @transfer_car_category_hint.
  ///
  /// In ru, this message translates to:
  /// **'Категория автомобиля'**
  String get transfer_car_category_hint;

  /// No description provided for @transfer_add_stop_button.
  ///
  /// In ru, this message translates to:
  /// **'Добавить остановку'**
  String get transfer_add_stop_button;

  /// No description provided for @flight_details_flight_label.
  ///
  /// In ru, this message translates to:
  /// **'Рейс'**
  String get flight_details_flight_label;

  /// No description provided for @airport_detail_terminals_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Терминалы {names}'**
  String airport_detail_terminals_subtitle(String names);

  /// No description provided for @airport_detail_tariffs_title.
  ///
  /// In ru, this message translates to:
  /// **'Тарифы'**
  String get airport_detail_tariffs_title;

  /// No description provided for @airport_detail_terminal_hint.
  ///
  /// In ru, this message translates to:
  /// **'Терминал'**
  String get airport_detail_terminal_hint;

  /// No description provided for @airport_detail_all_terminals.
  ///
  /// In ru, this message translates to:
  /// **'Все терминалы'**
  String get airport_detail_all_terminals;

  /// No description provided for @airport_detail_terminal_option.
  ///
  /// In ru, this message translates to:
  /// **'Терминал {name}'**
  String airport_detail_terminal_option(String name);

  /// No description provided for @airport_detail_book_button.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать'**
  String get airport_detail_book_button;

  /// No description provided for @airport_detail_what_included_title.
  ///
  /// In ru, this message translates to:
  /// **'Что входит в услугу'**
  String get airport_detail_what_included_title;

  /// No description provided for @airport_detail_photos_title.
  ///
  /// In ru, this message translates to:
  /// **'Фотографии'**
  String get airport_detail_photos_title;

  /// No description provided for @airport_detail_important_to_know.
  ///
  /// In ru, this message translates to:
  /// **'Важно знать'**
  String get airport_detail_important_to_know;

  /// No description provided for @airport_detail_checkout_button.
  ///
  /// In ru, this message translates to:
  /// **'Оформить'**
  String get airport_detail_checkout_button;

  /// No description provided for @airport_detail_price_depends_on_tariff.
  ///
  /// In ru, this message translates to:
  /// **'Цена зависит от выбранного тарифа'**
  String get airport_detail_price_depends_on_tariff;

  /// No description provided for @airport_detail_tariff_description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get airport_detail_tariff_description;

  /// No description provided for @airport_detail_tariff_adults.
  ///
  /// In ru, this message translates to:
  /// **'Взрослые'**
  String get airport_detail_tariff_adults;

  /// No description provided for @airport_detail_tariff_per_person.
  ///
  /// In ru, this message translates to:
  /// **' за пассажира'**
  String get airport_detail_tariff_per_person;

  /// No description provided for @airport_detail_tariff_children.
  ///
  /// In ru, this message translates to:
  /// **'Дети'**
  String get airport_detail_tariff_children;

  /// No description provided for @airport_detail_tariff_per_child.
  ///
  /// In ru, this message translates to:
  /// **' за ребёнка'**
  String get airport_detail_tariff_per_child;

  /// No description provided for @airport_detail_tariff_infants.
  ///
  /// In ru, this message translates to:
  /// **'Дети до 2х лет'**
  String get airport_detail_tariff_infants;

  /// No description provided for @airport_detail_free.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно'**
  String get airport_detail_free;

  /// No description provided for @airport_detail_price_from.
  ///
  /// In ru, this message translates to:
  /// **'Цена от'**
  String get airport_detail_price_from;

  /// No description provided for @airport_detail_price_transfer_from.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость зависит от маршрута'**
  String get airport_detail_price_transfer_from;

  /// No description provided for @airport_detail_from.
  ///
  /// In ru, this message translates to:
  /// **'от '**
  String get airport_detail_from;

  /// No description provided for @airport_detail_price_label.
  ///
  /// In ru, this message translates to:
  /// **'Цена'**
  String get airport_detail_price_label;

  /// No description provided for @airport_detail_price_on_request.
  ///
  /// In ru, this message translates to:
  /// **'По запросу'**
  String get airport_detail_price_on_request;

  /// No description provided for @airport_detail_overview_available_services_title.
  ///
  /// In ru, this message translates to:
  /// **'Доступные услуги'**
  String get airport_detail_overview_available_services_title;

  /// No description provided for @airport_detail_overview_customer_reviews_title.
  ///
  /// In ru, this message translates to:
  /// **'Отзывы клиентов'**
  String get airport_detail_overview_customer_reviews_title;

  /// No description provided for @airport_detail_overview_about_airport_title.
  ///
  /// In ru, this message translates to:
  /// **'Об аэропорте'**
  String get airport_detail_overview_about_airport_title;

  /// No description provided for @airport_detail_overview_faq_title.
  ///
  /// In ru, this message translates to:
  /// **'Вопросы и ответы'**
  String get airport_detail_overview_faq_title;

  /// No description provided for @airport_detail_general_information_title.
  ///
  /// In ru, this message translates to:
  /// **'Общая информация'**
  String get airport_detail_general_information_title;

  /// No description provided for @airport_detail_info_iata_label.
  ///
  /// In ru, this message translates to:
  /// **'Код IATA'**
  String get airport_detail_info_iata_label;

  /// No description provided for @airport_detail_info_city_label.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get airport_detail_info_city_label;

  /// No description provided for @airport_detail_info_terminals_label.
  ///
  /// In ru, this message translates to:
  /// **'Терминалы'**
  String get airport_detail_info_terminals_label;

  /// No description provided for @airport_detail_info_gates_label.
  ///
  /// In ru, this message translates to:
  /// **'Выходы (гейты)'**
  String get airport_detail_info_gates_label;

  /// No description provided for @airport_detail_info_hours_label.
  ///
  /// In ru, this message translates to:
  /// **'Режим работы'**
  String get airport_detail_info_hours_label;

  /// No description provided for @airport_detail_info_passengers_label.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиропоток в год'**
  String get airport_detail_info_passengers_label;

  /// No description provided for @airport_detail_info_airlines_label.
  ///
  /// In ru, this message translates to:
  /// **'Авиакомпании'**
  String get airport_detail_info_airlines_label;

  /// No description provided for @airport_detail_info_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get airport_detail_info_address_label;

  /// No description provided for @airport_detail_info_distance_to_city_label.
  ///
  /// In ru, this message translates to:
  /// **'Расстояние до города'**
  String get airport_detail_info_distance_to_city_label;

  /// No description provided for @airport_detail_info_public_transport_label.
  ///
  /// In ru, this message translates to:
  /// **'Общественный транспорт'**
  String get airport_detail_info_public_transport_label;

  /// No description provided for @airport_detail_getting_there_title.
  ///
  /// In ru, this message translates to:
  /// **'Как добраться'**
  String get airport_detail_getting_there_title;

  /// No description provided for @airport_detail_getting_there_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get airport_detail_getting_there_address_label;

  /// No description provided for @airport_detail_getting_there_distance_label.
  ///
  /// In ru, this message translates to:
  /// **'Расстояние'**
  String get airport_detail_getting_there_distance_label;

  /// No description provided for @airport_detail_getting_there_transport_label.
  ///
  /// In ru, this message translates to:
  /// **'Транспорт'**
  String get airport_detail_getting_there_transport_label;

  /// No description provided for @airport_detail_getting_there_need_transfer_title.
  ///
  /// In ru, this message translates to:
  /// **'Нужен трансфер?'**
  String get airport_detail_getting_there_need_transfer_title;

  /// No description provided for @airport_detail_getting_there_book_premium_transfer_button.
  ///
  /// In ru, this message translates to:
  /// **'Заказать премиум-трансфер'**
  String get airport_detail_getting_there_book_premium_transfer_button;

  /// No description provided for @airport_detail_service_details_title.
  ///
  /// In ru, this message translates to:
  /// **'Детали услуг'**
  String get airport_detail_service_details_title;

  /// No description provided for @airport_detail_how_it_works_title.
  ///
  /// In ru, this message translates to:
  /// **'Как это работает'**
  String get airport_detail_how_it_works_title;

  /// No description provided for @airport_detail_not_included_title.
  ///
  /// In ru, this message translates to:
  /// **'Не включено'**
  String get airport_detail_not_included_title;

  /// No description provided for @airport_detail_about_service_title.
  ///
  /// In ru, this message translates to:
  /// **'Об услуге'**
  String get airport_detail_about_service_title;

  /// No description provided for @airport_detail_important_information_title.
  ///
  /// In ru, this message translates to:
  /// **'Важная информация'**
  String get airport_detail_important_information_title;

  /// No description provided for @airport_detail_order_transfer_button.
  ///
  /// In ru, this message translates to:
  /// **'Заказать трансфер'**
  String get airport_detail_order_transfer_button;

  /// No description provided for @airport_detail_order_service_button.
  ///
  /// In ru, this message translates to:
  /// **'Заказать услугу'**
  String get airport_detail_order_service_button;

  /// No description provided for @airport_detail_benefit_instant_confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенное подтверждение'**
  String get airport_detail_benefit_instant_confirmation;

  /// No description provided for @airport_detail_benefit_free_cancellation_24h.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатная отмена до 24 ч до услуги'**
  String get airport_detail_benefit_free_cancellation_24h;

  /// No description provided for @airport_detail_benefit_e_ticket_email.
  ///
  /// In ru, this message translates to:
  /// **'Электронный билет на email'**
  String get airport_detail_benefit_e_ticket_email;

  /// No description provided for @airport_detail_stat_airlines_label.
  ///
  /// In ru, this message translates to:
  /// **'Авиакомпании'**
  String get airport_detail_stat_airlines_label;

  /// No description provided for @airport_detail_stat_annual_passengers_label.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиров в год'**
  String get airport_detail_stat_annual_passengers_label;

  /// No description provided for @airport_detail_stat_working_hours_label.
  ///
  /// In ru, this message translates to:
  /// **'Режим работы'**
  String get airport_detail_stat_working_hours_label;

  /// No description provided for @airport_detail_stat_free_cancellation_label.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатная отмена'**
  String get airport_detail_stat_free_cancellation_label;

  /// No description provided for @airport_detail_reviews_count.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} отзыв} few{{count} отзыва} many{{count} отзывов} other{{count} отзывов}}'**
  String airport_detail_reviews_count(int count);

  /// No description provided for @airport_detail_services_available.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{Доступен {count} вид услуг} few{Доступно {count} вида услуг} many{Доступно {count} видов услуг} other{Доступно {count} видов услуг}}'**
  String airport_detail_services_available(int count);

  /// No description provided for @airport_detail_view_photos.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть фото'**
  String get airport_detail_view_photos;

  /// No description provided for @airport_detail_retry_button.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get airport_detail_retry_button;

  /// No description provided for @airport_detail_empty_title.
  ///
  /// In ru, this message translates to:
  /// **'Услуги скоро появятся'**
  String get airport_detail_empty_title;

  /// No description provided for @airport_detail_empty_description.
  ///
  /// In ru, this message translates to:
  /// **'К сожалению, сейчас мы не предоставляем услуги в этом аэропорту. Но мы уже работаем над подключением новых сервисов и расширением покрытия. \n\nВы можете оставить свою электронную почту — мы уведомим вас сразу, как услуги станут доступны.'**
  String get airport_detail_empty_description;

  /// No description provided for @airport_detail_empty_subscribe_button.
  ///
  /// In ru, this message translates to:
  /// **'Подписаться на обновление'**
  String get airport_detail_empty_subscribe_button;

  /// No description provided for @airport_detail_subscribe_title.
  ///
  /// In ru, this message translates to:
  /// **'Получайте уведомления'**
  String get airport_detail_subscribe_title;

  /// No description provided for @airport_detail_subscribe_description.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте email — мы сообщим, когда услуги в этом аэропорту станут доступны'**
  String get airport_detail_subscribe_description;

  /// No description provided for @airport_detail_receive_news.
  ///
  /// In ru, this message translates to:
  /// **'Получать новости и обновления сервиса Example App'**
  String get airport_detail_receive_news;

  /// No description provided for @airport_detail_subscribe_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'Подписаться'**
  String get airport_detail_subscribe_submit_button;

  /// No description provided for @airport_detail_agreement_text.
  ///
  /// In ru, this message translates to:
  /// **'Подписываясь, вы соглашаетесь с нашими'**
  String get airport_detail_agreement_text;

  /// No description provided for @airport_detail_info_tarif_bottom_sheet_title.
  ///
  /// In ru, this message translates to:
  /// **'Цена услуги зависит от терминала'**
  String get airport_detail_info_tarif_bottom_sheet_title;

  /// No description provided for @airport_detail_info_tarif_bottom_sheet_description.
  ///
  /// In ru, this message translates to:
  /// **'Вы можете посмотреть все варианты. При оформлении укажите номер рейса — мы определим терминал автоматически. Если терминал ещё неизвестен, мы рассчитаем ориентировочную стоимость и свяжемся с вами для уточнения.'**
  String get airport_detail_info_tarif_bottom_sheet_description;

  /// No description provided for @core_delete_button.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get core_delete_button;

  /// No description provided for @core_cancel_button.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get core_cancel_button;

  /// No description provided for @core_cancel_short_button.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get core_cancel_short_button;

  /// No description provided for @core_back_button.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get core_back_button;

  /// No description provided for @core_male.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get core_male;

  /// No description provided for @core_female.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get core_female;

  /// No description provided for @core_not_specified.
  ///
  /// In ru, this message translates to:
  /// **'Не указан'**
  String get core_not_specified;

  /// No description provided for @auth_invalid_code.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный код'**
  String get auth_invalid_code;

  /// No description provided for @profile_traveler_card_default_name.
  ///
  /// In ru, this message translates to:
  /// **'Путешественник'**
  String get profile_traveler_card_default_name;

  /// No description provided for @profile_traveler_card_gender_label.
  ///
  /// In ru, this message translates to:
  /// **'Пол:'**
  String get profile_traveler_card_gender_label;

  /// No description provided for @profile_traveler_card_dob_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения:'**
  String get profile_traveler_card_dob_label;

  /// No description provided for @profile_traveler_card_dob_not_specified.
  ///
  /// In ru, this message translates to:
  /// **'Не указана'**
  String get profile_traveler_card_dob_not_specified;

  /// No description provided for @profile_traveler_card_edit_button.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать данные'**
  String get profile_traveler_card_edit_button;

  /// No description provided for @profile_traveler_card_badge_passenger.
  ///
  /// In ru, this message translates to:
  /// **'Пассажир'**
  String get profile_traveler_card_badge_passenger;

  /// No description provided for @profile_logout_message.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти из аккаунта?'**
  String get profile_logout_message;

  /// No description provided for @profile_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Другие путешественники'**
  String get profile_travelers_title;

  /// No description provided for @profile_travelers_empty_text.
  ///
  /// In ru, this message translates to:
  /// **'Вы ещё не добавили других путешественников. Сохраните данные семьи, коллег или тех, с кем вы ездите чаще всего — и они будут автоматически подставляться в бронирования. Это сэкономит время и избавит от повторного заполнения документов'**
  String get profile_travelers_empty_text;

  /// No description provided for @profile_travelers_delete_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Удаление пассажира'**
  String get profile_travelers_delete_dialog_title;

  /// No description provided for @profile_travelers_delete_dialog_message.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите удалить пассажира из списка? Это действие нельзя будет отменить'**
  String get profile_travelers_delete_dialog_message;

  /// No description provided for @profile_travelers_add_button.
  ///
  /// In ru, this message translates to:
  /// **'Добавить путешественников'**
  String get profile_travelers_add_button;

  /// No description provided for @profile_delete_account_message.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить аккаунт?'**
  String get profile_delete_account_message;

  /// No description provided for @profile_birthday_hint_format.
  ///
  /// In ru, this message translates to:
  /// **'ДД.ММ.ГГГГ'**
  String get profile_birthday_hint_format;

  /// No description provided for @services_endpoints_tariffs_title.
  ///
  /// In ru, this message translates to:
  /// **'Тарифы'**
  String get services_endpoints_tariffs_title;

  /// No description provided for @core_logout_button.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get core_logout_button;

  /// No description provided for @edit_traveler_add_title.
  ///
  /// In ru, this message translates to:
  /// **'Добавление путешественника'**
  String get edit_traveler_add_title;

  /// No description provided for @edit_traveler_edit_title.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование данных'**
  String get edit_traveler_edit_title;

  /// No description provided for @edit_traveler_add_button.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get edit_traveler_add_button;

  /// No description provided for @edit_traveler_consent_text.
  ///
  /// In ru, this message translates to:
  /// **'Я подтверждаю, что указанное лицо согласно на передачу персональных данных'**
  String get edit_traveler_consent_text;

  /// No description provided for @select_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные пассажира'**
  String get select_travelers_title;

  /// No description provided for @select_travelers_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Данные указываются строго латинскими буквами, как в паспорте'**
  String get select_travelers_subtitle;

  /// No description provided for @select_travelers_passengers_title.
  ///
  /// In ru, this message translates to:
  /// **'Мои данные'**
  String get select_travelers_passengers_title;

  /// No description provided for @select_travelers_i_am_flying.
  ///
  /// In ru, this message translates to:
  /// **'Лечу я'**
  String get select_travelers_i_am_flying;

  /// No description provided for @select_travelers_adults.
  ///
  /// In ru, this message translates to:
  /// **'Взрослые'**
  String get select_travelers_adults;

  /// No description provided for @select_travelers_children.
  ///
  /// In ru, this message translates to:
  /// **'Дети (2–12 лет)'**
  String get select_travelers_children;

  /// No description provided for @select_travelers_infants.
  ///
  /// In ru, this message translates to:
  /// **'Дети (до 2 лет)'**
  String get select_travelers_infants;

  /// No description provided for @select_travelers_prm.
  ///
  /// In ru, this message translates to:
  /// **'Есть пассажир с ограниченной мобильностью (PRM)'**
  String get select_travelers_prm;

  /// No description provided for @select_travelers_add_passenger.
  ///
  /// In ru, this message translates to:
  /// **'Добавить пассажира'**
  String get select_travelers_add_passenger;

  /// No description provided for @select_travelers_add_companion.
  ///
  /// In ru, this message translates to:
  /// **'Добавить сопровождающего'**
  String get select_travelers_add_companion;

  /// No description provided for @select_travelers_form_select_from_list.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из своего списка'**
  String get select_travelers_form_select_from_list;

  /// No description provided for @select_travelers_form_traveler_label.
  ///
  /// In ru, this message translates to:
  /// **'Путешественник #{id}'**
  String select_travelers_form_traveler_label(int id);

  /// No description provided for @select_travelers_form_first_name_label.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get select_travelers_form_first_name_label;

  /// No description provided for @select_travelers_form_first_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Имя (латиницей, например, Ivan)'**
  String get select_travelers_form_first_name_hint;

  /// No description provided for @select_travelers_form_last_name_label.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get select_travelers_form_last_name_label;

  /// No description provided for @select_travelers_form_last_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия (латиницей, например, Ivanov)'**
  String get select_travelers_form_last_name_hint;

  /// No description provided for @select_travelers_form_citizenship_label.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get select_travelers_form_citizenship_label;

  /// No description provided for @select_travelers_form_citizenship_hint.
  ///
  /// In ru, this message translates to:
  /// **'Не выбрано'**
  String get select_travelers_form_citizenship_hint;

  /// No description provided for @select_travelers_form_birthdate_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get select_travelers_form_birthdate_label;

  /// No description provided for @select_travelers_form_birthdate_hint.
  ///
  /// In ru, this message translates to:
  /// **'ДД.ММ.ГГГГ'**
  String get select_travelers_form_birthdate_hint;

  /// No description provided for @select_travelers_form_phone_label.
  ///
  /// In ru, this message translates to:
  /// **'Контактный телефон'**
  String get select_travelers_form_phone_label;

  /// No description provided for @select_travelers_form_email_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес электронной почты'**
  String get select_travelers_form_email_label;

  /// No description provided for @select_travelers_form_email_hint.
  ///
  /// In ru, this message translates to:
  /// **'example@example.com'**
  String get select_travelers_form_email_hint;

  /// No description provided for @select_travelers_form_delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get select_travelers_form_delete;

  /// No description provided for @select_travelers_passenger_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные {index, select, 2{второго} 3{третьего} 4{четвёртого} 5{пятого} 6{шестого} 7{седьмого} 8{восьмого} 9{девятого} 10{десятого} other{{index}-го  пассажира}}'**
  String select_travelers_passenger_header(String index);

  /// No description provided for @select_travelers_first_companion_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные сопровождающего'**
  String get select_travelers_first_companion_header;

  /// No description provided for @select_travelers_first_companion_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Данные указываются строго латинскими буквами, как в паспорте'**
  String get select_travelers_first_companion_subtitle;

  /// No description provided for @select_travelers_companion_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные {index, select, 1{первого} 2{второго} 3{третьего} 4{четвёртого} 5{пятого} 6{шестого} 7{седьмого} 8{восьмого} 9{девятого} 10{десятого} other{{index}-го  сопровождающего}}'**
  String select_travelers_companion_header(String index);

  /// No description provided for @select_travelers_confirm_email_title.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите почту'**
  String get select_travelers_confirm_email_title;

  /// No description provided for @select_travelers_confirm_email_create_account_message.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите почту, чтобы завершить создание аккаунта и получить детали бронирования.'**
  String get select_travelers_confirm_email_create_account_message;

  /// No description provided for @select_travelers_confirm_email_guest_message.
  ///
  /// In ru, this message translates to:
  /// **'Вы можете оформить заказ без регистрации, но нам нужно подтвердить вашу почту. Это необходимо, чтобы отправить подтверждение и детали услуги.'**
  String get select_travelers_confirm_email_guest_message;

  /// No description provided for @select_travelers_confirm_email_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get select_travelers_confirm_email_continue_button;

  /// No description provided for @ordering_contact_person_minimum_age_error.
  ///
  /// In ru, this message translates to:
  /// **'Контактное лицо должно быть не младше 12 лет.'**
  String get ordering_contact_person_minimum_age_error;

  /// No description provided for @transfers_tariffs_car_categories_title.
  ///
  /// In ru, this message translates to:
  /// **'Категории автомобиля'**
  String get transfers_tariffs_car_categories_title;

  /// No description provided for @lounge_tariffs_car_categories_title.
  ///
  /// In ru, this message translates to:
  /// **'VIP-залы'**
  String get lounge_tariffs_car_categories_title;

  /// No description provided for @vip_lounge_card_price_label.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость'**
  String get vip_lounge_card_price_label;

  /// No description provided for @vip_lounge_card_price_prefix.
  ///
  /// In ru, this message translates to:
  /// **'от'**
  String get vip_lounge_card_price_prefix;

  /// No description provided for @vip_lounge_card_watch_all_photos.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть все фото'**
  String get vip_lounge_card_watch_all_photos;

  /// No description provided for @vip_lounge_card_select_button.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать {name}'**
  String vip_lounge_card_select_button(String name);

  /// No description provided for @send_code_terms_agreement.
  ///
  /// In ru, this message translates to:
  /// **'Вы соглашаетесь с нашими '**
  String get send_code_terms_agreement;

  /// No description provided for @tariffs_title.
  ///
  /// In ru, this message translates to:
  /// **'Тарифы'**
  String get tariffs_title;

  /// No description provided for @edit_traveler_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Укажите имя в точности, как оно написано в паспорте или другом официальном документе'**
  String get edit_traveler_name_hint;

  /// No description provided for @payment_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Выберите способ оплаты'**
  String get payment_screen_title;

  /// No description provided for @payment_methods_card.
  ///
  /// In ru, this message translates to:
  /// **'Банковской картой'**
  String get payment_methods_card;

  /// No description provided for @payment_methods_apple_google_pay.
  ///
  /// In ru, this message translates to:
  /// **'Apple Pay / Google Pay'**
  String get payment_methods_apple_google_pay;

  /// No description provided for @payment_methods_soon.
  ///
  /// In ru, this message translates to:
  /// **'(скоро)'**
  String get payment_methods_soon;

  /// No description provided for @payment_bonus_points_auth_hint.
  ///
  /// In ru, this message translates to:
  /// **'Доступно после входа/создания аккаунта'**
  String get payment_bonus_points_auth_hint;

  /// No description provided for @payment_bonus_points_use.
  ///
  /// In ru, this message translates to:
  /// **'Использовать баллы'**
  String get payment_bonus_points_use;

  /// No description provided for @payment_bonus_points_available.
  ///
  /// In ru, this message translates to:
  /// **'Доступно {available}'**
  String payment_bonus_points_available(String available);

  /// No description provided for @payment_bonus_points_use_all.
  ///
  /// In ru, this message translates to:
  /// **'Использовать все'**
  String get payment_bonus_points_use_all;

  /// No description provided for @payment_total_title.
  ///
  /// In ru, this message translates to:
  /// **'Итоговая стоимость:'**
  String get payment_total_title;

  /// No description provided for @payment_total_bonus_prefix.
  ///
  /// In ru, this message translates to:
  /// **'После оплаты вы получите'**
  String get payment_total_bonus_prefix;

  /// No description provided for @payment_total_bonus_points.
  ///
  /// In ru, this message translates to:
  /// **'+{points} баллов'**
  String payment_total_bonus_points(String points);

  /// No description provided for @payment_total_bonus_suffix.
  ///
  /// In ru, this message translates to:
  /// **'Они автоматически появятся на вашем счёте'**
  String get payment_total_bonus_suffix;

  /// No description provided for @payment_terms_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Продолжая я соглашаюсь с '**
  String get payment_terms_prefix;

  /// No description provided for @payment_terms_link.
  ///
  /// In ru, this message translates to:
  /// **'Условиями использования'**
  String get payment_terms_link;

  /// No description provided for @payment_terms_and.
  ///
  /// In ru, this message translates to:
  /// **' и '**
  String get payment_terms_and;

  /// No description provided for @payment_privacy_link.
  ///
  /// In ru, this message translates to:
  /// **'Политикой конфиденциальности'**
  String get payment_privacy_link;

  /// No description provided for @payment_pay_button.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get payment_pay_button;

  /// No description provided for @payment_free_checkout_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Оформление заявки'**
  String get payment_free_checkout_screen_title;

  /// No description provided for @payment_free_checkout_payment_manual_hint.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость трансфера рассчитывается менеджером вручную. После отправки заявки мы свяжемся с вами в течение часа, чтобы уточнить детали и согласовать стоимость. Пожалуйста, дождитесь звонка.\n\nПосле согласования стоимости вы сможете оплатить услугу в личном кабинете — во вкладке «Мои путешествия» → «Бронирования».'**
  String get payment_free_checkout_payment_manual_hint;

  /// No description provided for @payment_free_checkout_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить заявку'**
  String get payment_free_checkout_submit_button;

  /// No description provided for @summary_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Сводка'**
  String get summary_screen_title;

  /// No description provided for @summary_flight_info_title.
  ///
  /// In ru, this message translates to:
  /// **'Информация о рейсе'**
  String get summary_flight_info_title;

  /// No description provided for @summary_services_not_required.
  ///
  /// In ru, this message translates to:
  /// **'Услуги в этом аэропорту не требуются'**
  String get summary_services_not_required;

  /// No description provided for @summary_transfer_price_not_included.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость трансфера не включена. Менеджер свяжется с вами для уточнения цены.'**
  String get summary_transfer_price_not_included;

  /// No description provided for @summary_transfer_route_title.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут трансфера'**
  String get summary_transfer_route_title;

  /// No description provided for @summary_transfer_pickup_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес отправления:'**
  String get summary_transfer_pickup_address_label;

  /// No description provided for @summary_transfer_stop_label.
  ///
  /// In ru, this message translates to:
  /// **'Остановка:'**
  String get summary_transfer_stop_label;

  /// No description provided for @summary_transfer_dropoff_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес назначения:'**
  String get summary_transfer_dropoff_address_label;

  /// No description provided for @summary_transfer_car_category_label.
  ///
  /// In ru, this message translates to:
  /// **'Категория автомобиля:'**
  String get summary_transfer_car_category_label;

  /// No description provided for @summary_transfer_car_standard.
  ///
  /// In ru, this message translates to:
  /// **'Стандарт'**
  String get summary_transfer_car_standard;

  /// No description provided for @summary_additional_conditions_title.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные условия'**
  String get summary_additional_conditions_title;

  /// No description provided for @summary_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Путешественники'**
  String get summary_travelers_title;

  /// No description provided for @summary_companions_title.
  ///
  /// In ru, this message translates to:
  /// **'Сопровождающие'**
  String get summary_companions_title;

  /// No description provided for @summary_agreements_title.
  ///
  /// In ru, this message translates to:
  /// **'Согласие'**
  String get summary_agreements_title;

  /// No description provided for @summary_agreement_data_correctness.
  ///
  /// In ru, this message translates to:
  /// **'Я подтверждаю корректность данных'**
  String get summary_agreement_data_correctness;

  /// No description provided for @summary_agreement_terms_of_use.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен(на), с политикой конфиденциальности и условиями использования'**
  String get summary_agreement_terms_of_use;

  /// No description provided for @summary_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'К оплате'**
  String get summary_submit_button;

  /// No description provided for @summary_total_label.
  ///
  /// In ru, this message translates to:
  /// **'ИТОГО:'**
  String get summary_total_label;

  /// No description provided for @summary_terminal_label.
  ///
  /// In ru, this message translates to:
  /// **'Терминал {name}'**
  String summary_terminal_label(String name);

  /// No description provided for @summary_flight_number_label.
  ///
  /// In ru, this message translates to:
  /// **'Рейс: {number}'**
  String summary_flight_number_label(String number);

  /// No description provided for @order_status_paid.
  ///
  /// In ru, this message translates to:
  /// **'Оплачен'**
  String get order_status_paid;

  /// No description provided for @order_status_waiting_payment.
  ///
  /// In ru, this message translates to:
  /// **'Ждёт оплату'**
  String get order_status_waiting_payment;

  /// No description provided for @order_status_draft.
  ///
  /// In ru, this message translates to:
  /// **'Черновик'**
  String get order_status_draft;

  /// No description provided for @order_status_processing.
  ///
  /// In ru, this message translates to:
  /// **'Обработка'**
  String get order_status_processing;

  /// No description provided for @order_ref_number.
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа: {ref}'**
  String order_ref_number(String ref);

  /// No description provided for @my_trips_tab_drafts.
  ///
  /// In ru, this message translates to:
  /// **'Черновики'**
  String get my_trips_tab_drafts;

  /// No description provided for @my_trips_tab_upcoming.
  ///
  /// In ru, this message translates to:
  /// **'Предстоящие'**
  String get my_trips_tab_upcoming;

  /// No description provided for @my_trips_tab_completed.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые'**
  String get my_trips_tab_completed;

  /// No description provided for @my_trips_tab_cancelled.
  ///
  /// In ru, this message translates to:
  /// **'Отменённые'**
  String get my_trips_tab_cancelled;

  /// No description provided for @order_details_id_label.
  ///
  /// In ru, this message translates to:
  /// **'Заказ #{id}'**
  String order_details_id_label(String id);

  /// No description provided for @my_trips_not_auth_title.
  ///
  /// In ru, this message translates to:
  /// **'Ваши путешествия — здесь'**
  String get my_trips_not_auth_title;

  /// No description provided for @my_trips_not_auth_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Войдите в аккаунт, чтобы сохранить и просматривать свои поездки'**
  String get my_trips_not_auth_subtitle;

  /// No description provided for @my_trips_empty_state_title.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет бронирований'**
  String get my_trips_empty_state_title;

  /// No description provided for @my_trips_empty_state_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Оформите первую услугу и все поездки появятся здесь'**
  String get my_trips_empty_state_subtitle;

  /// No description provided for @my_trips_empty_state_find_booking_button.
  ///
  /// In ru, this message translates to:
  /// **'Не могу найти бронирование'**
  String get my_trips_empty_state_find_booking_button;

  /// No description provided for @my_trips_empty_state_select_airport_button.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к выбору аэропорта'**
  String get my_trips_empty_state_select_airport_button;

  /// No description provided for @my_trips_empty_state_book_service_button.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать услугу'**
  String get my_trips_empty_state_book_service_button;

  /// No description provided for @order_flight_number_label.
  ///
  /// In ru, this message translates to:
  /// **'Рейс: {number}'**
  String order_flight_number_label(String number);

  /// No description provided for @order_details_cancellation_rules_title.
  ///
  /// In ru, this message translates to:
  /// **'Правила отмены'**
  String get order_details_cancellation_rules_title;

  /// No description provided for @order_details_cancellation_rule_1.
  ///
  /// In ru, this message translates to:
  /// **'Отмена услуги менее чем за 48 часов до времени начала — 100% стоимости.'**
  String get order_details_cancellation_rule_1;

  /// No description provided for @order_details_cancellation_rule_2.
  ///
  /// In ru, this message translates to:
  /// **'Неявка пассажира — 100% стоимости.'**
  String get order_details_cancellation_rule_2;

  /// No description provided for @order_details_cancellation_rule_3.
  ///
  /// In ru, this message translates to:
  /// **'Изменения в бронировании возможны по согласованию с менеджером и зависят от доступности услуги.'**
  String get order_details_cancellation_rule_3;

  /// No description provided for @order_details_my_order_title.
  ///
  /// In ru, this message translates to:
  /// **'Мой заказ'**
  String get order_details_my_order_title;

  /// No description provided for @order_details_booking_number.
  ///
  /// In ru, this message translates to:
  /// **'Номер бронирования'**
  String get order_details_booking_number;

  /// No description provided for @order_details_flight_info.
  ///
  /// In ru, this message translates to:
  /// **'Информация о рейсе'**
  String get order_details_flight_info;

  /// No description provided for @order_details_show_to_employee.
  ///
  /// In ru, this message translates to:
  /// **'Показать сотруднику'**
  String get order_details_show_to_employee;

  /// No description provided for @order_details_download_receipt.
  ///
  /// In ru, this message translates to:
  /// **'Скачать квитанцию'**
  String get order_details_download_receipt;

  /// No description provided for @order_details_what_next.
  ///
  /// In ru, this message translates to:
  /// **'Что дальше?'**
  String get order_details_what_next;

  /// No description provided for @order_details_price_details.
  ///
  /// In ru, this message translates to:
  /// **'Детали цены'**
  String get order_details_price_details;

  /// No description provided for @order_details_additional_conditions.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные условия'**
  String get order_details_additional_conditions;

  /// No description provided for @order_details_travelers_companions.
  ///
  /// In ru, this message translates to:
  /// **'Путешественники/Сопровождающие'**
  String get order_details_travelers_companions;

  /// No description provided for @order_details_our_recommendations.
  ///
  /// In ru, this message translates to:
  /// **'Наши рекомендации'**
  String get order_details_our_recommendations;

  /// No description provided for @order_details_add_to_calendar.
  ///
  /// In ru, this message translates to:
  /// **'Добавить в календарь'**
  String get order_details_add_to_calendar;

  /// No description provided for @order_details_support_text.
  ///
  /// In ru, this message translates to:
  /// **'Если вам нужно внести изменения, пожалуйста, обратитесь в поддержку'**
  String get order_details_support_text;

  /// No description provided for @order_details_cancel_order.
  ///
  /// In ru, this message translates to:
  /// **'Отменить заявку'**
  String get order_details_cancel_order;

  /// No description provided for @order_details_order_new_service.
  ///
  /// In ru, this message translates to:
  /// **'Заказать новую услугу'**
  String get order_details_order_new_service;

  /// No description provided for @order_details_endpoint_departure.
  ///
  /// In ru, this message translates to:
  /// **'Вылет'**
  String get order_details_endpoint_departure;

  /// No description provided for @order_details_endpoint_arrival.
  ///
  /// In ru, this message translates to:
  /// **'Прилет'**
  String get order_details_endpoint_arrival;

  /// No description provided for @order_details_endpoint_transit.
  ///
  /// In ru, this message translates to:
  /// **'Транзит'**
  String get order_details_endpoint_transit;

  /// No description provided for @order_details_endpoint_transit_arrival.
  ///
  /// In ru, this message translates to:
  /// **'Транзит (прилет)'**
  String get order_details_endpoint_transit_arrival;

  /// No description provided for @order_details_endpoint_transit_departure.
  ///
  /// In ru, this message translates to:
  /// **'Транзит (вылет)'**
  String get order_details_endpoint_transit_departure;

  /// No description provided for @order_details_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Путешественники'**
  String get order_details_travelers_title;

  /// No description provided for @order_details_companions_title.
  ///
  /// In ru, this message translates to:
  /// **'Сопровождающие'**
  String get order_details_companions_title;

  /// No description provided for @order_status_requires_surcharge.
  ///
  /// In ru, this message translates to:
  /// **'Требует доплаты'**
  String get order_status_requires_surcharge;

  /// No description provided for @order_details_whats_next_text.
  ///
  /// In ru, this message translates to:
  /// **'Мы позаботимся о том, чтобы ваш путь прошёл спокойно и без лишних вопросов.\n\n1. Сохраните QR-код/номер бронирования, он нужен, чтобы быстро идентифицировать вас\n  • Он нужен, чтобы сотрудник Example App быстро идентифицировал вас\n  • Вы сможете открыть его в любой момент в разделе Мои поездки\n\n2. Ожидайте сообщение от нас\n  • Мы заранее пришлём напоминание с временем, терминалом и точкой встречи\n  • Если понадобится дополнительная информация — менеджер свяжется с вами лично\n\n3. Как найти сотрудника в день поездки\n  • Приходите в указанное место встречи: стойка Fast Track, VIP-вход или зона прилёта\n  • Сотрудник будет ждать вас\n  • Если вдруг вы не видите его сразу — просто ответьте на уведомление или позвоните по номеру из письма, мы всегда на связи.\n\n4. Что иметь при себе\n  • Паспорт\n  • QR-код\n\nИ обязательно не переживайте, в аэропорту вы не останетесь одни — мы всегда на связи!'**
  String get order_details_whats_next_text;

  /// No description provided for @order_details_our_recommendations_text.
  ///
  /// In ru, this message translates to:
  /// **'• Прибывайте заранее\nДля международных рейсов рекомендуем приезжать за 2–2,5 часа, для внутренних — за 1,5 часа, чтобы комфортно пройти все этапы с Fast Track или сопровождением.\n\n• Где находится стойка услуги\nСтойка Fast Track / Meet & Assist расположена в зоне вылета, рядом с контролем безопасности. Следуйте указателям \"Fast Track / Priority\" или покажите свой код сотруднику у входа.\n\n• Как добраться до регистрации\nОт входа до стойки регистрации — примерно 3–7 минут ходьбы. Если вы забронировали сопровождение, сотрудник встретит вас у входа или в согласованной точке и проведёт весь путь за вас.\n\n• Сколько времени занимает прохождение\nС Fast Track время прохождения формальностей обычно составляет от 5 до 15 минут, в зависимости от загруженности терминала.\n\n• Если вы путешествуете с багажом\nАгент поможет перенести багаж и проведёт к приоритетной стойке регистрации, если она доступна в этом терминале.'**
  String get order_details_our_recommendations_text;

  /// No description provided for @transfer_input_title.
  ///
  /// In ru, this message translates to:
  /// **'Введите свои данные'**
  String get transfer_input_title;

  /// No description provided for @transfer_input_description.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, укажите свои данные латинскими буквами, чтобы сотрудники смогли их понять'**
  String get transfer_input_description;

  /// No description provided for @transfer_order_info_message.
  ///
  /// In ru, this message translates to:
  /// **'Трансфер можно оформить отдельно или вместе с другими сервисами аэропорта. Чтобы выбрать несколько услуг, включая трансфер, перейдите в основную форму здесь.'**
  String get transfer_order_info_message;

  /// No description provided for @transfer_order_info_button.
  ///
  /// In ru, this message translates to:
  /// **'Оформить услуги аэропорта'**
  String get transfer_order_info_button;

  /// No description provided for @transfer_trip_data_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные поездки'**
  String get transfer_trip_data_title;

  /// No description provided for @transfer_date_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get transfer_date_label;

  /// No description provided for @transfer_time_label.
  ///
  /// In ru, this message translates to:
  /// **'Время'**
  String get transfer_time_label;

  /// No description provided for @transfer_car_category_label.
  ///
  /// In ru, this message translates to:
  /// **'Категория автомобиля'**
  String get transfer_car_category_label;

  /// No description provided for @transfer_trip_route_title.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут поездки'**
  String get transfer_trip_route_title;

  /// No description provided for @transfer_departure_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес отправления'**
  String get transfer_departure_address_label;

  /// No description provided for @transfer_arrival_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес назначения'**
  String get transfer_arrival_address_label;

  /// No description provided for @transfer_intermediate_point_label.
  ///
  /// In ru, this message translates to:
  /// **'Промежуточная точка'**
  String get transfer_intermediate_point_label;

  /// No description provided for @transfer_auth_choice_title.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить бронирование в личном кабинете?'**
  String get transfer_auth_choice_title;

  /// No description provided for @transfer_auth_choice_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Если у вас уже есть аккаунт — просто войдите.\nЕсли нет, мы можем создать аккаунт и сохранить бронирование в «Моих путешествиях»'**
  String get transfer_auth_choice_subtitle;

  /// No description provided for @transfer_auth_choice_login_button.
  ///
  /// In ru, this message translates to:
  /// **'Войти в аккаунт'**
  String get transfer_auth_choice_login_button;

  /// No description provided for @transfer_auth_choice_create_account_label.
  ///
  /// In ru, this message translates to:
  /// **'Создать аккаунт и сохранить бронь'**
  String get transfer_auth_choice_create_account_label;

  /// No description provided for @transfer_auth_choice_create_account_hint.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправим код на почту. После подтверждения все данные сохранятся.'**
  String get transfer_auth_choice_create_account_hint;

  /// No description provided for @transfer_auth_choice_without_auth_label.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить без регистрации'**
  String get transfer_auth_choice_without_auth_label;

  /// No description provided for @transfer_auth_choice_without_auth_hint.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование не появится в «Моих путешествиях».\nДля управления заказом потребуется код бронирования — сохраните его.'**
  String get transfer_auth_choice_without_auth_hint;

  /// No description provided for @transfer_auth_choice_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get transfer_auth_choice_continue_button;

  /// No description provided for @transfer_select_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные пассажира'**
  String get transfer_select_travelers_title;

  /// No description provided for @transfer_select_travelers_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Данные указываются строго латинскими буквами, как в паспорте'**
  String get transfer_select_travelers_subtitle;

  /// No description provided for @transfer_select_travelers_passengers_title.
  ///
  /// In ru, this message translates to:
  /// **'Мои данные'**
  String get transfer_select_travelers_passengers_title;

  /// No description provided for @transfer_select_travelers_i_am_traveling.
  ///
  /// In ru, this message translates to:
  /// **'Я поеду'**
  String get transfer_select_travelers_i_am_traveling;

  /// No description provided for @transfer_select_travelers_adults.
  ///
  /// In ru, this message translates to:
  /// **'Взрослые'**
  String get transfer_select_travelers_adults;

  /// No description provided for @transfer_select_travelers_children.
  ///
  /// In ru, this message translates to:
  /// **'Дети (2–12 лет)'**
  String get transfer_select_travelers_children;

  /// No description provided for @transfer_select_travelers_infants.
  ///
  /// In ru, this message translates to:
  /// **'Дети (до 2 лет)'**
  String get transfer_select_travelers_infants;

  /// No description provided for @transfer_select_travelers_prm.
  ///
  /// In ru, this message translates to:
  /// **'Есть пассажир с ограниченной мобильностью (PRM)'**
  String get transfer_select_travelers_prm;

  /// No description provided for @transfer_select_travelers_add_passenger.
  ///
  /// In ru, this message translates to:
  /// **'Добавить пассажира'**
  String get transfer_select_travelers_add_passenger;

  /// No description provided for @transfer_select_travelers_add_companion.
  ///
  /// In ru, this message translates to:
  /// **'Добавить сопровождающего'**
  String get transfer_select_travelers_add_companion;

  /// No description provided for @transfer_select_travelers_form_select_from_list.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из своего списка'**
  String get transfer_select_travelers_form_select_from_list;

  /// No description provided for @transfer_select_travelers_form_traveler_label.
  ///
  /// In ru, this message translates to:
  /// **'Путешественник #{id}'**
  String transfer_select_travelers_form_traveler_label(Object id);

  /// No description provided for @transfer_select_travelers_form_first_name_label.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get transfer_select_travelers_form_first_name_label;

  /// No description provided for @transfer_select_travelers_form_first_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Имя (латиницей, например, Ivan)'**
  String get transfer_select_travelers_form_first_name_hint;

  /// No description provided for @transfer_select_travelers_form_last_name_label.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get transfer_select_travelers_form_last_name_label;

  /// No description provided for @transfer_select_travelers_form_last_name_hint.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия (латиницей, например, Ivanov)'**
  String get transfer_select_travelers_form_last_name_hint;

  /// No description provided for @transfer_select_travelers_form_citizenship_label.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get transfer_select_travelers_form_citizenship_label;

  /// No description provided for @transfer_select_travelers_form_citizenship_hint.
  ///
  /// In ru, this message translates to:
  /// **'Не выбрано'**
  String get transfer_select_travelers_form_citizenship_hint;

  /// No description provided for @transfer_select_travelers_form_birthdate_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get transfer_select_travelers_form_birthdate_label;

  /// No description provided for @transfer_select_travelers_form_birthdate_hint.
  ///
  /// In ru, this message translates to:
  /// **'ДД.ММ.ГГГГ'**
  String get transfer_select_travelers_form_birthdate_hint;

  /// No description provided for @transfer_select_travelers_form_phone_label.
  ///
  /// In ru, this message translates to:
  /// **'Контактный телефон'**
  String get transfer_select_travelers_form_phone_label;

  /// No description provided for @transfer_select_travelers_form_email_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес электронной почты'**
  String get transfer_select_travelers_form_email_label;

  /// No description provided for @transfer_select_travelers_form_email_hint.
  ///
  /// In ru, this message translates to:
  /// **'example@example.com'**
  String get transfer_select_travelers_form_email_hint;

  /// No description provided for @transfer_select_travelers_form_delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get transfer_select_travelers_form_delete;

  /// No description provided for @transfer_select_travelers_passenger_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные {index, select, 2{второго} 3{третьего} 4{четвёртого} 5{пятого} 6{шестого} 7{седьмого} 8{восьмого} 9{девятого} 10{десятого} other{{index}-го  пассажира}}'**
  String transfer_select_travelers_passenger_header(String index);

  /// No description provided for @transfer_select_travelers_first_companion_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные сопровождающего'**
  String get transfer_select_travelers_first_companion_header;

  /// No description provided for @transfer_select_travelers_first_companion_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Данные указываются строго латинскими буквами, как в паспорте'**
  String get transfer_select_travelers_first_companion_subtitle;

  /// No description provided for @transfer_select_travelers_companion_header.
  ///
  /// In ru, this message translates to:
  /// **'Данные {index, select, 1{первого} 2{второго} 3{третьего} 4{четвёртого} 5{пятого} 6{шестого} 7{седьмого} 8{восьмого} 9{девятого} 10{десятого} other{{index}-го  сопровождающего}}'**
  String transfer_select_travelers_companion_header(String index);

  /// No description provided for @transfer_select_travelers_confirm_email_title.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите почту'**
  String get transfer_select_travelers_confirm_email_title;

  /// No description provided for @transfer_select_travelers_confirm_email_create_account_message.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите почту, чтобы завершить создание аккаунта и получить детали бронирования.'**
  String get transfer_select_travelers_confirm_email_create_account_message;

  /// No description provided for @transfer_select_travelers_confirm_email_guest_message.
  ///
  /// In ru, this message translates to:
  /// **'Вы можете оформить заказ без регистрации, но нам нужно подтвердить вашу почту. Это необходимо, чтобы отправить подтверждение и детали услуги.'**
  String get transfer_select_travelers_confirm_email_guest_message;

  /// No description provided for @transfer_select_travelers_confirm_email_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get transfer_select_travelers_confirm_email_continue_button;

  /// No description provided for @transfer_auth_code_title.
  ///
  /// In ru, this message translates to:
  /// **'Введите код'**
  String get transfer_auth_code_title;

  /// No description provided for @transfer_auth_code_sent_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили письмо с кодом подтверждения на '**
  String get transfer_auth_code_sent_prefix;

  /// No description provided for @transfer_auth_code_sent_suffix.
  ///
  /// In ru, this message translates to:
  /// **'. Пожалуйста, введите его.'**
  String get transfer_auth_code_sent_suffix;

  /// No description provided for @transfer_auth_code_resend_prefix.
  ///
  /// In ru, this message translates to:
  /// **'Вы сможете отправить код повторно через '**
  String get transfer_auth_code_resend_prefix;

  /// No description provided for @transfer_auth_code_resend_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get transfer_auth_code_resend_button;

  /// No description provided for @transfer_send_code_terms_agreement.
  ///
  /// In ru, this message translates to:
  /// **'Нажимая на кнопку «Продолжить», вы соглашаетесь с '**
  String get transfer_send_code_terms_agreement;

  /// No description provided for @transfer_auth_terms_link.
  ///
  /// In ru, this message translates to:
  /// **'Условиями использования'**
  String get transfer_auth_terms_link;

  /// No description provided for @transfer_auth_and.
  ///
  /// In ru, this message translates to:
  /// **'и'**
  String get transfer_auth_and;

  /// No description provided for @transfer_auth_privacy_link.
  ///
  /// In ru, this message translates to:
  /// **'Политикой конфиденциальности'**
  String get transfer_auth_privacy_link;

  /// No description provided for @transfer_auth_copyright.
  ///
  /// In ru, this message translates to:
  /// **'© Example App 2024'**
  String get transfer_auth_copyright;

  /// No description provided for @transfer_auth_continue_button.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get transfer_auth_continue_button;

  /// No description provided for @transfer_checkout_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Оформление заявки'**
  String get transfer_checkout_screen_title;

  /// No description provided for @transfer_checkout_transfer_route_title.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут трансфера'**
  String get transfer_checkout_transfer_route_title;

  /// No description provided for @transfer_checkout_transfer_pickup_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес подачи'**
  String get transfer_checkout_transfer_pickup_address_label;

  /// No description provided for @transfer_checkout_transfer_dropoff_address_label.
  ///
  /// In ru, this message translates to:
  /// **'Адрес назначения'**
  String get transfer_checkout_transfer_dropoff_address_label;

  /// No description provided for @transfer_checkout_transfer_stop_label.
  ///
  /// In ru, this message translates to:
  /// **'Остановка'**
  String get transfer_checkout_transfer_stop_label;

  /// No description provided for @transfer_checkout_transfer_car_category_label.
  ///
  /// In ru, this message translates to:
  /// **'Класс автомобиля'**
  String get transfer_checkout_transfer_car_category_label;

  /// No description provided for @transfer_checkout_transfer_car_standard.
  ///
  /// In ru, this message translates to:
  /// **'Стандарт'**
  String get transfer_checkout_transfer_car_standard;

  /// No description provided for @transfer_checkout_total_label.
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get transfer_checkout_total_label;

  /// No description provided for @transfer_checkout_additional_conditions_title.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные условия'**
  String get transfer_checkout_additional_conditions_title;

  /// No description provided for @transfer_checkout_travelers_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные о пассажирах'**
  String get transfer_checkout_travelers_title;

  /// No description provided for @transfer_checkout_companions_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные о сопровождающих'**
  String get transfer_checkout_companions_title;

  /// No description provided for @transfer_checkout_agreements_title.
  ///
  /// In ru, this message translates to:
  /// **'Соглашения'**
  String get transfer_checkout_agreements_title;

  /// No description provided for @transfer_checkout_agreement_data_correctness.
  ///
  /// In ru, this message translates to:
  /// **'Я подтверждаю корректность данных'**
  String get transfer_checkout_agreement_data_correctness;

  /// No description provided for @transfer_checkout_agreement_terms_of_use.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен(на), с политикой конфиденциальности и условиями использования'**
  String get transfer_checkout_agreement_terms_of_use;

  /// No description provided for @transfer_checkout_submit_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить заявку'**
  String get transfer_checkout_submit_button;

  /// No description provided for @transfer_checkout_payment_manual_hint.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость трансфера рассчитывается менеджером вручную. После отправки заявки мы свяжемся с вами в течение часа, чтобы уточнить детали и согласовать стоимость. Пожалуйста, дождитесь звонка.\n\nПосле согласования стоимости вы сможете оплатить услугу в личном кабинете — во вкладке «Мои путешествия» → «Бронирования».'**
  String get transfer_checkout_payment_manual_hint;

  /// No description provided for @transfer_auth_invalid_code_error.
  ///
  /// In ru, this message translates to:
  /// **'Неверный код'**
  String get transfer_auth_invalid_code_error;

  /// No description provided for @payment_success_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Оплата прошла успешно'**
  String get payment_success_dialog_title;

  /// No description provided for @payment_success_dialog_message.
  ///
  /// In ru, this message translates to:
  /// **'Не забудьте сохранить идентификатор бронирования'**
  String get payment_success_dialog_message;

  /// No description provided for @payment_success_dialog_button.
  ///
  /// In ru, this message translates to:
  /// **'Окей'**
  String get payment_success_dialog_button;

  /// No description provided for @transfer_checkout_success_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Заявка принята'**
  String get transfer_checkout_success_dialog_title;

  /// No description provided for @transfer_checkout_success_dialog_message.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо! Мы получили ваш запрос на трансфер. В ближайшее время менеджер свяжется с вами, чтобы уточнить детали и подтвердить поездку.'**
  String get transfer_checkout_success_dialog_message;

  /// No description provided for @transfer_checkout_success_dialog_button.
  ///
  /// In ru, this message translates to:
  /// **'Окей'**
  String get transfer_checkout_success_dialog_button;

  /// No description provided for @support_help_screen.
  ///
  /// In ru, this message translates to:
  /// **'Помощь'**
  String get support_help_screen;

  /// No description provided for @support_chat.
  ///
  /// In ru, this message translates to:
  /// **'Чат поддержки'**
  String get support_chat;

  /// No description provided for @support_assistent.
  ///
  /// In ru, this message translates to:
  /// **'Ассистент'**
  String get support_assistent;

  /// No description provided for @support_faq.
  ///
  /// In ru, this message translates to:
  /// **'FAQ'**
  String get support_faq;

  /// No description provided for @support_tickets.
  ///
  /// In ru, this message translates to:
  /// **'Обращения'**
  String get support_tickets;

  /// No description provided for @support_new_ticket.
  ///
  /// In ru, this message translates to:
  /// **'Новое обращение'**
  String get support_new_ticket;

  /// No description provided for @support_cancel_booking.
  ///
  /// In ru, this message translates to:
  /// **'Отменить бронирование'**
  String get support_cancel_booking;

  /// No description provided for @support_booking_number.
  ///
  /// In ru, this message translates to:
  /// **'Номер бронирования'**
  String get support_booking_number;

  /// No description provided for @support_not_booking_number.
  ///
  /// In ru, this message translates to:
  /// **'Нет номера бронирования'**
  String get support_not_booking_number;

  /// No description provided for @support_suggestions_question_label.
  ///
  /// In ru, this message translates to:
  /// **'О чем хотите спросить?'**
  String get support_suggestions_question_label;

  /// No description provided for @support_input_hint.
  ///
  /// In ru, this message translates to:
  /// **'Введите текст...'**
  String get support_input_hint;

  /// No description provided for @support_bot_request_ref_number.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, укажите номер бронирования'**
  String get support_bot_request_ref_number;

  /// No description provided for @support_bot_ticket_created.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо за обращение! Наш специалист уже рассматривает ваш запрос.'**
  String get support_bot_ticket_created;

  /// No description provided for @support_bot_chat_end.
  ///
  /// In ru, this message translates to:
  /// **'Чат завершён, если проблема не решена, пожалуйста, откройте новое обращение'**
  String get support_bot_chat_end;

  /// No description provided for @support_bot_no_ref_fallback.
  ///
  /// In ru, this message translates to:
  /// **'Напишите, что произошло. Мы подключаем специалиста и скоро ответим вам!'**
  String get support_bot_no_ref_fallback;

  /// No description provided for @support_category_fast_track.
  ///
  /// In ru, this message translates to:
  /// **'Fast Track'**
  String get support_category_fast_track;

  /// No description provided for @support_category_vip_lounge.
  ///
  /// In ru, this message translates to:
  /// **'VIP-зал'**
  String get support_category_vip_lounge;

  /// No description provided for @support_category_transfer.
  ///
  /// In ru, this message translates to:
  /// **'Transfer'**
  String get support_category_transfer;

  /// No description provided for @support_category_meet_assist.
  ///
  /// In ru, this message translates to:
  /// **'Meet & Assist'**
  String get support_category_meet_assist;

  /// No description provided for @support_category_other.
  ///
  /// In ru, this message translates to:
  /// **'Другое'**
  String get support_category_other;

  /// No description provided for @transactions_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Транзакции'**
  String get transactions_screen_title;

  /// No description provided for @transactions_tab_all.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get transactions_tab_all;

  /// No description provided for @transactions_tab_payments.
  ///
  /// In ru, this message translates to:
  /// **'Платежи'**
  String get transactions_tab_payments;

  /// No description provided for @transactions_tab_refunds.
  ///
  /// In ru, this message translates to:
  /// **'Возвраты'**
  String get transactions_tab_refunds;

  /// No description provided for @transactions_tab_bonuses.
  ///
  /// In ru, this message translates to:
  /// **'Бонусы'**
  String get transactions_tab_bonuses;

  /// No description provided for @transactions_all_empty_state.
  ///
  /// In ru, this message translates to:
  /// **'История пока пуста.\nЗдесь будут отображаться ваши оплаты, возвраты и начисления бонусных баллов после первой транзакции.'**
  String get transactions_all_empty_state;

  /// No description provided for @transactions_payments_empty_state.
  ///
  /// In ru, this message translates to:
  /// **'История пока пуста.\nЗдесь будут отображаться ваши оплаты после первой транзакции.'**
  String get transactions_payments_empty_state;

  /// No description provided for @transactions_refunds_empty_state.
  ///
  /// In ru, this message translates to:
  /// **'История пока пуста.\nЗдесь будут отображаться ваши возвраты.'**
  String get transactions_refunds_empty_state;

  /// No description provided for @transactions_bonuses_empty_state.
  ///
  /// In ru, this message translates to:
  /// **'История пока пуста.\nЗдесь будут отображаться начисления бонусных баллов.'**
  String get transactions_bonuses_empty_state;

  /// No description provided for @transaction_card_details_button.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get transaction_card_details_button;

  /// No description provided for @transaction_card_parameter_accrued_bonuses.
  ///
  /// In ru, this message translates to:
  /// **'Начислено бонусов'**
  String get transaction_card_parameter_accrued_bonuses;

  /// No description provided for @transaction_card_parameter_order.
  ///
  /// In ru, this message translates to:
  /// **'Заказ:'**
  String get transaction_card_parameter_order;

  /// No description provided for @transaction_card_parameter_date.
  ///
  /// In ru, this message translates to:
  /// **'Дата:'**
  String get transaction_card_parameter_date;

  /// No description provided for @transaction_card_parameter_amount.
  ///
  /// In ru, this message translates to:
  /// **'Сумма:'**
  String get transaction_card_parameter_amount;

  /// No description provided for @transaction_status_success.
  ///
  /// In ru, this message translates to:
  /// **'Успешно'**
  String get transaction_status_success;

  /// No description provided for @transaction_status_refunded.
  ///
  /// In ru, this message translates to:
  /// **'Возвращено'**
  String get transaction_status_refunded;

  /// No description provided for @transaction_status_accrued.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get transaction_status_accrued;

  /// No description provided for @transaction_status_pending.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get transaction_status_pending;

  /// No description provided for @transaction_status_failed.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get transaction_status_failed;

  /// No description provided for @transaction_status_unknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get transaction_status_unknown;

  /// No description provided for @receipt_title.
  ///
  /// In ru, this message translates to:
  /// **'Квитанция об операции'**
  String get receipt_title;

  /// No description provided for @receipt_transaction_id.
  ///
  /// In ru, this message translates to:
  /// **'ID транзакции'**
  String get receipt_transaction_id;

  /// No description provided for @receipt_date.
  ///
  /// In ru, this message translates to:
  /// **'Дата и время'**
  String get receipt_date;

  /// No description provided for @receipt_amount.
  ///
  /// In ru, this message translates to:
  /// **'Сумма'**
  String get receipt_amount;

  /// No description provided for @receipt_status.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get receipt_status;

  /// No description provided for @receipt_payment_method.
  ///
  /// In ru, this message translates to:
  /// **'Способ оплаты'**
  String get receipt_payment_method;

  /// No description provided for @receipt_payer.
  ///
  /// In ru, this message translates to:
  /// **'Плательщик'**
  String get receipt_payer;

  /// No description provided for @receipt_merchant.
  ///
  /// In ru, this message translates to:
  /// **'Мерчант'**
  String get receipt_merchant;

  /// No description provided for @receipt_merchant_name.
  ///
  /// In ru, this message translates to:
  /// **'Example App'**
  String get receipt_merchant_name;

  /// No description provided for @receipt_merchant_address.
  ///
  /// In ru, this message translates to:
  /// **'г. Москва, ул. Арбат, д. 1'**
  String get receipt_merchant_address;

  /// No description provided for @receipt_transaction_type.
  ///
  /// In ru, this message translates to:
  /// **'Тип транзакции'**
  String get receipt_transaction_type;

  /// No description provided for @receipt_transaction_type_deposit.
  ///
  /// In ru, this message translates to:
  /// **'Пополнение'**
  String get receipt_transaction_type_deposit;

  /// No description provided for @receipt_transaction_type_adjustment.
  ///
  /// In ru, this message translates to:
  /// **'Корректировка'**
  String get receipt_transaction_type_adjustment;

  /// No description provided for @receipt_payment_method_manual.
  ///
  /// In ru, this message translates to:
  /// **'Вручную'**
  String get receipt_payment_method_manual;

  /// No description provided for @receipt_external_id.
  ///
  /// In ru, this message translates to:
  /// **'Внешний ID'**
  String get receipt_external_id;

  /// No description provided for @receipt_order_number.
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа'**
  String get receipt_order_number;

  /// No description provided for @receipt_description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get receipt_description;

  /// No description provided for @receipt_loading_title.
  ///
  /// In ru, this message translates to:
  /// **'Формирование квитанции'**
  String get receipt_loading_title;

  /// No description provided for @receipt_loading_comment.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, подождите, мы готовим документ...'**
  String get receipt_loading_comment;

  /// No description provided for @receipt_footer_text.
  ///
  /// In ru, this message translates to:
  /// **'Квитанция сформирована автоматически в приложении Example App.\nЭто официальный документ, подтверждающий совершение транзакции.'**
  String get receipt_footer_text;

  /// No description provided for @privacy_update_date.
  ///
  /// In ru, this message translates to:
  /// **'Обновлено: {date} года'**
  String privacy_update_date(String date);

  /// No description provided for @loyalty_title.
  ///
  /// In ru, this message translates to:
  /// **'Программа лояльности'**
  String get loyalty_title;

  /// No description provided for @loyalty_bonus_badge.
  ///
  /// In ru, this message translates to:
  /// **'{points, plural, =0{Ваши бонусы: 0 баллов} one{Ваши бонусы: {points} балл} few{Ваши бонусы: {points} балла} many{Ваши бонусы: {points} баллов} other{Ваши бонусы: {points} балла}}'**
  String loyalty_bonus_badge(int points);

  /// No description provided for @loyalty_bonus_description.
  ///
  /// In ru, this message translates to:
  /// **'Каждая оплаченная услуга приближает вас к следующему уровню программы. Чем выше статус, тем больше баллов возвращается на ваш счёт.'**
  String get loyalty_bonus_description;

  /// No description provided for @loyalty_bonus_details_link.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее о бонусных баллах'**
  String get loyalty_bonus_details_link;

  /// No description provided for @loyalty_current_level_title.
  ///
  /// In ru, this message translates to:
  /// **'Вы на базовом уровне'**
  String get loyalty_current_level_title;

  /// No description provided for @loyalty_current_level_cashback.
  ///
  /// In ru, this message translates to:
  /// **'{percents}% баллами с каждой покупки'**
  String loyalty_current_level_cashback(String percents);

  /// No description provided for @loyalty_points_to_next_level.
  ///
  /// In ru, this message translates to:
  /// **'До следующего уровня вам не хватает {points} баллов'**
  String loyalty_points_to_next_level(int points);

  /// No description provided for @loyalty_about_levels_title.
  ///
  /// In ru, this message translates to:
  /// **'Экономьте на будущих поездках'**
  String get loyalty_about_levels_title;

  /// No description provided for @loyalty_about_levels_card_1_title.
  ///
  /// In ru, this message translates to:
  /// **'Переходите на новый уровень быстрее'**
  String get loyalty_about_levels_card_1_title;

  /// No description provided for @loyalty_about_levels_card_1_description.
  ///
  /// In ru, this message translates to:
  /// **'Мы учитываем каждое ваше бронирование — и повышать статус становится легко'**
  String get loyalty_about_levels_card_1_description;

  /// No description provided for @loyalty_about_levels_card_2_title.
  ///
  /// In ru, this message translates to:
  /// **'Всегда получаете больше'**
  String get loyalty_about_levels_card_2_title;

  /// No description provided for @loyalty_about_levels_card_2_description.
  ///
  /// In ru, this message translates to:
  /// **'Чем выше ваш уровень, тем больше баллов возвращается на счёт при каждой поездке'**
  String get loyalty_about_levels_card_2_description;

  /// No description provided for @loyalty_about_levels_card_3_title.
  ///
  /// In ru, this message translates to:
  /// **'Оплачивайте поездки выгоднее'**
  String get loyalty_about_levels_card_3_title;

  /// No description provided for @loyalty_about_levels_card_3_description.
  ///
  /// In ru, this message translates to:
  /// **'Используйте накопленные баллы, чтобы платить меньше уже в следующем аэропорту'**
  String get loyalty_about_levels_card_3_description;

  /// No description provided for @loyalty_bonus_description_new.
  ///
  /// In ru, this message translates to:
  /// **'При каждой оплате услуг вы получаете бонусные баллы. Их количество зависит от вашего статуса.\nСтатус определяется суммарной стоимостью оплаченных услуг и закрепляется навсегда.'**
  String get loyalty_bonus_description_new;

  /// No description provided for @loyalty_current_level_description.
  ///
  /// In ru, this message translates to:
  /// **'До следующего уровня вам не хватает {points} баллов, и тогда скидки и вознаграждения уровня {nextLevel} станут вашими.\nУчитываются все бронирования!'**
  String loyalty_current_level_description(Object nextLevel, Object points);

  /// No description provided for @loyalty_progress_caption.
  ///
  /// In ru, this message translates to:
  /// **'{percent}% до следующего уровня. Прогресс считается автоматически по вашим бронированиям'**
  String loyalty_progress_caption(Object percent);

  /// No description provided for @loyalty_level_at_registration.
  ///
  /// In ru, this message translates to:
  /// **'Начисляется при регистрации в сервисе'**
  String get loyalty_level_at_registration;

  /// No description provided for @loyalty_level_accrued_from.
  ///
  /// In ru, this message translates to:
  /// **'Начисляется при заказе от {amount}'**
  String loyalty_level_accrued_from(String amount);

  /// No description provided for @loyalty_conditions_link.
  ///
  /// In ru, this message translates to:
  /// **'Условия программы'**
  String get loyalty_conditions_link;

  /// No description provided for @loyalty_not_auth_message.
  ///
  /// In ru, this message translates to:
  /// **'Войдите в аккаунт, чтобы накапливать баллы и участвовать в программе лояльности'**
  String get loyalty_not_auth_message;

  /// No description provided for @loyalty_login_button.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get loyalty_login_button;

  /// No description provided for @loyalty_rules_title.
  ///
  /// In ru, this message translates to:
  /// **'Использование баллов'**
  String get loyalty_rules_title;

  /// No description provided for @loyalty_rules_main_text.
  ///
  /// In ru, this message translates to:
  /// **'Бонусными баллами можно оплатить любую часть стоимости услуг — полностью или частично. Если баллов недостаточно, оставшаяся сумма оплачивается деньгами.'**
  String get loyalty_rules_main_text;

  /// No description provided for @loyalty_rules_rate_text.
  ///
  /// In ru, this message translates to:
  /// **'1 балл = 0,1 \$'**
  String get loyalty_rules_rate_text;

  /// No description provided for @loyalty_rules_additional_conditions_title.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные условия'**
  String get loyalty_rules_additional_conditions_title;

  /// No description provided for @loyalty_rules_condition_1.
  ///
  /// In ru, this message translates to:
  /// **'Баллы нельзя обменять на наличные средства'**
  String get loyalty_rules_condition_1;

  /// No description provided for @loyalty_rules_condition_2.
  ///
  /// In ru, this message translates to:
  /// **'Баллы не начисляются за оплату баллами'**
  String get loyalty_rules_condition_2;

  /// No description provided for @loyalty_rules_condition_3.
  ///
  /// In ru, this message translates to:
  /// **'При возврате услуги баллы, начисленные за неё, списываются'**
  String get loyalty_rules_condition_3;

  /// No description provided for @loyalty_rules_important_title.
  ///
  /// In ru, this message translates to:
  /// **'Важно'**
  String get loyalty_rules_important_title;

  /// No description provided for @loyalty_rules_important_text.
  ///
  /// In ru, this message translates to:
  /// **'Если оплата производится в другой валюте, расчёт баллов осуществляется с пересчётом в USD по актуальному курсу.'**
  String get loyalty_rules_important_text;

  /// No description provided for @loyalty_current_level_user.
  ///
  /// In ru, this message translates to:
  /// **'Вы на уровне {levelName}!'**
  String loyalty_current_level_user(String levelName);

  /// No description provided for @loyalty_level_status_1.
  ///
  /// In ru, this message translates to:
  /// **'это базовый уровень'**
  String get loyalty_level_status_1;

  /// No description provided for @loyalty_level_status_2.
  ///
  /// In ru, this message translates to:
  /// **'второй уровень'**
  String get loyalty_level_status_2;

  /// No description provided for @loyalty_level_status_3.
  ///
  /// In ru, this message translates to:
  /// **'третий уровень'**
  String get loyalty_level_status_3;

  /// No description provided for @loyalty_level_status_4.
  ///
  /// In ru, this message translates to:
  /// **'четвертый уровень'**
  String get loyalty_level_status_4;

  /// No description provided for @loyalty_level_status_5.
  ///
  /// In ru, this message translates to:
  /// **'пятый уровень'**
  String get loyalty_level_status_5;

  /// No description provided for @loyalty_level_status_6.
  ///
  /// In ru, this message translates to:
  /// **'шестой уровень'**
  String get loyalty_level_status_6;

  /// No description provided for @loyalty_level_status_other.
  ///
  /// In ru, this message translates to:
  /// **'{rank}-й уровень'**
  String loyalty_level_status_other(int rank);

  /// No description provided for @loyalty_level_cashback_percent.
  ///
  /// In ru, this message translates to:
  /// **'{percents}%'**
  String loyalty_level_cashback_percent(String percents);

  /// No description provided for @loyalty_level_cashback_suffix.
  ///
  /// In ru, this message translates to:
  /// **' баллами с каждой покупки'**
  String get loyalty_level_cashback_suffix;

  /// No description provided for @loyalty_level_threshold_base.
  ///
  /// In ru, this message translates to:
  /// **'Базовый уровень'**
  String get loyalty_level_threshold_base;

  /// No description provided for @loyalty_level_threshold_from_amount.
  ///
  /// In ru, this message translates to:
  /// **'При сумме от {amount}'**
  String loyalty_level_threshold_from_amount(String amount);

  /// No description provided for @loyalty_level_privilege_1_1.
  ///
  /// In ru, this message translates to:
  /// **'Накопление баллов'**
  String get loyalty_level_privilege_1_1;

  /// No description provided for @loyalty_level_privilege_1_2.
  ///
  /// In ru, this message translates to:
  /// **'Базовая поддержка'**
  String get loyalty_level_privilege_1_2;

  /// No description provided for @loyalty_level_privilege_1_3.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к акциям'**
  String get loyalty_level_privilege_1_3;

  /// No description provided for @loyalty_level_privilege_2_1.
  ///
  /// In ru, this message translates to:
  /// **'Приоритетная поддержка'**
  String get loyalty_level_privilege_2_1;

  /// No description provided for @loyalty_level_privilege_2_2.
  ///
  /// In ru, this message translates to:
  /// **'Ранний доступ к скидкам'**
  String get loyalty_level_privilege_2_2;

  /// No description provided for @loyalty_level_privilege_2_3.
  ///
  /// In ru, this message translates to:
  /// **'Бонус на день рождения'**
  String get loyalty_level_privilege_2_3;

  /// No description provided for @loyalty_level_privilege_3_1.
  ///
  /// In ru, this message translates to:
  /// **'Персональный менеджер'**
  String get loyalty_level_privilege_3_1;

  /// No description provided for @loyalty_level_privilege_3_2.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатный апгрейд'**
  String get loyalty_level_privilege_3_2;

  /// No description provided for @loyalty_level_privilege_3_3.
  ///
  /// In ru, this message translates to:
  /// **'Эксклюзивные предложения'**
  String get loyalty_level_privilege_3_3;

  /// No description provided for @loyalty_level_privilege_4_1.
  ///
  /// In ru, this message translates to:
  /// **'Консьерж-сервис 24/7'**
  String get loyalty_level_privilege_4_1;

  /// No description provided for @loyalty_level_privilege_4_2.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатные услуги'**
  String get loyalty_level_privilege_4_2;

  /// No description provided for @loyalty_level_privilege_4_3.
  ///
  /// In ru, this message translates to:
  /// **'VIP-события'**
  String get loyalty_level_privilege_4_3;

  /// No description provided for @loyalty_status_metric_current_level.
  ///
  /// In ru, this message translates to:
  /// **'Текущий уровень'**
  String get loyalty_status_metric_current_level;

  /// No description provided for @loyalty_status_metric_cashback.
  ///
  /// In ru, this message translates to:
  /// **'Возврат с покупок'**
  String get loyalty_status_metric_cashback;

  /// No description provided for @loyalty_bonus_accrual_history.
  ///
  /// In ru, this message translates to:
  /// **'История начислений'**
  String get loyalty_bonus_accrual_history;

  /// No description provided for @loyalty_progress_next_level_points.
  ///
  /// In ru, this message translates to:
  /// **'{nextLevelName} · {pointsText}'**
  String loyalty_progress_next_level_points(String nextLevelName, String pointsText);

  /// No description provided for @loyalty_current_level_user_greeting.
  ///
  /// In ru, this message translates to:
  /// **'{userName}, вы на уровне {levelName}!'**
  String loyalty_current_level_user_greeting(String userName, String levelName);

  /// No description provided for @article_update_date.
  ///
  /// In ru, this message translates to:
  /// **'Обновлено: {date}'**
  String article_update_date(String date);

  /// No description provided for @article_read_full.
  ///
  /// In ru, this message translates to:
  /// **'Читать полностью'**
  String get article_read_full;

  /// No description provided for @article_help_instruction_travelers.
  ///
  /// In ru, this message translates to:
  /// **'Помощь и инструкции для путешественников'**
  String get article_help_instruction_travelers;

  /// No description provided for @article_go_to_service.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к услугам'**
  String get article_go_to_service;

  /// No description provided for @article_select.
  ///
  /// In ru, this message translates to:
  /// **'Выбор статьи'**
  String get article_select;

  /// No description provided for @article_share.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться статьей'**
  String get article_share;

  /// No description provided for @article_book_service.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать услуги'**
  String get article_book_service;

  /// No description provided for @article_search_title.
  ///
  /// In ru, this message translates to:
  /// **'Поиск статьи'**
  String get article_search_title;

  /// No description provided for @notifications_title.
  ///
  /// In ru, this message translates to:
  /// **'Мои уведомления'**
  String get notifications_title;

  /// No description provided for @notifications_text_empty.
  ///
  /// In ru, this message translates to:
  /// **'Уведомлений пока нет. \nЗдесь будут отображаться важные сообщения о ваших бронированиях, оплатах и изменениях услуг. Как только появится активность — мы сразу сообщим.'**
  String get notifications_text_empty;

  /// No description provided for @notifications_toggle_title.
  ///
  /// In ru, this message translates to:
  /// **'Рассылки'**
  String get notifications_toggle_title;

  /// No description provided for @notifications_turn_on.
  ///
  /// In ru, this message translates to:
  /// **'Включить уведомления'**
  String get notifications_turn_on;

  /// No description provided for @notifications_turn_off.
  ///
  /// In ru, this message translates to:
  /// **'Выключить уведомления'**
  String get notifications_turn_off;

  /// No description provided for @notifications_book_service.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать услуги'**
  String get notifications_book_service;

  /// No description provided for @notifications_new.
  ///
  /// In ru, this message translates to:
  /// **'Новые'**
  String get notifications_new;

  /// No description provided for @notifications_no_new.
  ///
  /// In ru, this message translates to:
  /// **'Новых уведомлений нет'**
  String get notifications_no_new;

  /// No description provided for @notifications_read.
  ///
  /// In ru, this message translates to:
  /// **'Прочитанные'**
  String get notifications_read;

  /// No description provided for @notifications_read_all.
  ///
  /// In ru, this message translates to:
  /// **'Прочитать все'**
  String get notifications_read_all;

  /// No description provided for @notifications_detail.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get notifications_detail;

  /// No description provided for @receipt_pdf_transaction_title.
  ///
  /// In ru, this message translates to:
  /// **'Квитанция'**
  String get receipt_pdf_transaction_title;

  /// No description provided for @receipt_pdf_date_external.
  ///
  /// In ru, this message translates to:
  /// **'от {date} года: {externalId}'**
  String receipt_pdf_date_external(String date, String externalId);

  /// No description provided for @receipt_pdf_order_number.
  ///
  /// In ru, this message translates to:
  /// **'Заказ № {orderRef}'**
  String receipt_pdf_order_number(String orderRef);

  /// No description provided for @receipt_transfer_data_title.
  ///
  /// In ru, this message translates to:
  /// **'Данные трансфера'**
  String get receipt_transfer_data_title;

  /// No description provided for @receipt_transfer_stop_point.
  ///
  /// In ru, this message translates to:
  /// **'Точка остановки'**
  String get receipt_transfer_stop_point;

  /// No description provided for @receipt_total_label.
  ///
  /// In ru, this message translates to:
  /// **'ИТОГО: {amount}'**
  String receipt_total_label(String amount);

  /// No description provided for @receipt_flight_entry.
  ///
  /// In ru, this message translates to:
  /// **'{index}. Рейс: {flightNumber}, {dateTime}'**
  String receipt_flight_entry(int index, String flightNumber, String dateTime);

  /// No description provided for @receipt_label_status_colon.
  ///
  /// In ru, this message translates to:
  /// **'Статус:'**
  String get receipt_label_status_colon;

  /// No description provided for @receipt_label_date_colon.
  ///
  /// In ru, this message translates to:
  /// **'Дата:'**
  String get receipt_label_date_colon;

  /// No description provided for @receipt_label_currency_colon.
  ///
  /// In ru, this message translates to:
  /// **'Валюта:'**
  String get receipt_label_currency_colon;

  /// No description provided for @receipt_label_points_colon.
  ///
  /// In ru, this message translates to:
  /// **'Баллы:'**
  String get receipt_label_points_colon;

  /// No description provided for @receipt_points_accrued_line.
  ///
  /// In ru, this message translates to:
  /// **'+{amount} ({accruedLabel})'**
  String receipt_points_accrued_line(String amount, String accruedLabel);

  /// No description provided for @receipt_payment_status_awaiting.
  ///
  /// In ru, this message translates to:
  /// **'Ожидает оплату'**
  String get receipt_payment_status_awaiting;

  /// No description provided for @receipt_payment_status_paid.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено'**
  String get receipt_payment_status_paid;

  /// No description provided for @receipt_payment_status_declined.
  ///
  /// In ru, this message translates to:
  /// **'Платеж не прошел'**
  String get receipt_payment_status_declined;

  /// No description provided for @receipt_payment_status_unknown_long.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестный статус'**
  String get receipt_payment_status_unknown_long;

  /// No description provided for @receipt_pdf_company_footer.
  ///
  /// In ru, this message translates to:
  /// **'ООО «Example App»\nEmail для связи: support@example.com\n\nПодробная информация об условиях предоставления услуг и обработке персональных данных доступна по ссылкам:\nУсловия использования и Политика конфиденциальности'**
  String get receipt_pdf_company_footer;

  /// No description provided for @receipt_pdf_bonus_title.
  ///
  /// In ru, this message translates to:
  /// **'Детали бонусной операции'**
  String get receipt_pdf_bonus_title;

  /// No description provided for @receipt_bonus_breakdown_title.
  ///
  /// In ru, this message translates to:
  /// **'Расчет бонусов'**
  String get receipt_bonus_breakdown_title;

  /// No description provided for @receipt_bonus_paid_service_label.
  ///
  /// In ru, this message translates to:
  /// **'Сумма оплаченной услуги'**
  String get receipt_bonus_paid_service_label;

  /// No description provided for @receipt_bonus_user_level_label.
  ///
  /// In ru, this message translates to:
  /// **'Статус пользователя'**
  String get receipt_bonus_user_level_label;

  /// No description provided for @receipt_bonus_coefficient_label.
  ///
  /// In ru, this message translates to:
  /// **'Бонусный коэффициент'**
  String get receipt_bonus_coefficient_label;

  /// No description provided for @receipt_bonus_percent_of_order.
  ///
  /// In ru, this message translates to:
  /// **'{percent}% от суммы заказа'**
  String receipt_bonus_percent_of_order(String percent);

  /// No description provided for @receipt_bonus_accrued_label.
  ///
  /// In ru, this message translates to:
  /// **'Начислено бонусов'**
  String get receipt_bonus_accrued_label;

  /// No description provided for @receipt_bonus_points_short.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} балл} few{{count} балла} many{{count} баллов} other{{count} балла}}'**
  String receipt_bonus_points_short(int count);

  /// No description provided for @receipt_bonus_section_status.
  ///
  /// In ru, this message translates to:
  /// **'Статус бонусов'**
  String get receipt_bonus_section_status;

  /// No description provided for @receipt_bonus_points_status_label.
  ///
  /// In ru, this message translates to:
  /// **'Статус баллов'**
  String get receipt_bonus_points_status_label;

  /// No description provided for @receipt_bonus_accrual_date_label.
  ///
  /// In ru, this message translates to:
  /// **'Дата начисления'**
  String get receipt_bonus_accrual_date_label;

  /// No description provided for @receipt_bonus_expiry_title.
  ///
  /// In ru, this message translates to:
  /// **'Срок действия'**
  String get receipt_bonus_expiry_title;

  /// No description provided for @receipt_bonus_valid_until.
  ///
  /// In ru, this message translates to:
  /// **'до {date}'**
  String receipt_bonus_valid_until(String date);

  /// No description provided for @receipt_bonus_twelve_months_note.
  ///
  /// In ru, this message translates to:
  /// **'Баллы действуют 12 месяцев с момента начисления'**
  String get receipt_bonus_twelve_months_note;

  /// No description provided for @receipt_bonus_balance_title.
  ///
  /// In ru, this message translates to:
  /// **'Баланс бонусов'**
  String get receipt_bonus_balance_title;

  /// No description provided for @receipt_bonus_balance_current.
  ///
  /// In ru, this message translates to:
  /// **'Текущий'**
  String get receipt_bonus_balance_current;

  /// No description provided for @receipt_bonus_balance_spendable.
  ///
  /// In ru, this message translates to:
  /// **'Доступно для использования'**
  String get receipt_bonus_balance_spendable;

  /// No description provided for @receipt_bonus_program_line_1.
  ///
  /// In ru, this message translates to:
  /// **' • Бонусные баллы начисляются в рамках программы лояльности Example App.'**
  String get receipt_bonus_program_line_1;

  /// No description provided for @receipt_bonus_program_line_2.
  ///
  /// In ru, this message translates to:
  /// **' • Условия начисления, использования и срока действия баллов регулируются правилами программы лояльности.'**
  String get receipt_bonus_program_line_2;

  /// No description provided for @receipt_bonus_rules_body.
  ///
  /// In ru, this message translates to:
  /// **' • Баллы можно использовать для полной или частичной оплаты следующих услуг Example App.\n • Баллы не обмениваются на денежные средства\n • Баллы не начисляются при оплате услуг баллами\n • При возврате услуги начисленные за неё баллы будут списаны'**
  String get receipt_bonus_rules_body;

  /// No description provided for @receipt_header_id.
  ///
  /// In ru, this message translates to:
  /// **'ID: {id}'**
  String receipt_header_id(String id);

  /// No description provided for @my_trips_delete_draft_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Удалить черновик?'**
  String get my_trips_delete_draft_dialog_title;

  /// No description provided for @my_trips_delete_draft_dialog_message.
  ///
  /// In ru, this message translates to:
  /// **'Черновик заказа будет удален безвозвратно.'**
  String get my_trips_delete_draft_dialog_message;

  /// No description provided for @my_trips_draft_continue_ordering.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить оформление'**
  String get my_trips_draft_continue_ordering;

  /// No description provided for @calendar_event_flight_title.
  ///
  /// In ru, this message translates to:
  /// **'Рейс {flightNumber}'**
  String calendar_event_flight_title(String flightNumber);

  /// No description provided for @calendar_event_flight_description.
  ///
  /// In ru, this message translates to:
  /// **'Полет с {airline} ({departure} → {arrival})'**
  String calendar_event_flight_description(String airline, String departure, String arrival);

  /// No description provided for @cancellation_screen_title.
  ///
  /// In ru, this message translates to:
  /// **'Отмена бронирования'**
  String get cancellation_screen_title;

  /// No description provided for @cancellation_search_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите данные бронирования, чтобы проверить возможность отмены'**
  String get cancellation_search_subtitle;

  /// No description provided for @cancellation_email_at_checkout_label.
  ///
  /// In ru, this message translates to:
  /// **'Электронная почта при оформлении'**
  String get cancellation_email_at_checkout_label;

  /// No description provided for @cancellation_email_short_hint.
  ///
  /// In ru, this message translates to:
  /// **'Электронная почта'**
  String get cancellation_email_short_hint;

  /// No description provided for @cancellation_find_booking_button.
  ///
  /// In ru, this message translates to:
  /// **'Найти бронирование'**
  String get cancellation_find_booking_button;

  /// No description provided for @cancellation_field_required_error.
  ///
  /// In ru, this message translates to:
  /// **'Обязательно для ввода'**
  String get cancellation_field_required_error;

  /// No description provided for @cancellation_order_not_found_title.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование не найдено'**
  String get cancellation_order_not_found_title;

  /// No description provided for @cancellation_order_not_found_write_support.
  ///
  /// In ru, this message translates to:
  /// **'Написать в поддержку'**
  String get cancellation_order_not_found_write_support;

  /// No description provided for @cancellation_order_not_found_body.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте номер бронирования и адрес электронной почты. Если проблема сохраняется, свяжитесь со службой поддержки'**
  String get cancellation_order_not_found_body;

  /// No description provided for @cancellation_order_not_found_details.
  ///
  /// In ru, this message translates to:
  /// **'Номер бронирования:\n{orderNumber}\n\nЭлектронная почта:\n{email}'**
  String cancellation_order_not_found_details(String orderNumber, String email);

  /// No description provided for @cancellation_cancelled_title.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование отменено'**
  String get cancellation_cancelled_title;

  /// No description provided for @cancellation_cancelled_message.
  ///
  /// In ru, this message translates to:
  /// **'Информация об отмене и возврате появится в разделе «Мои путешествия».\n\nПодтверждение также отправлено на вашу электронную почту.'**
  String get cancellation_cancelled_message;

  /// No description provided for @cancellation_auth_manage_bookings_title.
  ///
  /// In ru, this message translates to:
  /// **'Хотите управлять бронированиями удобнее?'**
  String get cancellation_auth_manage_bookings_title;

  /// No description provided for @cancellation_auth_skip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get cancellation_auth_skip;

  /// No description provided for @cancellation_auth_invite_body.
  ///
  /// In ru, this message translates to:
  /// **'Создайте или войдите в аккаунт, чтобы видеть все поездки, статусы и уведомления в одном месте'**
  String get cancellation_auth_invite_body;

  /// No description provided for @cancellation_confirm_title.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите отменить бронирование?'**
  String get cancellation_confirm_title;

  /// No description provided for @cancellation_confirm_message.
  ///
  /// In ru, this message translates to:
  /// **'Это действие нельзя будет отменить'**
  String get cancellation_confirm_message;

  /// No description provided for @cancellation_confirm_primary.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждаю'**
  String get cancellation_confirm_primary;

  /// No description provided for @core_order_number_copied_to_clipboard.
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа скопирован в буфер обмена'**
  String get core_order_number_copied_to_clipboard;

  /// No description provided for @cancellation_status_available.
  ///
  /// In ru, this message translates to:
  /// **'Отмена доступна'**
  String get cancellation_status_available;

  /// No description provided for @cancellation_status_unavailable.
  ///
  /// In ru, this message translates to:
  /// **'Отмена недоступна'**
  String get cancellation_status_unavailable;

  /// No description provided for @cancellation_available_hint.
  ///
  /// In ru, this message translates to:
  /// **'Вы можете отменить бронирование и получить возврат средств.'**
  String get cancellation_available_hint;

  /// No description provided for @cancellation_unavailable_hint.
  ///
  /// In ru, this message translates to:
  /// **'Срок бесплатной отмены истёк, поэтому отменить заказ нельзя. Возврат средств не предусмотрен. Подробнее — в правилах ниже.'**
  String get cancellation_unavailable_hint;

  /// No description provided for @cancellation_support_hint.
  ///
  /// In ru, this message translates to:
  /// **'Если вам нужно внести изменения, пожалуйста, обратитесь в поддержку, не отменяйте заказ'**
  String get cancellation_support_hint;

  /// No description provided for @order_status_cancelled.
  ///
  /// In ru, this message translates to:
  /// **'Отменён'**
  String get order_status_cancelled;

  /// No description provided for @order_refund_status_processing.
  ///
  /// In ru, this message translates to:
  /// **'Ожидается возврат средств'**
  String get order_refund_status_processing;

  /// No description provided for @order_refund_status_refunded.
  ///
  /// In ru, this message translates to:
  /// **'Средства возвращены'**
  String get order_refund_status_refunded;

  /// No description provided for @order_refund_status_error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка возврата средств'**
  String get order_refund_status_error;

  /// No description provided for @order_status_payment_error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка оплаты'**
  String get order_status_payment_error;

  /// No description provided for @order_status_cancel_requested.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get order_status_cancel_requested;

  /// No description provided for @order_status_waiting_processing.
  ///
  /// In ru, this message translates to:
  /// **'В очереди'**
  String get order_status_waiting_processing;

  /// No description provided for @order_status_waiting_partner.
  ///
  /// In ru, this message translates to:
  /// **'У партнёра'**
  String get order_status_waiting_partner;

  /// No description provided for @order_status_partner_confirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждён'**
  String get order_status_partner_confirmed;

  /// No description provided for @order_status_in_progress.
  ///
  /// In ru, this message translates to:
  /// **'Выполняется'**
  String get order_status_in_progress;

  /// No description provided for @order_status_pending_pre_flight.
  ///
  /// In ru, this message translates to:
  /// **'До вылета'**
  String get order_status_pending_pre_flight;

  /// No description provided for @order_status_in_flight.
  ///
  /// In ru, this message translates to:
  /// **'В полёте'**
  String get order_status_in_flight;

  /// No description provided for @order_status_pending_post_flight.
  ///
  /// In ru, this message translates to:
  /// **'После'**
  String get order_status_pending_post_flight;

  /// No description provided for @order_status_completed.
  ///
  /// In ru, this message translates to:
  /// **'Завершён'**
  String get order_status_completed;

  /// No description provided for @order_status_partner_rejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get order_status_partner_rejected;

  /// No description provided for @order_status_refund_error.
  ///
  /// In ru, this message translates to:
  /// **'Сбой возврата'**
  String get order_status_refund_error;

  /// No description provided for @order_status_refund_processing.
  ///
  /// In ru, this message translates to:
  /// **'Возврат'**
  String get order_status_refund_processing;

  /// No description provided for @order_status_refunded.
  ///
  /// In ru, this message translates to:
  /// **'Возвращён'**
  String get order_status_refunded;

  /// No description provided for @search_services_initial_title.
  ///
  /// In ru, this message translates to:
  /// **'Начните вводить аэропорт или рейс'**
  String get search_services_initial_title;

  /// No description provided for @search_services_initial_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Найдите аэропорт по названию или городу, либо введите номер рейса для оформления услуг в аэропорту прилета или вылета'**
  String get search_services_initial_subtitle;

  /// No description provided for @rating_badge_terrible.
  ///
  /// In ru, this message translates to:
  /// **'Ужасно'**
  String get rating_badge_terrible;

  /// No description provided for @rating_badge_bad.
  ///
  /// In ru, this message translates to:
  /// **'Плохо'**
  String get rating_badge_bad;

  /// No description provided for @rating_badge_normal.
  ///
  /// In ru, this message translates to:
  /// **'Нормально'**
  String get rating_badge_normal;

  /// No description provided for @rating_badge_good.
  ///
  /// In ru, this message translates to:
  /// **'Хорошо'**
  String get rating_badge_good;

  /// No description provided for @rating_badge_excellent.
  ///
  /// In ru, this message translates to:
  /// **'Превосходно'**
  String get rating_badge_excellent;

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

  /// No description provided for @secret_mode_yes.
  ///
  /// In ru, this message translates to:
  /// **'Yes'**
  String get secret_mode_yes;

  /// No description provided for @secret_mode_no.
  ///
  /// In ru, this message translates to:
  /// **'No'**
  String get secret_mode_no;

  /// No description provided for @secret_mode_wrong_password.
  ///
  /// In ru, this message translates to:
  /// **'Wrong password'**
  String get secret_mode_wrong_password;

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

  /// No description provided for @secret_mode_password_hint.
  ///
  /// In ru, this message translates to:
  /// **'Password'**
  String get secret_mode_password_hint;

  /// No description provided for @secret_mode_ok.
  ///
  /// In ru, this message translates to:
  /// **'OK'**
  String get secret_mode_ok;

  /// No description provided for @private_jet_charter_title.
  ///
  /// In ru, this message translates to:
  /// **'Чартер частного самолёта'**
  String get private_jet_charter_title;

  /// No description provided for @private_jet_charter_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Летайте по своему расписанию. Без очередей, задержек и компромиссов. Доступ к 5000+ бортам по всему миру.'**
  String get private_jet_charter_subtitle;

  /// No description provided for @main_search_private_jet_departure_title.
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get main_search_private_jet_departure_title;

  /// No description provided for @main_search_private_jet_departure_hint.
  ///
  /// In ru, this message translates to:
  /// **'Откуда (город или аэропорт)'**
  String get main_search_private_jet_departure_hint;

  /// No description provided for @main_search_private_jet_arrival_title.
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get main_search_private_jet_arrival_title;

  /// No description provided for @main_search_private_jet_arrival_hint.
  ///
  /// In ru, this message translates to:
  /// **'Куда (город или аэропорт)'**
  String get main_search_private_jet_arrival_hint;

  /// No description provided for @main_search_private_jet_date_title.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get main_search_private_jet_date_title;

  /// No description provided for @main_search_private_jet_date_hint.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get main_search_private_jet_date_hint;

  /// No description provided for @main_search_private_jet_date_picker_title.
  ///
  /// In ru, this message translates to:
  /// **'Выбор даты'**
  String get main_search_private_jet_date_picker_title;

  /// No description provided for @main_search_private_jet_passengers_title.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиры'**
  String get main_search_private_jet_passengers_title;

  /// No description provided for @main_search_private_jet_passengers_hint.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиры'**
  String get main_search_private_jet_passengers_hint;

  /// No description provided for @main_search_private_jet_passengers_more_than_20.
  ///
  /// In ru, this message translates to:
  /// **'> 20 пассажиров'**
  String get main_search_private_jet_passengers_more_than_20;

  /// No description provided for @private_jet_benefit_fleet_title.
  ///
  /// In ru, this message translates to:
  /// **'5000+ бортов'**
  String get private_jet_benefit_fleet_title;

  /// No description provided for @private_jet_benefit_fleet_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к крупнейшему в мире парку частных самолётов'**
  String get private_jet_benefit_fleet_subtitle;

  /// No description provided for @private_jet_benefit_booking_title.
  ///
  /// In ru, this message translates to:
  /// **'За 2 часа'**
  String get private_jet_benefit_booking_title;

  /// No description provided for @private_jet_benefit_booking_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование с уведомлением всего за 2 часа'**
  String get private_jet_benefit_booking_subtitle;

  /// No description provided for @private_jet_benefit_safety_title.
  ///
  /// In ru, this message translates to:
  /// **'Сертификация безопасности'**
  String get private_jet_benefit_safety_title;

  /// No description provided for @private_jet_benefit_safety_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Все борта соответствуют стандартам ARGUS/Wyvern'**
  String get private_jet_benefit_safety_subtitle;

  /// No description provided for @private_jet_benefit_destinations_title.
  ///
  /// In ru, this message translates to:
  /// **'Летайте куда угодно'**
  String get private_jet_benefit_destinations_title;

  /// No description provided for @private_jet_benefit_destinations_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к 40 000+ аэропортов по всему миру — даже к удалённым полосам'**
  String get private_jet_benefit_destinations_subtitle;

  /// No description provided for @private_jet_popular_types_title.
  ///
  /// In ru, this message translates to:
  /// **'Популярные типы самолётов'**
  String get private_jet_popular_types_title;

  /// No description provided for @private_jet_passengers_up_to.
  ///
  /// In ru, this message translates to:
  /// **'до {count} чел.'**
  String private_jet_passengers_up_to(int count);

  /// No description provided for @private_jet_price_from.
  ///
  /// In ru, this message translates to:
  /// **'От'**
  String get private_jet_price_from;

  /// No description provided for @private_jet_per_hour.
  ///
  /// In ru, this message translates to:
  /// **'/ час'**
  String get private_jet_per_hour;

  /// No description provided for @private_jet_concierge_title.
  ///
  /// In ru, this message translates to:
  /// **'Персональный консьерж 24/7'**
  String get private_jet_concierge_title;

  /// No description provided for @private_jet_concierge_description.
  ///
  /// In ru, this message translates to:
  /// **'Не хотите заполнять формы? Мы всё понимаем. Наша команда консьержей доступна круглосуточно: подберём борт, организуем трансфер, кейтеринг и изменения в последний момент.'**
  String get private_jet_concierge_description;

  /// No description provided for @private_jet_concierge_feature_fast_reply.
  ///
  /// In ru, this message translates to:
  /// **'Быстрый ответ — в среднем менее 2 минут'**
  String get private_jet_concierge_feature_fast_reply;

  /// No description provided for @private_jet_concierge_feature_multilingual.
  ///
  /// In ru, this message translates to:
  /// **'Мультиязычная команда — английский, арабский, русский, французский'**
  String get private_jet_concierge_feature_multilingual;

  /// No description provided for @private_jet_concierge_feature_full_service.
  ///
  /// In ru, this message translates to:
  /// **'Полный сервис — перелёты, отели, трансферы, мероприятия'**
  String get private_jet_concierge_feature_full_service;

  /// No description provided for @private_jet_concierge_feature_personal_manager.
  ///
  /// In ru, this message translates to:
  /// **'Персональный менеджер на весь трип'**
  String get private_jet_concierge_feature_personal_manager;

  /// No description provided for @private_jet_concierge_whatsapp_button.
  ///
  /// In ru, this message translates to:
  /// **'Написать в WhatsApp'**
  String get private_jet_concierge_whatsapp_button;

  /// No description provided for @private_jet_concierge_online_status.
  ///
  /// In ru, this message translates to:
  /// **'НА СВЯЗИ СЕЙЧАС'**
  String get private_jet_concierge_online_status;

  /// No description provided for @private_jet_details_range_label.
  ///
  /// In ru, this message translates to:
  /// **'Дальность'**
  String get private_jet_details_range_label;

  /// No description provided for @private_jet_details_speed_label.
  ///
  /// In ru, this message translates to:
  /// **'Скорость'**
  String get private_jet_details_speed_label;

  /// No description provided for @private_jet_details_baggage_label.
  ///
  /// In ru, this message translates to:
  /// **'Багаж'**
  String get private_jet_details_baggage_label;

  /// No description provided for @private_jet_details_cabin_dimensions_title.
  ///
  /// In ru, this message translates to:
  /// **'Размеры салона'**
  String get private_jet_details_cabin_dimensions_title;

  /// No description provided for @private_jet_details_cabin_height_label.
  ///
  /// In ru, this message translates to:
  /// **'Высота'**
  String get private_jet_details_cabin_height_label;

  /// No description provided for @private_jet_details_cabin_width_label.
  ///
  /// In ru, this message translates to:
  /// **'Ширина'**
  String get private_jet_details_cabin_width_label;

  /// No description provided for @private_jet_details_cabin_length_label.
  ///
  /// In ru, this message translates to:
  /// **'Длина'**
  String get private_jet_details_cabin_length_label;

  /// No description provided for @private_jet_details_send_request_button.
  ///
  /// In ru, this message translates to:
  /// **'Отправить заявку'**
  String get private_jet_details_send_request_button;

  /// No description provided for @private_jet_details_call_button.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get private_jet_details_call_button;

  /// No description provided for @private_jet_ordering_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Оформление заявки на частный джет — в разработке'**
  String get private_jet_ordering_placeholder;

  /// No description provided for @units_km.
  ///
  /// In ru, this message translates to:
  /// **'{value} км'**
  String units_km(int value);

  /// No description provided for @units_kmh.
  ///
  /// In ru, this message translates to:
  /// **'{value} км/ч'**
  String units_kmh(int value);

  /// No description provided for @units_kg.
  ///
  /// In ru, this message translates to:
  /// **'{value} кг'**
  String units_kg(int value);
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

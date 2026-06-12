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

  /// No description provided for @main_search_button.
  ///
  /// In ru, this message translates to:
  /// **'Найти'**
  String get main_search_button;

  /// No description provided for @citizenship_search_placeholder.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию страны'**
  String get citizenship_search_placeholder;

  /// No description provided for @stepped_header_step_label.
  ///
  /// In ru, this message translates to:
  /// **'Шаг {current}/{total}'**
  String stepped_header_step_label(int current, int total);

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

  /// No description provided for @core_back_button.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get core_back_button;

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

  /// No description provided for @summary_flight_info_title.
  ///
  /// In ru, this message translates to:
  /// **'Информация о рейсе'**
  String get summary_flight_info_title;

  /// No description provided for @summary_companions_title.
  ///
  /// In ru, this message translates to:
  /// **'Сопровождающие'**
  String get summary_companions_title;

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

  /// No description provided for @order_details_flight_info.
  ///
  /// In ru, this message translates to:
  /// **'Информация о рейсе'**
  String get order_details_flight_info;

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

  /// No description provided for @transfer_car_category_label.
  ///
  /// In ru, this message translates to:
  /// **'Категория автомобиля'**
  String get transfer_car_category_label;

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

  /// No description provided for @transaction_card_parameter_accrued_bonuses.
  ///
  /// In ru, this message translates to:
  /// **'Начислено бонусов'**
  String get transaction_card_parameter_accrued_bonuses;

  /// No description provided for @receipt_payment_method.
  ///
  /// In ru, this message translates to:
  /// **'Способ оплаты'**
  String get receipt_payment_method;

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

  /// No description provided for @peer_home_title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в tete games'**
  String get peer_home_title;

  /// No description provided for @peer_home_mode_prompt.
  ///
  /// In ru, this message translates to:
  /// **'Выберите режим подключения'**
  String get peer_home_mode_prompt;

  /// No description provided for @peer_home_start_server_button.
  ///
  /// In ru, this message translates to:
  /// **'Ожидать присоединения'**
  String get peer_home_start_server_button;

  /// No description provided for @peer_home_start_client_button.
  ///
  /// In ru, this message translates to:
  /// **'Найти и подключиться'**
  String get peer_home_start_client_button;

  /// No description provided for @peer_home_retry_button.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get peer_home_retry_button;

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

  /// No description provided for @peer_nickname_dialog_title.
  ///
  /// In ru, this message translates to:
  /// **'Придумайте себе псевдоним'**
  String get peer_nickname_dialog_title;

  /// No description provided for @peer_nickname_field_label.
  ///
  /// In ru, this message translates to:
  /// **'Псевдоним'**
  String get peer_nickname_field_label;

  /// No description provided for @peer_nickname_field_hint.
  ///
  /// In ru, this message translates to:
  /// **'Введите псевдоним'**
  String get peer_nickname_field_hint;

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

  /// No description provided for @peer_server_waiting_title.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание подключения...'**
  String get peer_server_waiting_title;

  /// No description provided for @peer_server_waiting_body.
  ///
  /// In ru, this message translates to:
  /// **'Ваше устройство видимо для других устройств'**
  String get peer_server_waiting_body;

  /// No description provided for @peer_server_invitation_title.
  ///
  /// In ru, this message translates to:
  /// **'Получено приглашение'**
  String get peer_server_invitation_title;

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

  /// No description provided for @peer_server_accept_button.
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get peer_server_accept_button;

  /// No description provided for @peer_server_reject_button.
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get peer_server_reject_button;

  /// No description provided for @peer_client_devices_title.
  ///
  /// In ru, this message translates to:
  /// **'Найденные устройства'**
  String get peer_client_devices_title;

  /// No description provided for @peer_client_loading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка...'**
  String get peer_client_loading;

  /// No description provided for @peer_client_waiting_hosts_title.
  ///
  /// In ru, this message translates to:
  /// **'Ждут приглашения:'**
  String get peer_client_waiting_hosts_title;

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

  /// No description provided for @peer_client_our_app_badge.
  ///
  /// In ru, this message translates to:
  /// **'Приложение tete games'**
  String get peer_client_our_app_badge;

  /// No description provided for @peer_client_invite_button.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить'**
  String get peer_client_invite_button;

  /// No description provided for @peer_client_invitation_sent_title.
  ///
  /// In ru, this message translates to:
  /// **'Приглашение отправлено'**
  String get peer_client_invitation_sent_title;

  /// No description provided for @peer_client_wait_confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Ждите подтверждения'**
  String get peer_client_wait_confirmation;

  /// No description provided for @peer_client_invitation_rejected_title.
  ///
  /// In ru, this message translates to:
  /// **'Приглашение отклонено'**
  String get peer_client_invitation_rejected_title;

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

  /// No description provided for @peer_client_error_discovery.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка запуска поиска'**
  String get peer_client_error_discovery;

  /// No description provided for @peer_client_error_connection.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка подключения'**
  String get peer_client_error_connection;

  /// No description provided for @peer_games_list_title.
  ///
  /// In ru, this message translates to:
  /// **'Игры'**
  String get peer_games_list_title;

  /// No description provided for @peer_games_list_stub.
  ///
  /// In ru, this message translates to:
  /// **'Список игр скоро появится'**
  String get peer_games_list_stub;
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

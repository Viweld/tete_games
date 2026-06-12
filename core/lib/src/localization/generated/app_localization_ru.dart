// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationRu extends AppLocalization {
  AppLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get something_went_wrong => 'Что-то пошло не так';

  @override
  String get name_validator_empty_message => 'Не может быть пустым';

  @override
  String get name_validator_invalid_message => 'Некорректный формат имени';

  @override
  String get name_validator_overflow_message => 'Имя не должно превышать 30 символов';

  @override
  String get email_validator_invalid_message => 'Некорректный формат email';

  @override
  String get email_validator_overflow_message => 'Email не должен превышать 50 символов';

  @override
  String get description_validator_overflow_message =>
      'Длина описания не должна превышать 300 символов';

  @override
  String get expandable_text_fold_label => 'свернуть';

  @override
  String get expandable_text_expand_label => 'больше';

  @override
  String get service_category_airport_title => 'Сервисы аэропорта';

  @override
  String get service_category_transfer_title => 'Трансфер';

  @override
  String get service_category_private_jet_title => 'Частный джет';

  @override
  String get main_search_button => 'Найти';

  @override
  String get citizenship_search_placeholder => 'Поиск по названию страны';

  @override
  String stepped_header_step_label(int current, int total) {
    return 'Шаг $current/$total';
  }

  @override
  String get airport_detail_tariff_adults => 'Взрослые';

  @override
  String get airport_detail_tariff_per_person => ' за пассажира';

  @override
  String get airport_detail_tariff_children => 'Дети';

  @override
  String get airport_detail_tariff_per_child => ' за ребёнка';

  @override
  String get airport_detail_tariff_infants => 'Дети до 2х лет';

  @override
  String get airport_detail_free => 'Бесплатно';

  @override
  String get airport_detail_price_from => 'Цена от';

  @override
  String get airport_detail_price_transfer_from => 'Стоимость зависит от маршрута';

  @override
  String get airport_detail_from => 'от ';

  @override
  String get core_back_button => 'Назад';

  @override
  String get vip_lounge_card_price_label => 'Стоимость';

  @override
  String get vip_lounge_card_price_prefix => 'от';

  @override
  String get vip_lounge_card_watch_all_photos => 'Посмотреть все фото';

  @override
  String vip_lounge_card_select_button(String name) {
    return 'Выбрать $name';
  }

  @override
  String get summary_flight_info_title => 'Информация о рейсе';

  @override
  String get summary_companions_title => 'Сопровождающие';

  @override
  String get order_details_cancellation_rules_title => 'Правила отмены';

  @override
  String get order_details_cancellation_rule_1 =>
      'Отмена услуги менее чем за 48 часов до времени начала — 100% стоимости.';

  @override
  String get order_details_cancellation_rule_2 => 'Неявка пассажира — 100% стоимости.';

  @override
  String get order_details_cancellation_rule_3 =>
      'Изменения в бронировании возможны по согласованию с менеджером и зависят от доступности услуги.';

  @override
  String get order_details_flight_info => 'Информация о рейсе';

  @override
  String get order_details_price_details => 'Детали цены';

  @override
  String get order_details_additional_conditions => 'Дополнительные условия';

  @override
  String get order_details_endpoint_departure => 'Вылет';

  @override
  String get order_details_endpoint_arrival => 'Прилет';

  @override
  String get order_details_endpoint_transit => 'Транзит';

  @override
  String get order_details_endpoint_transit_arrival => 'Транзит (прилет)';

  @override
  String get order_details_endpoint_transit_departure => 'Транзит (вылет)';

  @override
  String get order_details_travelers_title => 'Путешественники';

  @override
  String get order_details_companions_title => 'Сопровождающие';

  @override
  String get transfer_car_category_label => 'Категория автомобиля';

  @override
  String get transfer_departure_address_label => 'Адрес отправления';

  @override
  String get transfer_arrival_address_label => 'Адрес назначения';

  @override
  String get transaction_card_parameter_accrued_bonuses => 'Начислено бонусов';

  @override
  String get receipt_payment_method => 'Способ оплаты';

  @override
  String get loyalty_rules_title => 'Использование баллов';

  @override
  String get loyalty_rules_main_text =>
      'Бонусными баллами можно оплатить любую часть стоимости услуг — полностью или частично. Если баллов недостаточно, оставшаяся сумма оплачивается деньгами.';

  @override
  String get loyalty_rules_rate_text => '1 балл = 0,1 \$';

  @override
  String get loyalty_rules_additional_conditions_title => 'Дополнительные условия';

  @override
  String get loyalty_rules_condition_1 => 'Баллы нельзя обменять на наличные средства';

  @override
  String get loyalty_rules_condition_2 => 'Баллы не начисляются за оплату баллами';

  @override
  String get loyalty_rules_condition_3 =>
      'При возврате услуги баллы, начисленные за неё, списываются';

  @override
  String get loyalty_rules_important_title => 'Важно';

  @override
  String get loyalty_rules_important_text =>
      'Если оплата производится в другой валюте, расчёт баллов осуществляется с пересчётом в USD по актуальному курсу.';

  @override
  String get receipt_pdf_transaction_title => 'Квитанция';

  @override
  String receipt_pdf_date_external(String date, String externalId) {
    return 'от $date года: $externalId';
  }

  @override
  String receipt_pdf_order_number(String orderRef) {
    return 'Заказ № $orderRef';
  }

  @override
  String get receipt_transfer_data_title => 'Данные трансфера';

  @override
  String get receipt_transfer_stop_point => 'Точка остановки';

  @override
  String receipt_total_label(String amount) {
    return 'ИТОГО: $amount';
  }

  @override
  String receipt_flight_entry(int index, String flightNumber, String dateTime) {
    return '$index. Рейс: $flightNumber, $dateTime';
  }

  @override
  String get receipt_label_status_colon => 'Статус:';

  @override
  String get receipt_label_date_colon => 'Дата:';

  @override
  String get receipt_label_currency_colon => 'Валюта:';

  @override
  String get receipt_label_points_colon => 'Баллы:';

  @override
  String receipt_points_accrued_line(String amount, String accruedLabel) {
    return '+$amount ($accruedLabel)';
  }

  @override
  String get receipt_payment_status_awaiting => 'Ожидает оплату';

  @override
  String get receipt_payment_status_paid => 'Оплачено';

  @override
  String get receipt_payment_status_declined => 'Платеж не прошел';

  @override
  String get receipt_payment_status_unknown_long => 'Неизвестный статус';

  @override
  String get receipt_pdf_company_footer =>
      'ООО «Example App»\nEmail для связи: support@example.com\n\nПодробная информация об условиях предоставления услуг и обработке персональных данных доступна по ссылкам:\nУсловия использования и Политика конфиденциальности';

  @override
  String get receipt_pdf_bonus_title => 'Детали бонусной операции';

  @override
  String get receipt_bonus_breakdown_title => 'Расчет бонусов';

  @override
  String get receipt_bonus_paid_service_label => 'Сумма оплаченной услуги';

  @override
  String get receipt_bonus_user_level_label => 'Статус пользователя';

  @override
  String get receipt_bonus_coefficient_label => 'Бонусный коэффициент';

  @override
  String receipt_bonus_percent_of_order(String percent) {
    return '$percent% от суммы заказа';
  }

  @override
  String get receipt_bonus_accrued_label => 'Начислено бонусов';

  @override
  String receipt_bonus_points_short(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count балла',
      many: '$count баллов',
      few: '$count балла',
      one: '$count балл',
    );
    return '$_temp0';
  }

  @override
  String get receipt_bonus_section_status => 'Статус бонусов';

  @override
  String get receipt_bonus_points_status_label => 'Статус баллов';

  @override
  String get receipt_bonus_accrual_date_label => 'Дата начисления';

  @override
  String get receipt_bonus_expiry_title => 'Срок действия';

  @override
  String receipt_bonus_valid_until(String date) {
    return 'до $date';
  }

  @override
  String get receipt_bonus_twelve_months_note => 'Баллы действуют 12 месяцев с момента начисления';

  @override
  String get receipt_bonus_balance_title => 'Баланс бонусов';

  @override
  String get receipt_bonus_balance_current => 'Текущий';

  @override
  String get receipt_bonus_balance_spendable => 'Доступно для использования';

  @override
  String get receipt_bonus_program_line_1 =>
      ' • Бонусные баллы начисляются в рамках программы лояльности Example App.';

  @override
  String get receipt_bonus_program_line_2 =>
      ' • Условия начисления, использования и срока действия баллов регулируются правилами программы лояльности.';

  @override
  String get receipt_bonus_rules_body =>
      ' • Баллы можно использовать для полной или частичной оплаты следующих услуг Example App.\n • Баллы не обмениваются на денежные средства\n • Баллы не начисляются при оплате услуг баллами\n • При возврате услуги начисленные за неё баллы будут списаны';

  @override
  String get rating_badge_terrible => 'Ужасно';

  @override
  String get rating_badge_bad => 'Плохо';

  @override
  String get rating_badge_normal => 'Нормально';

  @override
  String get rating_badge_good => 'Хорошо';

  @override
  String get rating_badge_excellent => 'Превосходно';

  @override
  String get secret_mode_production_mode_title => 'Production mode';

  @override
  String get secret_mode_return_to_production_message => 'Return to production mode?';

  @override
  String get secret_mode_yes => 'Yes';

  @override
  String get secret_mode_no => 'No';

  @override
  String get secret_mode_wrong_password => 'Wrong password';

  @override
  String get secret_mode_test_api_title => 'Test API';

  @override
  String get secret_mode_version_label => 'Version';

  @override
  String get secret_mode_password_hint => 'Password';

  @override
  String get secret_mode_ok => 'OK';

  @override
  String get peer_home_title => 'Добро пожаловать в tete games';

  @override
  String get peer_home_mode_prompt => 'Выберите режим подключения';

  @override
  String get peer_home_start_server_button => 'Ожидать присоединения';

  @override
  String get peer_home_start_client_button => 'Найти и подключиться';

  @override
  String get peer_home_retry_button => 'Повторить';

  @override
  String get peer_dialog_cancel => 'Отмена';

  @override
  String get peer_dialog_error_title => 'Ошибка';

  @override
  String get peer_error_bluetooth_unavailable => 'Bluetooth выключен или недоступен';

  @override
  String get peer_nickname_dialog_title => 'Придумайте себе псевдоним';

  @override
  String get peer_nickname_field_label => 'Псевдоним';

  @override
  String get peer_nickname_field_hint => 'Введите псевдоним';

  @override
  String get peer_nickname_save_button => 'Сохранить';

  @override
  String get peer_nickname_save_failed => 'Не удалось сохранить псевдоним';

  @override
  String get peer_nickname_validation_empty => 'Псевдоним не должен быть пустым';

  @override
  String get peer_nickname_validation_too_long => 'Псевдоним не должен быть длиннее 20 символов';

  @override
  String get peer_nickname_validation_wrong_format => 'Не допускаются пробелы между символами';

  @override
  String get peer_server_waiting_title => 'Ожидание подключения...';

  @override
  String get peer_server_waiting_body => 'Ваше устройство видимо для других устройств';

  @override
  String get peer_server_invitation_title => 'Получено приглашение';

  @override
  String peer_server_invitation_device(String deviceName) {
    return 'Приглашение от устройства $deviceName';
  }

  @override
  String peer_server_invitation_player(String playerName) {
    return 'Имя пользователя: $playerName';
  }

  @override
  String get peer_server_invitation_prompt => 'Примите решение';

  @override
  String get peer_server_accept_button => 'Принять';

  @override
  String get peer_server_reject_button => 'Отклонить';

  @override
  String get peer_client_devices_title => 'Найденные устройства';

  @override
  String get peer_client_loading => 'Загрузка...';

  @override
  String get peer_client_waiting_hosts_title => 'Ждут приглашения:';

  @override
  String get peer_client_searching => 'Поиск...';

  @override
  String get peer_client_unknown_device => 'Неизвестное устройство';

  @override
  String get peer_client_our_app_badge => 'Приложение tete games';

  @override
  String get peer_client_invite_button => 'Пригласить';

  @override
  String get peer_client_invitation_sent_title => 'Приглашение отправлено';

  @override
  String get peer_client_wait_confirmation => 'Ждите подтверждения';

  @override
  String get peer_client_invitation_rejected_title => 'Приглашение отклонено';

  @override
  String get peer_client_invitation_rejected_body => 'Соперник отклонил приглашение';

  @override
  String get peer_client_invitation_rejected_button => 'Жаль...';

  @override
  String get peer_client_error_discovery => 'Ошибка запуска поиска';

  @override
  String get peer_client_error_connection => 'Ошибка подключения';

  @override
  String get peer_games_list_title => 'Игры';

  @override
  String get peer_games_list_stub => 'Список игр скоро появится';
}

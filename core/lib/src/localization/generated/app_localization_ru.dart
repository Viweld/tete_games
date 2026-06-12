// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationRu extends AppLocalization {
  AppLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get all_documents_title => 'Все документы';

  @override
  String get core_error_unknown => 'Что-то пошло не так...';

  @override
  String get something_went_wrong => 'Что-то пошло не так';

  @override
  String get name_validator_empty_message => 'Не может быть пустым';

  @override
  String get name_validator_invalid_message => 'Некорректный формат имени';

  @override
  String get name_validator_invalid_detailed_message =>
      'Неверный формат имени. Используйте только латинские буквы, пробелы, дефисы или апострофы.';

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
  String get service_category_promo_title => 'Промо';

  @override
  String get nav_bar_main_title => 'Главная';

  @override
  String get nav_bar_ordering_title => 'Оформить';

  @override
  String get nav_bar_my_trips_title => 'Мои поездки';

  @override
  String get nav_bar_profile_title => 'Профиль';

  @override
  String get auth_login_title => 'Войдите или создайте аккаунт';

  @override
  String get auth_login_subtitle => 'Мы отправим код для входа на указанную почту';

  @override
  String get auth_email_hint => 'Введите электронный адрес';

  @override
  String get auth_email_label => 'Введите почту';

  @override
  String get auth_email_invalid_error => 'Проверьте правильность ввода';

  @override
  String get auth_continue_button => 'Продолжить';

  @override
  String get auth_terms_prefix => 'Входя в аккаунт или создавая новый, вы соглашаетесь с нашими ';

  @override
  String get auth_terms_link => 'Правилами и условиями';

  @override
  String get auth_terms_separator => ' и ';

  @override
  String get auth_privacy_link => 'Положением о конфиденциальности';

  @override
  String get auth_copyright => '2026. Все права защищены';

  @override
  String get auth_code_title => 'Проверьте электронную почту';

  @override
  String get auth_code_sent_prefix => 'Мы отправили код подтверждения на адрес ';

  @override
  String get auth_code_sent_suffix => '. Введите его, чтобы продолжить вход';

  @override
  String get auth_code_resend_prefix =>
      'Письмо не пришло? Проверьте папку «Спам» или запросите новый код через ';

  @override
  String get auth_code_resend_button => 'Отправить повторно';

  @override
  String get auth_code_expired_error =>
      'Срок действия кода истёк. Запросите новый и попробуйте ещё раз';

  @override
  String get main_screen_title => 'Главная';

  @override
  String get my_trips_screen_title => 'Мои путешествия';

  @override
  String get profile_screen_title => 'Профиль';

  @override
  String get example_action_navigateExample_title => 'Пример навигации';

  @override
  String estimate_seconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds секунд',
      many: '$seconds секунд',
      few: '$seconds секунды',
      one: '$seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get profile_welcome_anon_title => 'Добро пожаловать!';

  @override
  String profile_welcome_title(String name) {
    return 'Добро пожаловать, $name!';
  }

  @override
  String profile_level_status(String level) {
    return 'У вас базовый уровень — $level';
  }

  @override
  String profile_level_remaining(String nextLevel, num amountRemaining) {
    String _temp0 = intl.Intl.pluralLogic(
      amountRemaining,
      locale: localeName,
      other: '$amountRemaining балла',
      many: '$amountRemaining баллов',
      few: '$amountRemaining балла',
      one: '$amountRemaining балл',
      zero: '0 баллов',
    );
    return 'До уровня $nextLevel осталось: $_temp0';
  }

  @override
  String get profile_details_button => 'Подробнее';

  @override
  String get profile_header_current_status_title => 'ВАШ ТЕКУЩИЙ СТАТУС';

  @override
  String get profile_header_spent_for_period => 'Потрачено за период';

  @override
  String profile_header_to_level(String levelName) {
    return 'До уровня $levelName';
  }

  @override
  String profile_header_amount_remaining(String amount) {
    return '$amount осталось';
  }

  @override
  String profile_header_percent_to_next_level(String percent) {
    return '$percent% до следующего уровня';
  }

  @override
  String profile_header_bonus_usd_equivalent(String amount) {
    return '≈ $amount к оплате';
  }

  @override
  String profile_header_cashback_percent(String percent) {
    return '$percent% кэшбек';
  }

  @override
  String get profile_header_cashback_description => ' — вы получаете баллы с каждой покупки';

  @override
  String profile_header_cashback_at_level(String levelName) {
    return ' на уровне $levelName';
  }

  @override
  String get profile_header_your_bonuses => 'Ваши бонусы';

  @override
  String get profile_header_points => 'баллов';

  @override
  String get profile_section_my_travels => 'Мои путешествия';

  @override
  String get profile_item_bookings => 'Бронирования';

  @override
  String get profile_item_my_reviews => 'Мои отзывы';

  @override
  String get profile_section_account_management => 'Управление аккаунтом';

  @override
  String get profile_item_personal_data => 'Персональные данные';

  @override
  String get profile_item_other_travelers => 'Другие путешественники';

  @override
  String get profile_section_help => 'Помощь';

  @override
  String get profile_item_contact_support => 'Связаться со службой поддержки';

  @override
  String get profile_item_articles => 'Наш блог';

  @override
  String get profile_item_our_blog => 'Наш блог';

  @override
  String get profile_item_security_center => 'Центр знаний по безопасности';

  @override
  String get profile_section_payment_info => 'Платежная информация';

  @override
  String get profile_item_rewards_wallet => 'Вознаграждения и кошелек';

  @override
  String get profile_item_transactions => 'Транзакции';

  @override
  String get profile_section_legal => 'Юридические данные';

  @override
  String get profile_item_privacy => 'Конфиденциальность';

  @override
  String get profile_item_terms => 'Условия использования';

  @override
  String get profile_item_all_documents => 'Все документы';

  @override
  String get profile_section_settings => 'Настройки';

  @override
  String get profile_item_personalization => 'Настройки персонализации';

  @override
  String get profile_item_mailing => 'Настройки рассылки';

  @override
  String get personalization_screen_title => 'Настройки персонализации';

  @override
  String get personalization_language_label => 'Язык';

  @override
  String get personalization_language_search_hint => 'Поиск по названию';

  @override
  String get personalization_currency_label => 'Валюта';

  @override
  String get personalization_currency_search_hint => 'Поиск по названию';

  @override
  String get personalization_region_label => 'Регион/Страна';

  @override
  String get profile_logout_button => 'Выйти';

  @override
  String get profile_delete_account_button => 'Удалить аккаунт';

  @override
  String get auth_or_divider => 'или';

  @override
  String get auth_and => 'и';

  @override
  String get profile_not_auth_title => 'Войдите в аккаунт';

  @override
  String get profile_not_auth_subtitle =>
      'Сохраняйте поездки, маршруты и избранные места. Копите баллы и экономьте на заказах';

  @override
  String get profile_login_button => 'Войти';

  @override
  String get auth_plug_title => 'Ещё несколько секунд…';

  @override
  String get auth_plug_comment => 'Мы завершаем вход в аккаунт';

  @override
  String get main_hero_title => 'VIP-сервисы в аэропортах\nпо всему миру';

  @override
  String get main_search_hint => 'Аэропорт, город или номер рейса...';

  @override
  String get main_search_date_hint => 'Дата рейса...';

  @override
  String get main_search_button => 'Найти';

  @override
  String get main_search_button_continue => 'Продолжить';

  @override
  String get main_search_subtitle => 'Бронирование за пару минут • Поддержка 24/7';

  @override
  String get main_services_title => 'Услуги';

  @override
  String get main_loyalty_title => 'Программа лояльности';

  @override
  String get main_loyalty_description => 'Возвращаем часть стоимости поездок в бонусных баллах';

  @override
  String get main_loyalty_link => 'Подробнее';

  @override
  String get main_airports_title => 'Популярные аэропорты';

  @override
  String get main_airports_all => 'Все';

  @override
  String get all_airports_screen_title => 'Аэропорты с лучшими предложениями';

  @override
  String get all_airports_section_title => 'Выбор аэропорта';

  @override
  String get all_airports_book_button => 'Оформить';

  @override
  String get all_airports_empty => 'Нет результатов';

  @override
  String get all_airports_search_hint => 'Аэропорт или город';

  @override
  String get search_services_search_title => 'Поиск аэропорта';

  @override
  String get search_services_all_airports_button => 'Все аэропорты';

  @override
  String get empty_search_title => 'Ничего не найдено';

  @override
  String get empty_search_subtitle => 'Попробуйте изменить запрос\nили повторить позже';

  @override
  String get main_transfer_placeholder => 'Раздел трансфера в разработке';

  @override
  String get personal_data_screen_title => 'Персональные данные';

  @override
  String get personal_data_name_label => 'Имя';

  @override
  String get personal_data_name_placeholder => 'Укажите ваше имя';

  @override
  String get personal_data_email_label => 'Адрес электронной почты';

  @override
  String get personal_data_phone_label => 'Номер телефона';

  @override
  String get personal_data_phone_placeholder => 'Укажите ваш номер телефона';

  @override
  String get personal_data_birthdate_label => 'Дата рождения';

  @override
  String get personal_data_birthdate_placeholder => 'Укажите вашу дату рождения';

  @override
  String get personal_data_gender_label => 'Пол';

  @override
  String get personal_data_gender_male => 'Мужской';

  @override
  String get personal_data_gender_female => 'Женский';

  @override
  String get personal_data_citizenship_label => 'Гражданство';

  @override
  String get personal_data_citizenship_placeholder => 'Укажите ваше гражданство';

  @override
  String get personal_data_delete_account => 'Удалить аккаунт';

  @override
  String get main_transfer_title => 'Трансфер по всему миру';

  @override
  String get main_transfer_subtitle =>
      'Без привязки к рейсу\nРаботает как персональный трансфер из любой точки';

  @override
  String get main_transfer_types_title => 'Типы трансфера';

  @override
  String get main_search_transfer_date_title => 'Дата поездки';

  @override
  String get main_search_transfer_date_hint => 'Дата поездки';

  @override
  String get main_search_transfer_from_title => 'Адрес отправления';

  @override
  String get main_search_transfer_from_hint => 'Адрес отправления';

  @override
  String get main_search_transfer_to_title => 'Адрес прибытия';

  @override
  String get main_search_transfer_to_hint => 'Адрес прибытия';

  @override
  String get edit_name_title => 'Укажите ваше имя';

  @override
  String get edit_name_avatar_changed_message => 'Аватар профиля изменен';

  @override
  String get edit_name_photo_recommendation =>
      'Для корректной работы сервиса Example App рекомендуем загрузить ваше реальное фото в профиль. Это позволит сотрудникам аэропорта легко вас идентифицировать и сопровождать без задержек.';

  @override
  String get personal_data_firstname_label => 'Имя';

  @override
  String get personal_data_firstname_hint => 'Имя (латиницей, например, Ivan)';

  @override
  String get personal_data_lastname_label => 'Фамилия';

  @override
  String get personal_data_lastname_hint => 'Фамилия (латиницей, например, Ivanov)';

  @override
  String get personal_data_photo_label => 'Фотография профиля';

  @override
  String get personal_data_upload => 'Загрузить';

  @override
  String get personal_data_save => 'Сохранить';

  @override
  String get change_email_confirm_button => 'Подтвердить';

  @override
  String get confirm_email_title => 'Проверьте электронную почту';

  @override
  String get confirm_email_sent_prefix => 'Мы отправили код подтверждения на адрес ';

  @override
  String get confirm_email_sent_suffix => '. Введите его, для подтверждения электронной почты';

  @override
  String get confirm_email_resend_prefix =>
      'Письмо не пришло? Проверьте папку «Спам» или запросите новый код через ';

  @override
  String get confirm_email_resend_button => 'Отправить повторно';

  @override
  String get confirm_email_submit_button => 'Подтвердить';

  @override
  String get confirm_email_plug_title => 'Ещё несколько секунд…';

  @override
  String get confirm_email_plug_comment => 'Идет смена электронной почты';

  @override
  String get confirm_delete_account_title => 'Удаление аккаунта';

  @override
  String get confirm_delete_account_sent_prefix => 'Мы отправили код подтверждения на адрес ';

  @override
  String get confirm_delete_account_sent_suffix =>
      '. Введите его, чтобы безвозвратно удалить аккаунт';

  @override
  String get confirm_delete_account_submit_button => 'Удалить аккаунт';

  @override
  String get confirm_delete_account_plug_title => 'Ещё несколько секунд…';

  @override
  String get confirm_delete_account_plug_comment => 'Удаление аккаунта';

  @override
  String get birthday_screen_title => 'Дата рождения';

  @override
  String get birthday_field_label => 'Дата рождения';

  @override
  String get save_button => 'Сохранить';

  @override
  String get invalid_date_error => 'Введите корректную дату';

  @override
  String get citizenship_screen_title => 'Гражданство';

  @override
  String get citizenship_search_placeholder => 'Поиск по названию страны';

  @override
  String get main_transfer_date_modal_title => 'Выбор даты поездки';

  @override
  String get main_flight_date_modal_title => 'Выбор даты рейса';

  @override
  String get invitation_dialog_title => 'Войти в аккаунт';

  @override
  String get invitation_dialog_message =>
      'Войдите в профиль, чтобы сохранять данные пассажиров и историю поездок';

  @override
  String get invitation_dialog_button => 'Войти';

  @override
  String get welcome_screen_title => 'Добро пожаловать!';

  @override
  String get welcome_screen_message =>
      '🎉 вы успешно зарегистрировались\nи вам навсегда доступны вознаграждения\nв программе лояльности. Ваш текущий уровень:';

  @override
  String get welcome_screen_level => 'Start';

  @override
  String get welcome_screen_description =>
      'За каждую оплату вам возвращаются бонусные\nбаллы. Чем больше поездок, тем выше статус\nи больше выгода!';

  @override
  String get welcome_screen_got_it => 'Понятно';

  @override
  String get welcome_screen_details => 'Подробнее о программе';

  @override
  String get welcome_screen_footer =>
      'Повышайте уровень — получайте больше бонусов,\nподробнее можно прочитать на странице программы\nлояльности';

  @override
  String get flights_input_title => 'Введите свои данные';

  @override
  String stepped_header_step_label(int current, int total) {
    return 'Шаг $current/$total';
  }

  @override
  String get flights_input_description =>
      'Пожалуйста, укажите свои данные латинскими буквами, чтобы сотрудники аэропорта смогли их понять';

  @override
  String get flights_input_flight_data_title => 'Данные рейса';

  @override
  String get flights_input_with_transfer => 'С пересадкой';

  @override
  String get flights_input_second_flight_data_title => 'Данные второго рейса';

  @override
  String get flights_input_remove_flight => 'Удалить';

  @override
  String get flights_input_flight_number_label => 'Номер';

  @override
  String get flights_input_flight_number_hint => 'Номер рейса, например, CU 6456';

  @override
  String get flights_input_flight_date_label => 'Дата';

  @override
  String get flights_input_flight_date_hint => 'Дата рейса, ДД.ММ.ГГГГ';

  @override
  String get flights_input_footer_text =>
      'Введите номер рейса — аэропорт подгрузится автоматически, и вы сможете выбрать услугу';

  @override
  String get flights_input_continue_button => 'Продолжить';

  @override
  String get flight_not_found_title => 'Рейс не найден.';

  @override
  String get flight_not_found_message =>
      'Проверьте номер рейса и дату, если всё указано верно, то заполните время вылета вручную. Информация по рейсу может обновиться позже.';

  @override
  String get departure_time_label => 'Время вылета';

  @override
  String get airport_header_departure_title => 'Аэропорт вылета';

  @override
  String get airport_header_arrival_title => 'Аэропорт прилета';

  @override
  String get airport_header_transit_title => 'Транзитный пункт';

  @override
  String get airport_header_transit_arrival_title => 'Транзитный пункт (Прилет)';

  @override
  String get airport_header_transit_departure_title => 'Транзитный пункт (Вылет)';

  @override
  String get flights_input_step_2 => 'Шаг 2/6';

  @override
  String get flights_input_conditions_title => 'Дополнительные условия';

  @override
  String get flights_input_next_step_hint => 'Следующим шагом вы сможете выбрать услуги';

  @override
  String get flight_details_first_flight => 'Первый рейс';

  @override
  String get flight_details_second_flight => 'Второй рейс';

  @override
  String get flight_details_auto_filled_hint =>
      'Данные рейса заполнены автоматически\nПроверьте корректность';

  @override
  String get flight_details_transit_exit => 'Выход в город';

  @override
  String get flight_details_terminal_hint => 'Укажите терминал';

  @override
  String get flight_details_terminal_label => 'Терминал';

  @override
  String get flight_details_airport_name_hint => 'Название аэропорта';

  @override
  String get flight_details_single_terminal_name => 'Единый терминал';

  @override
  String get info_card_tariffs_description =>
      'Тарифы зависят от аэропорта, услуги и возраста пассажира. Нажми сюда, чтобы посмотреть подробности';

  @override
  String get select_services_title => 'Выберите услуги';

  @override
  String select_services_airport_prompt(String airportName) {
    return 'На основе данных рейса выберите услугу для этого аэропорта: $airportName';
  }

  @override
  String get select_services_main_services_hint =>
      'Выберите основные услуги — дополнительные параметры появятся ниже';

  @override
  String get select_services_no_service_needed => 'Не нужна услуга в этом аэропорту';

  @override
  String get select_services_fast_track_notice =>
      'В этом аэропорту доступно несколько услуг Fast Track. Стоимость и условия могут отличаться в зависимости от выбранной услуги.';

  @override
  String get select_services_vip_lounge_notice =>
      'В этом аэропорту доступно несколько VIP-залов. Стоимость и условия могут отличаться в зависимости от выбранного зала.';

  @override
  String get select_services_transfer_notice =>
      'Стоимость трансфера рассчитывается индивидуально. Менеджер свяжется с вами и согласует финальную цену. Сейчас оплата не требуется. Укажите данные, чтобы зафиксировать заказ.';

  @override
  String get select_services_accompaniment_notice =>
      'В этом аэропорту доступно несколько услуг сопровождения. Стоимость и условия могут отличаться в зависимости от выбранной услуги.';

  @override
  String get select_services_at_least_one_required_toast =>
      'Для оформления заказа нужно выбрать хотя бы одну услугу в любом из аэропортов по вашему маршруту';

  @override
  String get auth_choice_title => 'Сохранить бронирование в личном кабинете?';

  @override
  String get auth_choice_subtitle =>
      'Если у вас уже есть аккаунт — просто войдите.\nЕсли нет, мы можем создать аккаунт и сохранить бронирование в «Моих путешествиях»';

  @override
  String get auth_choice_login_button => 'Войти в аккаунт';

  @override
  String get auth_choice_create_account_label => 'Создать аккаунт и сохранить бронь';

  @override
  String get auth_choice_create_account_hint =>
      'Мы отправим код на почту. После подтверждения все данные сохранятся.';

  @override
  String get auth_choice_without_auth_label => 'Продолжить без регистрации';

  @override
  String get auth_choice_without_auth_hint =>
      'Бронирование не появится в «Моих путешествиях».\nДля управления заказом потребуется код бронирования — сохраните его.';

  @override
  String get auth_choice_continue_button => 'Продолжить';

  @override
  String get flight_input_time_hint => 'ЧЧ:ММ';

  @override
  String get select_services_vip_lounge => 'VIP-зал';

  @override
  String get transfer_field_required_error => 'Поле не может быть пустым';

  @override
  String get transfer_route_title => 'Маршрут трансфера';

  @override
  String get transfer_departure_address_hint => 'Адрес отправления';

  @override
  String get transfer_intermediate_point_hint => 'Промежуточная точка';

  @override
  String get transfer_arrival_address_hint => 'Адрес назначения';

  @override
  String get transfer_car_category_hint => 'Категория автомобиля';

  @override
  String get transfer_add_stop_button => 'Добавить остановку';

  @override
  String get flight_details_flight_label => 'Рейс';

  @override
  String airport_detail_terminals_subtitle(String names) {
    return 'Терминалы $names';
  }

  @override
  String get airport_detail_tariffs_title => 'Тарифы';

  @override
  String get airport_detail_terminal_hint => 'Терминал';

  @override
  String get airport_detail_all_terminals => 'Все терминалы';

  @override
  String airport_detail_terminal_option(String name) {
    return 'Терминал $name';
  }

  @override
  String get airport_detail_book_button => 'Забронировать';

  @override
  String get airport_detail_what_included_title => 'Что входит в услугу';

  @override
  String get airport_detail_photos_title => 'Фотографии';

  @override
  String get airport_detail_important_to_know => 'Важно знать';

  @override
  String get airport_detail_checkout_button => 'Оформить';

  @override
  String get airport_detail_price_depends_on_tariff => 'Цена зависит от выбранного тарифа';

  @override
  String get airport_detail_tariff_description => 'Описание';

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
  String get airport_detail_price_label => 'Цена';

  @override
  String get airport_detail_price_on_request => 'По запросу';

  @override
  String get airport_detail_overview_available_services_title => 'Доступные услуги';

  @override
  String get airport_detail_overview_customer_reviews_title => 'Отзывы клиентов';

  @override
  String get airport_detail_overview_about_airport_title => 'Об аэропорте';

  @override
  String get airport_detail_overview_faq_title => 'Вопросы и ответы';

  @override
  String get airport_detail_general_information_title => 'Общая информация';

  @override
  String get airport_detail_info_iata_label => 'Код IATA';

  @override
  String get airport_detail_info_city_label => 'Город';

  @override
  String get airport_detail_info_terminals_label => 'Терминалы';

  @override
  String get airport_detail_info_gates_label => 'Выходы (гейты)';

  @override
  String get airport_detail_info_hours_label => 'Режим работы';

  @override
  String get airport_detail_info_passengers_label => 'Пассажиропоток в год';

  @override
  String get airport_detail_info_airlines_label => 'Авиакомпании';

  @override
  String get airport_detail_info_address_label => 'Адрес';

  @override
  String get airport_detail_info_distance_to_city_label => 'Расстояние до города';

  @override
  String get airport_detail_info_public_transport_label => 'Общественный транспорт';

  @override
  String get airport_detail_getting_there_title => 'Как добраться';

  @override
  String get airport_detail_getting_there_address_label => 'Адрес';

  @override
  String get airport_detail_getting_there_distance_label => 'Расстояние';

  @override
  String get airport_detail_getting_there_transport_label => 'Транспорт';

  @override
  String get airport_detail_getting_there_need_transfer_title => 'Нужен трансфер?';

  @override
  String get airport_detail_getting_there_book_premium_transfer_button =>
      'Заказать премиум-трансфер';

  @override
  String get airport_detail_service_details_title => 'Детали услуг';

  @override
  String get airport_detail_how_it_works_title => 'Как это работает';

  @override
  String get airport_detail_not_included_title => 'Не включено';

  @override
  String get airport_detail_about_service_title => 'Об услуге';

  @override
  String get airport_detail_important_information_title => 'Важная информация';

  @override
  String get airport_detail_order_transfer_button => 'Заказать трансфер';

  @override
  String get airport_detail_order_service_button => 'Заказать услугу';

  @override
  String get airport_detail_benefit_instant_confirmation => 'Мгновенное подтверждение';

  @override
  String get airport_detail_benefit_free_cancellation_24h => 'Бесплатная отмена до 24 ч до услуги';

  @override
  String get airport_detail_benefit_e_ticket_email => 'Электронный билет на email';

  @override
  String get airport_detail_stat_airlines_label => 'Авиакомпании';

  @override
  String get airport_detail_stat_annual_passengers_label => 'Пассажиров в год';

  @override
  String get airport_detail_stat_working_hours_label => 'Режим работы';

  @override
  String get airport_detail_stat_free_cancellation_label => 'Бесплатная отмена';

  @override
  String airport_detail_reviews_count(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отзывов',
      many: '$count отзывов',
      few: '$count отзыва',
      one: '$count отзыв',
    );
    return '$_temp0';
  }

  @override
  String airport_detail_services_available(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Доступно $count видов услуг',
      many: 'Доступно $count видов услуг',
      few: 'Доступно $count вида услуг',
      one: 'Доступен $count вид услуг',
    );
    return '$_temp0';
  }

  @override
  String get airport_detail_view_photos => 'Посмотреть фото';

  @override
  String get airport_detail_retry_button => 'Повторить';

  @override
  String get airport_detail_empty_title => 'Услуги скоро появятся';

  @override
  String get airport_detail_empty_description =>
      'К сожалению, сейчас мы не предоставляем услуги в этом аэропорту. Но мы уже работаем над подключением новых сервисов и расширением покрытия. \n\nВы можете оставить свою электронную почту — мы уведомим вас сразу, как услуги станут доступны.';

  @override
  String get airport_detail_empty_subscribe_button => 'Подписаться на обновление';

  @override
  String get airport_detail_subscribe_title => 'Получайте уведомления';

  @override
  String get airport_detail_subscribe_description =>
      'Оставьте email — мы сообщим, когда услуги в этом аэропорту станут доступны';

  @override
  String get airport_detail_receive_news => 'Получать новости и обновления сервиса Example App';

  @override
  String get airport_detail_subscribe_submit_button => 'Подписаться';

  @override
  String get airport_detail_agreement_text => 'Подписываясь, вы соглашаетесь с нашими';

  @override
  String get airport_detail_info_tarif_bottom_sheet_title => 'Цена услуги зависит от терминала';

  @override
  String get airport_detail_info_tarif_bottom_sheet_description =>
      'Вы можете посмотреть все варианты. При оформлении укажите номер рейса — мы определим терминал автоматически. Если терминал ещё неизвестен, мы рассчитаем ориентировочную стоимость и свяжемся с вами для уточнения.';

  @override
  String get core_delete_button => 'Удалить';

  @override
  String get core_cancel_button => 'Отменить';

  @override
  String get core_cancel_short_button => 'Отмена';

  @override
  String get core_back_button => 'Назад';

  @override
  String get core_male => 'Мужской';

  @override
  String get core_female => 'Женский';

  @override
  String get core_not_specified => 'Не указан';

  @override
  String get auth_invalid_code => 'Неправильный код';

  @override
  String get profile_traveler_card_default_name => 'Путешественник';

  @override
  String get profile_traveler_card_gender_label => 'Пол:';

  @override
  String get profile_traveler_card_dob_label => 'Дата рождения:';

  @override
  String get profile_traveler_card_dob_not_specified => 'Не указана';

  @override
  String get profile_traveler_card_edit_button => 'Редактировать данные';

  @override
  String get profile_traveler_card_badge_passenger => 'Пассажир';

  @override
  String get profile_logout_message => 'Вы уверены, что хотите выйти из аккаунта?';

  @override
  String get profile_travelers_title => 'Другие путешественники';

  @override
  String get profile_travelers_empty_text =>
      'Вы ещё не добавили других путешественников. Сохраните данные семьи, коллег или тех, с кем вы ездите чаще всего — и они будут автоматически подставляться в бронирования. Это сэкономит время и избавит от повторного заполнения документов';

  @override
  String get profile_travelers_delete_dialog_title => 'Удаление пассажира';

  @override
  String get profile_travelers_delete_dialog_message =>
      'Вы действительно хотите удалить пассажира из списка? Это действие нельзя будет отменить';

  @override
  String get profile_travelers_add_button => 'Добавить путешественников';

  @override
  String get profile_delete_account_message => 'Вы уверены, что хотите удалить аккаунт?';

  @override
  String get profile_birthday_hint_format => 'ДД.ММ.ГГГГ';

  @override
  String get services_endpoints_tariffs_title => 'Тарифы';

  @override
  String get core_logout_button => 'Выйти';

  @override
  String get edit_traveler_add_title => 'Добавление путешественника';

  @override
  String get edit_traveler_edit_title => 'Редактирование данных';

  @override
  String get edit_traveler_add_button => 'Добавить';

  @override
  String get edit_traveler_consent_text =>
      'Я подтверждаю, что указанное лицо согласно на передачу персональных данных';

  @override
  String get select_travelers_title => 'Данные пассажира';

  @override
  String get select_travelers_subtitle =>
      'Данные указываются строго латинскими буквами, как в паспорте';

  @override
  String get select_travelers_passengers_title => 'Мои данные';

  @override
  String get select_travelers_i_am_flying => 'Лечу я';

  @override
  String get select_travelers_adults => 'Взрослые';

  @override
  String get select_travelers_children => 'Дети (2–12 лет)';

  @override
  String get select_travelers_infants => 'Дети (до 2 лет)';

  @override
  String get select_travelers_prm => 'Есть пассажир с ограниченной мобильностью (PRM)';

  @override
  String get select_travelers_add_passenger => 'Добавить пассажира';

  @override
  String get select_travelers_add_companion => 'Добавить сопровождающего';

  @override
  String get select_travelers_form_select_from_list => 'Выбрать из своего списка';

  @override
  String select_travelers_form_traveler_label(int id) {
    return 'Путешественник #$id';
  }

  @override
  String get select_travelers_form_first_name_label => 'Имя';

  @override
  String get select_travelers_form_first_name_hint => 'Имя (латиницей, например, Ivan)';

  @override
  String get select_travelers_form_last_name_label => 'Фамилия';

  @override
  String get select_travelers_form_last_name_hint => 'Фамилия (латиницей, например, Ivanov)';

  @override
  String get select_travelers_form_citizenship_label => 'Гражданство';

  @override
  String get select_travelers_form_citizenship_hint => 'Не выбрано';

  @override
  String get select_travelers_form_birthdate_label => 'Дата рождения';

  @override
  String get select_travelers_form_birthdate_hint => 'ДД.ММ.ГГГГ';

  @override
  String get select_travelers_form_phone_label => 'Контактный телефон';

  @override
  String get select_travelers_form_email_label => 'Адрес электронной почты';

  @override
  String get select_travelers_form_email_hint => 'example@example.com';

  @override
  String get select_travelers_form_delete => 'Удалить';

  @override
  String select_travelers_passenger_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '2': 'второго',
      '3': 'третьего',
      '4': 'четвёртого',
      '5': 'пятого',
      '6': 'шестого',
      '7': 'седьмого',
      '8': 'восьмого',
      '9': 'девятого',
      '10': 'десятого',
      'other': '$index-го  пассажира',
    });
    return 'Данные $_temp0';
  }

  @override
  String get select_travelers_first_companion_header => 'Данные сопровождающего';

  @override
  String get select_travelers_first_companion_subtitle =>
      'Данные указываются строго латинскими буквами, как в паспорте';

  @override
  String select_travelers_companion_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '1': 'первого',
      '2': 'второго',
      '3': 'третьего',
      '4': 'четвёртого',
      '5': 'пятого',
      '6': 'шестого',
      '7': 'седьмого',
      '8': 'восьмого',
      '9': 'девятого',
      '10': 'десятого',
      'other': '$index-го  сопровождающего',
    });
    return 'Данные $_temp0';
  }

  @override
  String get select_travelers_confirm_email_title => 'Подтвердите почту';

  @override
  String get select_travelers_confirm_email_create_account_message =>
      'Подтвердите почту, чтобы завершить создание аккаунта и получить детали бронирования.';

  @override
  String get select_travelers_confirm_email_guest_message =>
      'Вы можете оформить заказ без регистрации, но нам нужно подтвердить вашу почту. Это необходимо, чтобы отправить подтверждение и детали услуги.';

  @override
  String get select_travelers_confirm_email_continue_button => 'Продолжить';

  @override
  String get ordering_contact_person_minimum_age_error =>
      'Контактное лицо должно быть не младше 12 лет.';

  @override
  String get transfers_tariffs_car_categories_title => 'Категории автомобиля';

  @override
  String get lounge_tariffs_car_categories_title => 'VIP-залы';

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
  String get send_code_terms_agreement => 'Вы соглашаетесь с нашими ';

  @override
  String get tariffs_title => 'Тарифы';

  @override
  String get edit_traveler_name_hint =>
      'Укажите имя в точности, как оно написано в паспорте или другом официальном документе';

  @override
  String get payment_screen_title => 'Выберите способ оплаты';

  @override
  String get payment_methods_card => 'Банковской картой';

  @override
  String get payment_methods_apple_google_pay => 'Apple Pay / Google Pay';

  @override
  String get payment_methods_soon => '(скоро)';

  @override
  String get payment_bonus_points_auth_hint => 'Доступно после входа/создания аккаунта';

  @override
  String get payment_bonus_points_use => 'Использовать баллы';

  @override
  String payment_bonus_points_available(String available) {
    return 'Доступно $available';
  }

  @override
  String get payment_bonus_points_use_all => 'Использовать все';

  @override
  String get payment_total_title => 'Итоговая стоимость:';

  @override
  String get payment_total_bonus_prefix => 'После оплаты вы получите';

  @override
  String payment_total_bonus_points(String points) {
    return '+$points баллов';
  }

  @override
  String get payment_total_bonus_suffix => 'Они автоматически появятся на вашем счёте';

  @override
  String get payment_terms_prefix => 'Продолжая я соглашаюсь с ';

  @override
  String get payment_terms_link => 'Условиями использования';

  @override
  String get payment_terms_and => ' и ';

  @override
  String get payment_privacy_link => 'Политикой конфиденциальности';

  @override
  String get payment_pay_button => 'Оплатить';

  @override
  String get payment_free_checkout_screen_title => 'Оформление заявки';

  @override
  String get payment_free_checkout_payment_manual_hint =>
      'Стоимость трансфера рассчитывается менеджером вручную. После отправки заявки мы свяжемся с вами в течение часа, чтобы уточнить детали и согласовать стоимость. Пожалуйста, дождитесь звонка.\n\nПосле согласования стоимости вы сможете оплатить услугу в личном кабинете — во вкладке «Мои путешествия» → «Бронирования».';

  @override
  String get payment_free_checkout_submit_button => 'Отправить заявку';

  @override
  String get summary_screen_title => 'Сводка';

  @override
  String get summary_flight_info_title => 'Информация о рейсе';

  @override
  String get summary_services_not_required => 'Услуги в этом аэропорту не требуются';

  @override
  String get summary_transfer_price_not_included =>
      'Стоимость трансфера не включена. Менеджер свяжется с вами для уточнения цены.';

  @override
  String get summary_transfer_route_title => 'Маршрут трансфера';

  @override
  String get summary_transfer_pickup_address_label => 'Адрес отправления:';

  @override
  String get summary_transfer_stop_label => 'Остановка:';

  @override
  String get summary_transfer_dropoff_address_label => 'Адрес назначения:';

  @override
  String get summary_transfer_car_category_label => 'Категория автомобиля:';

  @override
  String get summary_transfer_car_standard => 'Стандарт';

  @override
  String get summary_additional_conditions_title => 'Дополнительные условия';

  @override
  String get summary_travelers_title => 'Путешественники';

  @override
  String get summary_companions_title => 'Сопровождающие';

  @override
  String get summary_agreements_title => 'Согласие';

  @override
  String get summary_agreement_data_correctness => 'Я подтверждаю корректность данных';

  @override
  String get summary_agreement_terms_of_use =>
      'Я согласен(на), с политикой конфиденциальности и условиями использования';

  @override
  String get summary_submit_button => 'К оплате';

  @override
  String get summary_total_label => 'ИТОГО:';

  @override
  String summary_terminal_label(String name) {
    return 'Терминал $name';
  }

  @override
  String summary_flight_number_label(String number) {
    return 'Рейс: $number';
  }

  @override
  String get order_status_paid => 'Оплачен';

  @override
  String get order_status_waiting_payment => 'Ждёт оплату';

  @override
  String get order_status_draft => 'Черновик';

  @override
  String get order_status_processing => 'Обработка';

  @override
  String order_ref_number(String ref) {
    return 'Номер заказа: $ref';
  }

  @override
  String get my_trips_tab_drafts => 'Черновики';

  @override
  String get my_trips_tab_upcoming => 'Предстоящие';

  @override
  String get my_trips_tab_completed => 'Завершённые';

  @override
  String get my_trips_tab_cancelled => 'Отменённые';

  @override
  String order_details_id_label(String id) {
    return 'Заказ #$id';
  }

  @override
  String get my_trips_not_auth_title => 'Ваши путешествия — здесь';

  @override
  String get my_trips_not_auth_subtitle =>
      'Войдите в аккаунт, чтобы сохранить и просматривать свои поездки';

  @override
  String get my_trips_empty_state_title => 'У вас пока нет бронирований';

  @override
  String get my_trips_empty_state_subtitle => 'Оформите первую услугу и все поездки появятся здесь';

  @override
  String get my_trips_empty_state_find_booking_button => 'Не могу найти бронирование';

  @override
  String get my_trips_empty_state_select_airport_button => 'Перейти к выбору аэропорта';

  @override
  String get my_trips_empty_state_book_service_button => 'Забронировать услугу';

  @override
  String order_flight_number_label(String number) {
    return 'Рейс: $number';
  }

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
  String get order_details_my_order_title => 'Мой заказ';

  @override
  String get order_details_booking_number => 'Номер бронирования';

  @override
  String get order_details_flight_info => 'Информация о рейсе';

  @override
  String get order_details_show_to_employee => 'Показать сотруднику';

  @override
  String get order_details_download_receipt => 'Скачать квитанцию';

  @override
  String get order_details_what_next => 'Что дальше?';

  @override
  String get order_details_price_details => 'Детали цены';

  @override
  String get order_details_additional_conditions => 'Дополнительные условия';

  @override
  String get order_details_travelers_companions => 'Путешественники/Сопровождающие';

  @override
  String get order_details_our_recommendations => 'Наши рекомендации';

  @override
  String get order_details_add_to_calendar => 'Добавить в календарь';

  @override
  String get order_details_support_text =>
      'Если вам нужно внести изменения, пожалуйста, обратитесь в поддержку';

  @override
  String get order_details_cancel_order => 'Отменить заявку';

  @override
  String get order_details_order_new_service => 'Заказать новую услугу';

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
  String get order_status_requires_surcharge => 'Требует доплаты';

  @override
  String get order_details_whats_next_text =>
      'Мы позаботимся о том, чтобы ваш путь прошёл спокойно и без лишних вопросов.\n\n1. Сохраните QR-код/номер бронирования, он нужен, чтобы быстро идентифицировать вас\n  • Он нужен, чтобы сотрудник Example App быстро идентифицировал вас\n  • Вы сможете открыть его в любой момент в разделе Мои поездки\n\n2. Ожидайте сообщение от нас\n  • Мы заранее пришлём напоминание с временем, терминалом и точкой встречи\n  • Если понадобится дополнительная информация — менеджер свяжется с вами лично\n\n3. Как найти сотрудника в день поездки\n  • Приходите в указанное место встречи: стойка Fast Track, VIP-вход или зона прилёта\n  • Сотрудник будет ждать вас\n  • Если вдруг вы не видите его сразу — просто ответьте на уведомление или позвоните по номеру из письма, мы всегда на связи.\n\n4. Что иметь при себе\n  • Паспорт\n  • QR-код\n\nИ обязательно не переживайте, в аэропорту вы не останетесь одни — мы всегда на связи!';

  @override
  String get order_details_our_recommendations_text =>
      '• Прибывайте заранее\nДля международных рейсов рекомендуем приезжать за 2–2,5 часа, для внутренних — за 1,5 часа, чтобы комфортно пройти все этапы с Fast Track или сопровождением.\n\n• Где находится стойка услуги\nСтойка Fast Track / Meet & Assist расположена в зоне вылета, рядом с контролем безопасности. Следуйте указателям \"Fast Track / Priority\" или покажите свой код сотруднику у входа.\n\n• Как добраться до регистрации\nОт входа до стойки регистрации — примерно 3–7 минут ходьбы. Если вы забронировали сопровождение, сотрудник встретит вас у входа или в согласованной точке и проведёт весь путь за вас.\n\n• Сколько времени занимает прохождение\nС Fast Track время прохождения формальностей обычно составляет от 5 до 15 минут, в зависимости от загруженности терминала.\n\n• Если вы путешествуете с багажом\nАгент поможет перенести багаж и проведёт к приоритетной стойке регистрации, если она доступна в этом терминале.';

  @override
  String get transfer_input_title => 'Введите свои данные';

  @override
  String get transfer_input_description =>
      'Пожалуйста, укажите свои данные латинскими буквами, чтобы сотрудники смогли их понять';

  @override
  String get transfer_order_info_message =>
      'Трансфер можно оформить отдельно или вместе с другими сервисами аэропорта. Чтобы выбрать несколько услуг, включая трансфер, перейдите в основную форму здесь.';

  @override
  String get transfer_order_info_button => 'Оформить услуги аэропорта';

  @override
  String get transfer_trip_data_title => 'Данные поездки';

  @override
  String get transfer_date_label => 'Дата';

  @override
  String get transfer_time_label => 'Время';

  @override
  String get transfer_car_category_label => 'Категория автомобиля';

  @override
  String get transfer_trip_route_title => 'Маршрут поездки';

  @override
  String get transfer_departure_address_label => 'Адрес отправления';

  @override
  String get transfer_arrival_address_label => 'Адрес назначения';

  @override
  String get transfer_intermediate_point_label => 'Промежуточная точка';

  @override
  String get transfer_auth_choice_title => 'Сохранить бронирование в личном кабинете?';

  @override
  String get transfer_auth_choice_subtitle =>
      'Если у вас уже есть аккаунт — просто войдите.\nЕсли нет, мы можем создать аккаунт и сохранить бронирование в «Моих путешествиях»';

  @override
  String get transfer_auth_choice_login_button => 'Войти в аккаунт';

  @override
  String get transfer_auth_choice_create_account_label => 'Создать аккаунт и сохранить бронь';

  @override
  String get transfer_auth_choice_create_account_hint =>
      'Мы отправим код на почту. После подтверждения все данные сохранятся.';

  @override
  String get transfer_auth_choice_without_auth_label => 'Продолжить без регистрации';

  @override
  String get transfer_auth_choice_without_auth_hint =>
      'Бронирование не появится в «Моих путешествиях».\nДля управления заказом потребуется код бронирования — сохраните его.';

  @override
  String get transfer_auth_choice_continue_button => 'Продолжить';

  @override
  String get transfer_select_travelers_title => 'Данные пассажира';

  @override
  String get transfer_select_travelers_subtitle =>
      'Данные указываются строго латинскими буквами, как в паспорте';

  @override
  String get transfer_select_travelers_passengers_title => 'Мои данные';

  @override
  String get transfer_select_travelers_i_am_traveling => 'Я поеду';

  @override
  String get transfer_select_travelers_adults => 'Взрослые';

  @override
  String get transfer_select_travelers_children => 'Дети (2–12 лет)';

  @override
  String get transfer_select_travelers_infants => 'Дети (до 2 лет)';

  @override
  String get transfer_select_travelers_prm => 'Есть пассажир с ограниченной мобильностью (PRM)';

  @override
  String get transfer_select_travelers_add_passenger => 'Добавить пассажира';

  @override
  String get transfer_select_travelers_add_companion => 'Добавить сопровождающего';

  @override
  String get transfer_select_travelers_form_select_from_list => 'Выбрать из своего списка';

  @override
  String transfer_select_travelers_form_traveler_label(Object id) {
    return 'Путешественник #$id';
  }

  @override
  String get transfer_select_travelers_form_first_name_label => 'Имя';

  @override
  String get transfer_select_travelers_form_first_name_hint => 'Имя (латиницей, например, Ivan)';

  @override
  String get transfer_select_travelers_form_last_name_label => 'Фамилия';

  @override
  String get transfer_select_travelers_form_last_name_hint =>
      'Фамилия (латиницей, например, Ivanov)';

  @override
  String get transfer_select_travelers_form_citizenship_label => 'Гражданство';

  @override
  String get transfer_select_travelers_form_citizenship_hint => 'Не выбрано';

  @override
  String get transfer_select_travelers_form_birthdate_label => 'Дата рождения';

  @override
  String get transfer_select_travelers_form_birthdate_hint => 'ДД.ММ.ГГГГ';

  @override
  String get transfer_select_travelers_form_phone_label => 'Контактный телефон';

  @override
  String get transfer_select_travelers_form_email_label => 'Адрес электронной почты';

  @override
  String get transfer_select_travelers_form_email_hint => 'example@example.com';

  @override
  String get transfer_select_travelers_form_delete => 'Удалить';

  @override
  String transfer_select_travelers_passenger_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '2': 'второго',
      '3': 'третьего',
      '4': 'четвёртого',
      '5': 'пятого',
      '6': 'шестого',
      '7': 'седьмого',
      '8': 'восьмого',
      '9': 'девятого',
      '10': 'десятого',
      'other': '$index-го  пассажира',
    });
    return 'Данные $_temp0';
  }

  @override
  String get transfer_select_travelers_first_companion_header => 'Данные сопровождающего';

  @override
  String get transfer_select_travelers_first_companion_subtitle =>
      'Данные указываются строго латинскими буквами, как в паспорте';

  @override
  String transfer_select_travelers_companion_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '1': 'первого',
      '2': 'второго',
      '3': 'третьего',
      '4': 'четвёртого',
      '5': 'пятого',
      '6': 'шестого',
      '7': 'седьмого',
      '8': 'восьмого',
      '9': 'девятого',
      '10': 'десятого',
      'other': '$index-го  сопровождающего',
    });
    return 'Данные $_temp0';
  }

  @override
  String get transfer_select_travelers_confirm_email_title => 'Подтвердите почту';

  @override
  String get transfer_select_travelers_confirm_email_create_account_message =>
      'Подтвердите почту, чтобы завершить создание аккаунта и получить детали бронирования.';

  @override
  String get transfer_select_travelers_confirm_email_guest_message =>
      'Вы можете оформить заказ без регистрации, но нам нужно подтвердить вашу почту. Это необходимо, чтобы отправить подтверждение и детали услуги.';

  @override
  String get transfer_select_travelers_confirm_email_continue_button => 'Продолжить';

  @override
  String get transfer_auth_code_title => 'Введите код';

  @override
  String get transfer_auth_code_sent_prefix => 'Мы отправили письмо с кодом подтверждения на ';

  @override
  String get transfer_auth_code_sent_suffix => '. Пожалуйста, введите его.';

  @override
  String get transfer_auth_code_resend_prefix => 'Вы сможете отправить код повторно через ';

  @override
  String get transfer_auth_code_resend_button => 'Отправить повторно';

  @override
  String get transfer_send_code_terms_agreement =>
      'Нажимая на кнопку «Продолжить», вы соглашаетесь с ';

  @override
  String get transfer_auth_terms_link => 'Условиями использования';

  @override
  String get transfer_auth_and => 'и';

  @override
  String get transfer_auth_privacy_link => 'Политикой конфиденциальности';

  @override
  String get transfer_auth_copyright => '© Example App 2024';

  @override
  String get transfer_auth_continue_button => 'Продолжить';

  @override
  String get transfer_checkout_screen_title => 'Оформление заявки';

  @override
  String get transfer_checkout_transfer_route_title => 'Маршрут трансфера';

  @override
  String get transfer_checkout_transfer_pickup_address_label => 'Адрес подачи';

  @override
  String get transfer_checkout_transfer_dropoff_address_label => 'Адрес назначения';

  @override
  String get transfer_checkout_transfer_stop_label => 'Остановка';

  @override
  String get transfer_checkout_transfer_car_category_label => 'Класс автомобиля';

  @override
  String get transfer_checkout_transfer_car_standard => 'Стандарт';

  @override
  String get transfer_checkout_total_label => 'Итого';

  @override
  String get transfer_checkout_additional_conditions_title => 'Дополнительные условия';

  @override
  String get transfer_checkout_travelers_title => 'Данные о пассажирах';

  @override
  String get transfer_checkout_companions_title => 'Данные о сопровождающих';

  @override
  String get transfer_checkout_agreements_title => 'Соглашения';

  @override
  String get transfer_checkout_agreement_data_correctness => 'Я подтверждаю корректность данных';

  @override
  String get transfer_checkout_agreement_terms_of_use =>
      'Я согласен(на), с политикой конфиденциальности и условиями использования';

  @override
  String get transfer_checkout_submit_button => 'Отправить заявку';

  @override
  String get transfer_checkout_payment_manual_hint =>
      'Стоимость трансфера рассчитывается менеджером вручную. После отправки заявки мы свяжемся с вами в течение часа, чтобы уточнить детали и согласовать стоимость. Пожалуйста, дождитесь звонка.\n\nПосле согласования стоимости вы сможете оплатить услугу в личном кабинете — во вкладке «Мои путешествия» → «Бронирования».';

  @override
  String get transfer_auth_invalid_code_error => 'Неверный код';

  @override
  String get payment_success_dialog_title => 'Оплата прошла успешно';

  @override
  String get payment_success_dialog_message => 'Не забудьте сохранить идентификатор бронирования';

  @override
  String get payment_success_dialog_button => 'Окей';

  @override
  String get transfer_checkout_success_dialog_title => 'Заявка принята';

  @override
  String get transfer_checkout_success_dialog_message =>
      'Спасибо! Мы получили ваш запрос на трансфер. В ближайшее время менеджер свяжется с вами, чтобы уточнить детали и подтвердить поездку.';

  @override
  String get transfer_checkout_success_dialog_button => 'Окей';

  @override
  String get support_help_screen => 'Помощь';

  @override
  String get support_chat => 'Чат поддержки';

  @override
  String get support_assistent => 'Ассистент';

  @override
  String get support_faq => 'FAQ';

  @override
  String get support_tickets => 'Обращения';

  @override
  String get support_new_ticket => 'Новое обращение';

  @override
  String get support_cancel_booking => 'Отменить бронирование';

  @override
  String get support_booking_number => 'Номер бронирования';

  @override
  String get support_not_booking_number => 'Нет номера бронирования';

  @override
  String get support_suggestions_question_label => 'О чем хотите спросить?';

  @override
  String get support_input_hint => 'Введите текст...';

  @override
  String get support_bot_request_ref_number => 'Пожалуйста, укажите номер бронирования';

  @override
  String get support_bot_ticket_created =>
      'Спасибо за обращение! Наш специалист уже рассматривает ваш запрос.';

  @override
  String get support_bot_chat_end =>
      'Чат завершён, если проблема не решена, пожалуйста, откройте новое обращение';

  @override
  String get support_bot_no_ref_fallback =>
      'Напишите, что произошло. Мы подключаем специалиста и скоро ответим вам!';

  @override
  String get support_category_fast_track => 'Fast Track';

  @override
  String get support_category_vip_lounge => 'VIP-зал';

  @override
  String get support_category_transfer => 'Transfer';

  @override
  String get support_category_meet_assist => 'Meet & Assist';

  @override
  String get support_category_other => 'Другое';

  @override
  String get transactions_screen_title => 'Транзакции';

  @override
  String get transactions_tab_all => 'Все';

  @override
  String get transactions_tab_payments => 'Платежи';

  @override
  String get transactions_tab_refunds => 'Возвраты';

  @override
  String get transactions_tab_bonuses => 'Бонусы';

  @override
  String get transactions_all_empty_state =>
      'История пока пуста.\nЗдесь будут отображаться ваши оплаты, возвраты и начисления бонусных баллов после первой транзакции.';

  @override
  String get transactions_payments_empty_state =>
      'История пока пуста.\nЗдесь будут отображаться ваши оплаты после первой транзакции.';

  @override
  String get transactions_refunds_empty_state =>
      'История пока пуста.\nЗдесь будут отображаться ваши возвраты.';

  @override
  String get transactions_bonuses_empty_state =>
      'История пока пуста.\nЗдесь будут отображаться начисления бонусных баллов.';

  @override
  String get transaction_card_details_button => 'Подробнее';

  @override
  String get transaction_card_parameter_accrued_bonuses => 'Начислено бонусов';

  @override
  String get transaction_card_parameter_order => 'Заказ:';

  @override
  String get transaction_card_parameter_date => 'Дата:';

  @override
  String get transaction_card_parameter_amount => 'Сумма:';

  @override
  String get transaction_status_success => 'Успешно';

  @override
  String get transaction_status_refunded => 'Возвращено';

  @override
  String get transaction_status_accrued => 'Начислено';

  @override
  String get transaction_status_pending => 'В процессе';

  @override
  String get transaction_status_failed => 'Ошибка';

  @override
  String get transaction_status_unknown => 'Неизвестно';

  @override
  String get receipt_title => 'Квитанция об операции';

  @override
  String get receipt_transaction_id => 'ID транзакции';

  @override
  String get receipt_date => 'Дата и время';

  @override
  String get receipt_amount => 'Сумма';

  @override
  String get receipt_status => 'Статус';

  @override
  String get receipt_payment_method => 'Способ оплаты';

  @override
  String get receipt_payer => 'Плательщик';

  @override
  String get receipt_merchant => 'Мерчант';

  @override
  String get receipt_merchant_name => 'Example App';

  @override
  String get receipt_merchant_address => 'г. Москва, ул. Арбат, д. 1';

  @override
  String get receipt_transaction_type => 'Тип транзакции';

  @override
  String get receipt_transaction_type_deposit => 'Пополнение';

  @override
  String get receipt_transaction_type_adjustment => 'Корректировка';

  @override
  String get receipt_payment_method_manual => 'Вручную';

  @override
  String get receipt_external_id => 'Внешний ID';

  @override
  String get receipt_order_number => 'Номер заказа';

  @override
  String get receipt_description => 'Описание';

  @override
  String get receipt_loading_title => 'Формирование квитанции';

  @override
  String get receipt_loading_comment => 'Пожалуйста, подождите, мы готовим документ...';

  @override
  String get receipt_footer_text =>
      'Квитанция сформирована автоматически в приложении Example App.\nЭто официальный документ, подтверждающий совершение транзакции.';

  @override
  String privacy_update_date(String date) {
    return 'Обновлено: $date года';
  }

  @override
  String get loyalty_title => 'Программа лояльности';

  @override
  String loyalty_bonus_badge(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: 'Ваши бонусы: $points балла',
      many: 'Ваши бонусы: $points баллов',
      few: 'Ваши бонусы: $points балла',
      one: 'Ваши бонусы: $points балл',
      zero: 'Ваши бонусы: 0 баллов',
    );
    return '$_temp0';
  }

  @override
  String get loyalty_bonus_description =>
      'Каждая оплаченная услуга приближает вас к следующему уровню программы. Чем выше статус, тем больше баллов возвращается на ваш счёт.';

  @override
  String get loyalty_bonus_details_link => 'Подробнее о бонусных баллах';

  @override
  String get loyalty_current_level_title => 'Вы на базовом уровне';

  @override
  String loyalty_current_level_cashback(String percents) {
    return '$percents% баллами с каждой покупки';
  }

  @override
  String loyalty_points_to_next_level(int points) {
    return 'До следующего уровня вам не хватает $points баллов';
  }

  @override
  String get loyalty_about_levels_title => 'Экономьте на будущих поездках';

  @override
  String get loyalty_about_levels_card_1_title => 'Переходите на новый уровень быстрее';

  @override
  String get loyalty_about_levels_card_1_description =>
      'Мы учитываем каждое ваше бронирование — и повышать статус становится легко';

  @override
  String get loyalty_about_levels_card_2_title => 'Всегда получаете больше';

  @override
  String get loyalty_about_levels_card_2_description =>
      'Чем выше ваш уровень, тем больше баллов возвращается на счёт при каждой поездке';

  @override
  String get loyalty_about_levels_card_3_title => 'Оплачивайте поездки выгоднее';

  @override
  String get loyalty_about_levels_card_3_description =>
      'Используйте накопленные баллы, чтобы платить меньше уже в следующем аэропорту';

  @override
  String get loyalty_bonus_description_new =>
      'При каждой оплате услуг вы получаете бонусные баллы. Их количество зависит от вашего статуса.\nСтатус определяется суммарной стоимостью оплаченных услуг и закрепляется навсегда.';

  @override
  String loyalty_current_level_description(Object nextLevel, Object points) {
    return 'До следующего уровня вам не хватает $points баллов, и тогда скидки и вознаграждения уровня $nextLevel станут вашими.\nУчитываются все бронирования!';
  }

  @override
  String loyalty_progress_caption(Object percent) {
    return '$percent% до следующего уровня. Прогресс считается автоматически по вашим бронированиям';
  }

  @override
  String get loyalty_level_at_registration => 'Начисляется при регистрации в сервисе';

  @override
  String loyalty_level_accrued_from(String amount) {
    return 'Начисляется при заказе от $amount';
  }

  @override
  String get loyalty_conditions_link => 'Условия программы';

  @override
  String get loyalty_not_auth_message =>
      'Войдите в аккаунт, чтобы накапливать баллы и участвовать в программе лояльности';

  @override
  String get loyalty_login_button => 'Войти';

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
  String loyalty_current_level_user(String levelName) {
    return 'Вы на уровне $levelName!';
  }

  @override
  String get loyalty_level_status_1 => 'это базовый уровень';

  @override
  String get loyalty_level_status_2 => 'второй уровень';

  @override
  String get loyalty_level_status_3 => 'третий уровень';

  @override
  String get loyalty_level_status_4 => 'четвертый уровень';

  @override
  String get loyalty_level_status_5 => 'пятый уровень';

  @override
  String get loyalty_level_status_6 => 'шестой уровень';

  @override
  String loyalty_level_status_other(int rank) {
    return '$rank-й уровень';
  }

  @override
  String loyalty_level_cashback_percent(String percents) {
    return '$percents%';
  }

  @override
  String get loyalty_level_cashback_suffix => ' баллами с каждой покупки';

  @override
  String get loyalty_level_threshold_base => 'Базовый уровень';

  @override
  String loyalty_level_threshold_from_amount(String amount) {
    return 'При сумме от $amount';
  }

  @override
  String get loyalty_level_privilege_1_1 => 'Накопление баллов';

  @override
  String get loyalty_level_privilege_1_2 => 'Базовая поддержка';

  @override
  String get loyalty_level_privilege_1_3 => 'Доступ к акциям';

  @override
  String get loyalty_level_privilege_2_1 => 'Приоритетная поддержка';

  @override
  String get loyalty_level_privilege_2_2 => 'Ранний доступ к скидкам';

  @override
  String get loyalty_level_privilege_2_3 => 'Бонус на день рождения';

  @override
  String get loyalty_level_privilege_3_1 => 'Персональный менеджер';

  @override
  String get loyalty_level_privilege_3_2 => 'Бесплатный апгрейд';

  @override
  String get loyalty_level_privilege_3_3 => 'Эксклюзивные предложения';

  @override
  String get loyalty_level_privilege_4_1 => 'Консьерж-сервис 24/7';

  @override
  String get loyalty_level_privilege_4_2 => 'Бесплатные услуги';

  @override
  String get loyalty_level_privilege_4_3 => 'VIP-события';

  @override
  String get loyalty_status_metric_current_level => 'Текущий уровень';

  @override
  String get loyalty_status_metric_cashback => 'Возврат с покупок';

  @override
  String get loyalty_bonus_accrual_history => 'История начислений';

  @override
  String loyalty_progress_next_level_points(String nextLevelName, String pointsText) {
    return '$nextLevelName · $pointsText';
  }

  @override
  String loyalty_current_level_user_greeting(String userName, String levelName) {
    return '$userName, вы на уровне $levelName!';
  }

  @override
  String article_update_date(String date) {
    return 'Обновлено: $date';
  }

  @override
  String get article_read_full => 'Читать полностью';

  @override
  String get article_help_instruction_travelers => 'Помощь и инструкции для путешественников';

  @override
  String get article_go_to_service => 'Перейти к услугам';

  @override
  String get article_select => 'Выбор статьи';

  @override
  String get article_share => 'Поделиться статьей';

  @override
  String get article_book_service => 'Забронировать услуги';

  @override
  String get article_search_title => 'Поиск статьи';

  @override
  String get notifications_title => 'Мои уведомления';

  @override
  String get notifications_text_empty =>
      'Уведомлений пока нет. \nЗдесь будут отображаться важные сообщения о ваших бронированиях, оплатах и изменениях услуг. Как только появится активность — мы сразу сообщим.';

  @override
  String get notifications_toggle_title => 'Рассылки';

  @override
  String get notifications_turn_on => 'Включить уведомления';

  @override
  String get notifications_turn_off => 'Выключить уведомления';

  @override
  String get notifications_book_service => 'Забронировать услуги';

  @override
  String get notifications_new => 'Новые';

  @override
  String get notifications_no_new => 'Новых уведомлений нет';

  @override
  String get notifications_read => 'Прочитанные';

  @override
  String get notifications_read_all => 'Прочитать все';

  @override
  String get notifications_detail => 'Подробнее';

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
  String receipt_header_id(String id) {
    return 'ID: $id';
  }

  @override
  String get my_trips_delete_draft_dialog_title => 'Удалить черновик?';

  @override
  String get my_trips_delete_draft_dialog_message => 'Черновик заказа будет удален безвозвратно.';

  @override
  String get my_trips_draft_continue_ordering => 'Продолжить оформление';

  @override
  String calendar_event_flight_title(String flightNumber) {
    return 'Рейс $flightNumber';
  }

  @override
  String calendar_event_flight_description(String airline, String departure, String arrival) {
    return 'Полет с $airline ($departure → $arrival)';
  }

  @override
  String get cancellation_screen_title => 'Отмена бронирования';

  @override
  String get cancellation_search_subtitle =>
      'Введите данные бронирования, чтобы проверить возможность отмены';

  @override
  String get cancellation_email_at_checkout_label => 'Электронная почта при оформлении';

  @override
  String get cancellation_email_short_hint => 'Электронная почта';

  @override
  String get cancellation_find_booking_button => 'Найти бронирование';

  @override
  String get cancellation_field_required_error => 'Обязательно для ввода';

  @override
  String get cancellation_order_not_found_title => 'Бронирование не найдено';

  @override
  String get cancellation_order_not_found_write_support => 'Написать в поддержку';

  @override
  String get cancellation_order_not_found_body =>
      'Проверьте номер бронирования и адрес электронной почты. Если проблема сохраняется, свяжитесь со службой поддержки';

  @override
  String cancellation_order_not_found_details(String orderNumber, String email) {
    return 'Номер бронирования:\n$orderNumber\n\nЭлектронная почта:\n$email';
  }

  @override
  String get cancellation_cancelled_title => 'Бронирование отменено';

  @override
  String get cancellation_cancelled_message =>
      'Информация об отмене и возврате появится в разделе «Мои путешествия».\n\nПодтверждение также отправлено на вашу электронную почту.';

  @override
  String get cancellation_auth_manage_bookings_title => 'Хотите управлять бронированиями удобнее?';

  @override
  String get cancellation_auth_skip => 'Пропустить';

  @override
  String get cancellation_auth_invite_body =>
      'Создайте или войдите в аккаунт, чтобы видеть все поездки, статусы и уведомления в одном месте';

  @override
  String get cancellation_confirm_title => 'Вы уверены, что хотите отменить бронирование?';

  @override
  String get cancellation_confirm_message => 'Это действие нельзя будет отменить';

  @override
  String get cancellation_confirm_primary => 'Подтверждаю';

  @override
  String get core_order_number_copied_to_clipboard => 'Номер заказа скопирован в буфер обмена';

  @override
  String get cancellation_status_available => 'Отмена доступна';

  @override
  String get cancellation_status_unavailable => 'Отмена недоступна';

  @override
  String get cancellation_available_hint =>
      'Вы можете отменить бронирование и получить возврат средств.';

  @override
  String get cancellation_unavailable_hint =>
      'Срок бесплатной отмены истёк, поэтому отменить заказ нельзя. Возврат средств не предусмотрен. Подробнее — в правилах ниже.';

  @override
  String get cancellation_support_hint =>
      'Если вам нужно внести изменения, пожалуйста, обратитесь в поддержку, не отменяйте заказ';

  @override
  String get order_status_cancelled => 'Отменён';

  @override
  String get order_refund_status_processing => 'Ожидается возврат средств';

  @override
  String get order_refund_status_refunded => 'Средства возвращены';

  @override
  String get order_refund_status_error => 'Ошибка возврата средств';

  @override
  String get order_status_payment_error => 'Ошибка оплаты';

  @override
  String get order_status_cancel_requested => 'Отмена';

  @override
  String get order_status_waiting_processing => 'В очереди';

  @override
  String get order_status_waiting_partner => 'У партнёра';

  @override
  String get order_status_partner_confirmed => 'Подтверждён';

  @override
  String get order_status_in_progress => 'Выполняется';

  @override
  String get order_status_pending_pre_flight => 'До вылета';

  @override
  String get order_status_in_flight => 'В полёте';

  @override
  String get order_status_pending_post_flight => 'После';

  @override
  String get order_status_completed => 'Завершён';

  @override
  String get order_status_partner_rejected => 'Отклонён';

  @override
  String get order_status_refund_error => 'Сбой возврата';

  @override
  String get order_status_refund_processing => 'Возврат';

  @override
  String get order_status_refunded => 'Возвращён';

  @override
  String get search_services_initial_title => 'Начните вводить аэропорт или рейс';

  @override
  String get search_services_initial_subtitle =>
      'Найдите аэропорт по названию или городу, либо введите номер рейса для оформления услуг в аэропорту прилета или вылета';

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
  String get private_jet_charter_title => 'Чартер частного самолёта';

  @override
  String get private_jet_charter_subtitle =>
      'Летайте по своему расписанию. Без очередей, задержек и компромиссов. Доступ к 5000+ бортам по всему миру.';

  @override
  String get main_search_private_jet_departure_title => 'Откуда';

  @override
  String get main_search_private_jet_departure_hint => 'Откуда (город или аэропорт)';

  @override
  String get main_search_private_jet_arrival_title => 'Куда';

  @override
  String get main_search_private_jet_arrival_hint => 'Куда (город или аэропорт)';

  @override
  String get main_search_private_jet_date_title => 'Дата';

  @override
  String get main_search_private_jet_date_hint => 'Дата';

  @override
  String get main_search_private_jet_date_picker_title => 'Выбор даты';

  @override
  String get main_search_private_jet_passengers_title => 'Пассажиры';

  @override
  String get main_search_private_jet_passengers_hint => 'Пассажиры';

  @override
  String get main_search_private_jet_passengers_more_than_20 => '> 20 пассажиров';

  @override
  String get private_jet_benefit_fleet_title => '5000+ бортов';

  @override
  String get private_jet_benefit_fleet_subtitle =>
      'Доступ к крупнейшему в мире парку частных самолётов';

  @override
  String get private_jet_benefit_booking_title => 'За 2 часа';

  @override
  String get private_jet_benefit_booking_subtitle => 'Бронирование с уведомлением всего за 2 часа';

  @override
  String get private_jet_benefit_safety_title => 'Сертификация безопасности';

  @override
  String get private_jet_benefit_safety_subtitle =>
      'Все борта соответствуют стандартам ARGUS/Wyvern';

  @override
  String get private_jet_benefit_destinations_title => 'Летайте куда угодно';

  @override
  String get private_jet_benefit_destinations_subtitle =>
      'Доступ к 40 000+ аэропортов по всему миру — даже к удалённым полосам';

  @override
  String get private_jet_popular_types_title => 'Популярные типы самолётов';

  @override
  String private_jet_passengers_up_to(int count) {
    return 'до $count чел.';
  }

  @override
  String get private_jet_price_from => 'От';

  @override
  String get private_jet_per_hour => '/ час';

  @override
  String get private_jet_concierge_title => 'Персональный консьерж 24/7';

  @override
  String get private_jet_concierge_description =>
      'Не хотите заполнять формы? Мы всё понимаем. Наша команда консьержей доступна круглосуточно: подберём борт, организуем трансфер, кейтеринг и изменения в последний момент.';

  @override
  String get private_jet_concierge_feature_fast_reply => 'Быстрый ответ — в среднем менее 2 минут';

  @override
  String get private_jet_concierge_feature_multilingual =>
      'Мультиязычная команда — английский, арабский, русский, французский';

  @override
  String get private_jet_concierge_feature_full_service =>
      'Полный сервис — перелёты, отели, трансферы, мероприятия';

  @override
  String get private_jet_concierge_feature_personal_manager => 'Персональный менеджер на весь трип';

  @override
  String get private_jet_concierge_whatsapp_button => 'Написать в WhatsApp';

  @override
  String get private_jet_concierge_online_status => 'НА СВЯЗИ СЕЙЧАС';

  @override
  String get private_jet_details_range_label => 'Дальность';

  @override
  String get private_jet_details_speed_label => 'Скорость';

  @override
  String get private_jet_details_baggage_label => 'Багаж';

  @override
  String get private_jet_details_cabin_dimensions_title => 'Размеры салона';

  @override
  String get private_jet_details_cabin_height_label => 'Высота';

  @override
  String get private_jet_details_cabin_width_label => 'Ширина';

  @override
  String get private_jet_details_cabin_length_label => 'Длина';

  @override
  String get private_jet_details_send_request_button => 'Отправить заявку';

  @override
  String get private_jet_details_call_button => 'Позвонить';

  @override
  String get private_jet_ordering_placeholder => 'Оформление заявки на частный джет — в разработке';

  @override
  String units_km(int value) {
    return '$value км';
  }

  @override
  String units_kmh(int value) {
    return '$value км/ч';
  }

  @override
  String units_kg(int value) {
    return '$value кг';
  }
}

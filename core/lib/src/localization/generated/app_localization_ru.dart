// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationRu extends AppLocalization {
  AppLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get citizenship_search_placeholder => 'Поиск по названию страны';

  @override
  String get core_back_button => 'Назад';

  @override
  String get description_validator_overflow_message =>
      'Длина описания не должна превышать 300 символов';

  @override
  String get email_validator_invalid_message => 'Некорректный формат email';

  @override
  String get email_validator_overflow_message => 'Email не должен превышать 50 символов';

  @override
  String get expandable_text_expand_label => 'больше';

  @override
  String get expandable_text_fold_label => 'свернуть';

  @override
  String get name_validator_empty_message => 'Не может быть пустым';

  @override
  String get name_validator_invalid_message => 'Некорректный формат имени';

  @override
  String get name_validator_overflow_message => 'Имя не должно превышать 30 символов';

  @override
  String get peer_client_devices_title => 'Найденные устройства';

  @override
  String get peer_client_error_connection => 'Ошибка подключения';

  @override
  String get peer_client_error_discovery => 'Ошибка запуска поиска';

  @override
  String get peer_client_invitation_rejected_body => 'Соперник отклонил приглашение';

  @override
  String get peer_client_invitation_rejected_button => 'Жаль...';

  @override
  String get peer_client_invitation_rejected_title => 'Приглашение отклонено';

  @override
  String get peer_client_invitation_sent_title => 'Приглашение отправлено';

  @override
  String get peer_client_invite_button => 'Пригласить';

  @override
  String get peer_client_loading => 'Загрузка...';

  @override
  String get peer_client_our_app_badge => 'Приложение tete games';

  @override
  String get peer_client_searching => 'Поиск...';

  @override
  String get peer_client_unknown_device => 'Неизвестное устройство';

  @override
  String get peer_client_wait_confirmation => 'Ждите подтверждения';

  @override
  String get peer_peer_card_connection_request => 'запрос подключения';

  @override
  String get peer_peer_card_request_sent => 'запрос отправлен...';

  @override
  String get peer_peer_card_waiting_invitation => 'ожидает приглашения';

  @override
  String get peer_client_waiting_hosts_title => 'Ждут приглашения:';

  @override
  String get peer_dialog_cancel => 'Отмена';

  @override
  String get peer_dialog_ok => 'Ок';

  @override
  String get peer_dialog_open_settings => 'В настройки';

  @override
  String get peer_dialog_error_title => 'Ошибка';

  @override
  String get peer_error_bluetooth_unavailable => 'Bluetooth выключен или недоступен';

  @override
  String get peer_disconnect_peer_left => 'Соперник покинул игру';

  @override
  String get peer_disconnect_link_lost => 'Соединение потеряно';

  @override
  String get peer_disconnect_timeout => 'Нет ответа от соперника';

  @override
  String get peer_games_list_stub => 'Список игр скоро появится';

  @override
  String get peer_games_list_title => 'Игры';

  @override
  String get peer_home_mode_prompt => 'Выберите режим подключения';

  @override
  String get peer_home_retry_button => 'Повторить';

  @override
  String get peer_home_start_client_button => 'Найти и подключиться';

  @override
  String get peer_home_start_server_button => 'Ожидать присоединения';

  @override
  String get peer_home_menu_connect => 'Соединиться';

  @override
  String get peer_home_menu_disconnect => 'Отключиться';

  @override
  String get peer_home_menu_profile => 'Профиль';

  @override
  String get peer_home_bluetooth_permissions_ok => 'Разрешения Bluetooth выданы';

  @override
  String get peer_home_bluetooth_permissions_missing => 'Разрешения Bluetooth не выданы';

  @override
  String get peer_home_bluetooth_adapter_on => 'Bluetooth включён';

  @override
  String get peer_home_bluetooth_adapter_off => 'Bluetooth выключен';

  @override
  String get peer_home_bluetooth_permissions_granted_dialog_title =>
      'Tete Games разрешено использовать Bluetooth';

  @override
  String get peer_home_bluetooth_permissions_denied_dialog_title =>
      'Tete Games запрещено использовать Bluetooth';

  @override
  String get peer_home_bluetooth_permissions_denied_dialog_message =>
      'Чтобы играть, разрешите Tete Games использовать Bluetooth в системных настройках разрешений приложения.';

  @override
  String get peer_home_bluetooth_adapter_enabled_dialog_title => 'Bluetooth включён';

  @override
  String get peer_home_bluetooth_adapter_disabled_dialog_title => 'Bluetooth выключен';

  @override
  String get peer_home_bluetooth_adapter_disabled_dialog_message =>
      'Чтобы играть, включите Bluetooth в системной панели управления.';

  @override
  String get peer_home_drawer_edit_name => 'Редактировать имя';

  @override
  String get peer_home_drawer_disconnect_confirm_title => 'Разъединить';

  @override
  String get peer_home_drawer_disconnect_confirm_message => 'Вы точно хотите разорвать связь?';

  @override
  String get peer_dialog_yes => 'Да';

  @override
  String get peer_home_drawer_download => 'Как скачать';

  @override
  String get peer_home_drawer_download_hint =>
      'Отсканируйте QR-код, чтобы открыть страницу загрузки.';

  @override
  String peer_home_drawer_copyright(int year) {
    return '© $year Tete Games';
  }

  @override
  String peer_home_drawer_version(String version) {
    return 'Версия $version';
  }

  @override
  String get peer_home_title => 'Добро пожаловать в tete games';

  @override
  String get peer_nickname_dialog_title => 'Придумайте себе псевдоним';

  @override
  String get peer_nickname_field_hint => 'Введите псевдоним';

  @override
  String get peer_nickname_field_label => 'Псевдоним';

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
  String get peer_server_accept_button => 'Принять';

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
  String get peer_server_invitation_title => 'Получено приглашение';

  @override
  String get peer_server_reject_button => 'Отклонить';

  @override
  String get peer_server_waiting_body => 'Ваше устройство видимо для других устройств';

  @override
  String get peer_server_waiting_title => 'Ожидание подключения...';

  @override
  String get secret_mode_no => 'No';

  @override
  String get secret_mode_ok => 'OK';

  @override
  String get secret_mode_password_hint => 'Password';

  @override
  String get secret_mode_production_mode_title => 'Production mode';

  @override
  String get secret_mode_return_to_production_message => 'Return to production mode?';

  @override
  String get secret_mode_test_api_title => 'Test API';

  @override
  String get secret_mode_version_label => 'Version';

  @override
  String get secret_mode_wrong_password => 'Wrong password';

  @override
  String get secret_mode_yes => 'Yes';

  @override
  String get something_went_wrong => 'Что-то пошло не так';
}

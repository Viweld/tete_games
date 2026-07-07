// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get core_back_button => 'Back';

  @override
  String get peer_client_devices_title => 'Nearby devices';

  @override
  String get peer_client_error_connection => 'Failed to connect to the device';

  @override
  String get peer_client_error_discovery => 'Failed to start device discovery';

  @override
  String get peer_client_invitation_rejected_body => 'The host declined your invitation';

  @override
  String get peer_client_invitation_rejected_button => 'Close';

  @override
  String get peer_client_invitation_rejected_title => 'Invitation declined';

  @override
  String get peer_client_invitation_sent_title => 'Invitation sent';

  @override
  String get peer_client_invite_button => 'Invite';

  @override
  String get peer_client_loading => 'Loading...';

  @override
  String get peer_client_our_app_badge => 'tete games app';

  @override
  String get peer_client_searching => 'Searching...';

  @override
  String get peer_client_unknown_device => 'Unknown device';

  @override
  String get peer_client_wait_confirmation => 'Waiting for confirmation';

  @override
  String get peer_peer_card_connection_request => 'connection request';

  @override
  String get peer_peer_card_request_sent => 'request sent...';

  @override
  String get peer_peer_card_waiting_invitation => 'waiting for invitation';

  @override
  String get peer_client_waiting_hosts_title => 'Waiting for hosts:';

  @override
  String get peer_dialog_cancel => 'Cancel';

  @override
  String get peer_dialog_ok => 'OK';

  @override
  String get peer_dialog_open_settings => 'Open settings';

  @override
  String get peer_dialog_error_title => 'Error';

  @override
  String get peer_error_bluetooth_unavailable => 'Bluetooth is turned off or unavailable';

  @override
  String get peer_disconnect_peer_left => 'Opponent left the game';

  @override
  String get peer_disconnect_link_lost => 'Connection lost';

  @override
  String get peer_disconnect_timeout => 'No response from opponent';

  @override
  String get peer_games_list_stub => 'Games list coming soon';

  @override
  String get peer_games_list_title => 'Games';

  @override
  String get peer_home_mode_prompt => 'Choose a connection mode';

  @override
  String get peer_home_retry_button => 'Retry';

  @override
  String get peer_home_start_client_button => 'Find and connect';

  @override
  String get peer_home_start_server_button => 'Wait for a player';

  @override
  String get peer_home_menu_connect => 'Connect';

  @override
  String get peer_home_menu_disconnect => 'Disconnect';

  @override
  String get peer_home_menu_profile => 'Profile';

  @override
  String get peer_home_bluetooth_permissions_ok => 'Bluetooth permissions granted';

  @override
  String get peer_home_bluetooth_permissions_missing => 'Bluetooth permissions not granted';

  @override
  String get peer_home_bluetooth_adapter_on => 'Bluetooth is on';

  @override
  String get peer_home_bluetooth_adapter_off => 'Bluetooth is off';

  @override
  String get peer_home_bluetooth_permissions_granted_dialog_title =>
      'Tete Games is allowed to use Bluetooth';

  @override
  String get peer_home_bluetooth_permissions_denied_dialog_title =>
      'Tete Games is not allowed to use Bluetooth';

  @override
  String get peer_home_bluetooth_permissions_denied_dialog_message =>
      'To play games, allow Tete Games to use Bluetooth in the app permission settings.';

  @override
  String get peer_home_bluetooth_adapter_enabled_dialog_title => 'Bluetooth is on';

  @override
  String get peer_home_bluetooth_adapter_disabled_dialog_title => 'Bluetooth is off';

  @override
  String get peer_home_bluetooth_adapter_disabled_dialog_message =>
      'To play games, turn on Bluetooth in the system control panel.';

  @override
  String get peer_home_drawer_edit_name => 'Edit name';

  @override
  String get peer_home_drawer_nickname_title => 'Nickname';

  @override
  String get peer_home_drawer_nickname_subtitle_filled => 'Your nickname';

  @override
  String get peer_home_drawer_nickname_subtitle_empty => 'Choose a nickname';

  @override
  String get peer_home_drawer_bluetooth_access_title => 'Bluetooth access';

  @override
  String get peer_home_drawer_bluetooth_adapter_title => 'Bluetooth adapter';

  @override
  String get peer_home_drawer_disconnect_confirm_title => 'Disconnect';

  @override
  String get peer_home_drawer_disconnect_confirm_message => 'Are you sure you want to disconnect?';

  @override
  String get peer_dialog_yes => 'Yes';

  @override
  String get peer_home_drawer_download => 'How to download';

  @override
  String get peer_home_drawer_download_hint => 'Scan the QR code to open the download page.';

  @override
  String peer_home_drawer_copyright(int year) {
    return '© $year Tete Games';
  }

  @override
  String peer_home_drawer_version(String version) {
    return 'Version $version';
  }

  @override
  String get peer_home_title => 'Welcome to tete games';

  @override
  String get peer_nickname_dialog_title => 'Choose a nickname';

  @override
  String get peer_nickname_field_hint => 'Enter a nickname';

  @override
  String get peer_nickname_field_label => 'Nickname';

  @override
  String get peer_nickname_save_button => 'Save';

  @override
  String get peer_nickname_save_failed => 'Failed to save nickname';

  @override
  String get peer_nickname_validation_empty => 'Nickname cannot be empty';

  @override
  String get peer_nickname_validation_too_long => 'Nickname must be 20 characters or fewer';

  @override
  String get peer_nickname_validation_wrong_format => 'Spaces are not allowed';

  @override
  String get peer_server_accept_button => 'Accept';

  @override
  String peer_server_invitation_device(String deviceName) {
    return 'Invitation from device $deviceName';
  }

  @override
  String peer_server_invitation_player(String playerName) {
    return 'Player name: $playerName';
  }

  @override
  String get peer_server_invitation_prompt => 'Make your decision';

  @override
  String get peer_server_invitation_title => 'Invitation received';

  @override
  String get peer_server_reject_button => 'Decline';

  @override
  String get peer_server_waiting_body => 'Your device is visible to nearby players';

  @override
  String get peer_server_waiting_title => 'Waiting for connection...';

  @override
  String get something_went_wrong => 'Something went wrong';
}

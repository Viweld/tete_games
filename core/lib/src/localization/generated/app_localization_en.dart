// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get citizenship_search_placeholder => 'Search by country name';

  @override
  String get core_back_button => 'Back';

  @override
  String get description_validator_overflow_message =>
      'Description length should not exceed 300 characters';

  @override
  String get email_validator_invalid_message => 'Invalid email format';

  @override
  String get email_validator_overflow_message => 'Email should not exceed 50 characters';

  @override
  String get expandable_text_expand_label => 'more';

  @override
  String get expandable_text_fold_label => 'fold';

  @override
  String get name_validator_empty_message => 'Cannot be empty';

  @override
  String get name_validator_invalid_message => 'Invalid name format';

  @override
  String get name_validator_overflow_message => 'Name should not exceed 30 characters';

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
  String get peer_client_waiting_hosts_title => 'Waiting for hosts:';

  @override
  String get peer_dialog_cancel => 'Cancel';

  @override
  String get peer_dialog_error_title => 'Error';

  @override
  String get peer_error_bluetooth_unavailable => 'Bluetooth is turned off or unavailable';

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
  String get something_went_wrong => 'Something went wrong';
}

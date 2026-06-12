// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get something_went_wrong => 'Something went wrong';

  @override
  String get name_validator_empty_message => 'Cannot be empty';

  @override
  String get name_validator_invalid_message => 'Invalid name format';

  @override
  String get name_validator_overflow_message => 'Name should not exceed 30 characters';

  @override
  String get email_validator_invalid_message => 'Invalid email format';

  @override
  String get email_validator_overflow_message => 'Email should not exceed 50 characters';

  @override
  String get description_validator_overflow_message =>
      'Description length should not exceed 300 characters';

  @override
  String get expandable_text_fold_label => 'fold';

  @override
  String get expandable_text_expand_label => 'more';

  @override
  String get service_category_airport_title => 'Airport Services';

  @override
  String get service_category_transfer_title => 'Transfer';

  @override
  String get service_category_private_jet_title => 'Private jet';

  @override
  String get main_search_button => 'Find';

  @override
  String get citizenship_search_placeholder => 'Search by country name';

  @override
  String stepped_header_step_label(int current, int total) {
    return 'Step $current/$total';
  }

  @override
  String get airport_detail_tariff_adults => 'Adults';

  @override
  String get airport_detail_tariff_per_person => ' per person';

  @override
  String get airport_detail_tariff_children => 'Children';

  @override
  String get airport_detail_tariff_per_child => ' per child';

  @override
  String get airport_detail_tariff_infants => 'Infants under 2 years old';

  @override
  String get airport_detail_free => 'Free';

  @override
  String get airport_detail_price_from => 'Price from';

  @override
  String get airport_detail_price_transfer_from => 'Price depends on the route';

  @override
  String get airport_detail_from => 'from ';

  @override
  String get core_back_button => 'Back';

  @override
  String get vip_lounge_card_price_label => 'Price';

  @override
  String get vip_lounge_card_price_prefix => 'from';

  @override
  String get vip_lounge_card_watch_all_photos => 'View all photos';

  @override
  String vip_lounge_card_select_button(String name) {
    return 'Select $name';
  }

  @override
  String get summary_flight_info_title => 'Flight Information';

  @override
  String get summary_companions_title => 'Companions';

  @override
  String get order_details_cancellation_rules_title => 'Cancellation rules';

  @override
  String get order_details_cancellation_rule_1 =>
      'Cancellation of service less than 48 hours before start time - 100% of the cost.';

  @override
  String get order_details_cancellation_rule_2 => 'Passenger no-show - 100% of the cost.';

  @override
  String get order_details_cancellation_rule_3 =>
      'Changes in the booking are possible by agreement with the manager and depend on the availability of the service.';

  @override
  String get order_details_flight_info => 'Flight information';

  @override
  String get order_details_price_details => 'Price details';

  @override
  String get order_details_additional_conditions => 'Additional conditions';

  @override
  String get order_details_endpoint_departure => 'Departure';

  @override
  String get order_details_endpoint_arrival => 'Arrival';

  @override
  String get order_details_endpoint_transit => 'Transit';

  @override
  String get order_details_endpoint_transit_arrival => 'Transit (arrival)';

  @override
  String get order_details_endpoint_transit_departure => 'Transit (departure)';

  @override
  String get order_details_travelers_title => 'Travelers';

  @override
  String get order_details_companions_title => 'Companions';

  @override
  String get transfer_car_category_label => 'Car category';

  @override
  String get transfer_departure_address_label => 'Departure address';

  @override
  String get transfer_arrival_address_label => 'Arrival address';

  @override
  String get transaction_card_parameter_accrued_bonuses => 'Accrued bonuses';

  @override
  String get receipt_payment_method => 'Payment Method';

  @override
  String get loyalty_rules_title => 'Using points';

  @override
  String get loyalty_rules_main_text =>
      'Bonus points can be used to pay for any part of the service cost - in full or in part. If there are not enough points, the remaining amount is paid in cash.';

  @override
  String get loyalty_rules_rate_text => '1 point = \$0.1';

  @override
  String get loyalty_rules_additional_conditions_title => 'Additional conditions';

  @override
  String get loyalty_rules_condition_1 => 'Points cannot be exchanged for cash';

  @override
  String get loyalty_rules_condition_2 => 'Points are not awarded for payment with points';

  @override
  String get loyalty_rules_condition_3 =>
      'When a service is returned, the points earned for it are deducted';

  @override
  String get loyalty_rules_important_title => 'Important';

  @override
  String get loyalty_rules_important_text =>
      'If payment is made in another currency, points are calculated in USD at the current exchange rate.';

  @override
  String get receipt_pdf_transaction_title => 'Receipt';

  @override
  String receipt_pdf_date_external(String date, String externalId) {
    return 'from $date year: $externalId';
  }

  @override
  String receipt_pdf_order_number(String orderRef) {
    return 'Order No. $orderRef';
  }

  @override
  String get receipt_transfer_data_title => 'Transfer Data';

  @override
  String get receipt_transfer_stop_point => 'Stop Point';

  @override
  String receipt_total_label(String amount) {
    return 'TOTAL: $amount';
  }

  @override
  String receipt_flight_entry(int index, String flightNumber, String dateTime) {
    return '$index. Flight: $flightNumber, $dateTime';
  }

  @override
  String get receipt_label_status_colon => 'Status:';

  @override
  String get receipt_label_date_colon => 'Date:';

  @override
  String get receipt_label_currency_colon => 'Currency:';

  @override
  String get receipt_label_points_colon => 'Points:';

  @override
  String receipt_points_accrued_line(String amount, String accruedLabel) {
    return '+$amount ($accruedLabel)';
  }

  @override
  String get receipt_payment_status_awaiting => 'Awaiting payment';

  @override
  String get receipt_payment_status_paid => 'Paid';

  @override
  String get receipt_payment_status_declined => 'Payment declined';

  @override
  String get receipt_payment_status_unknown_long => 'Unknown status';

  @override
  String get receipt_pdf_company_footer =>
      'LLC \'Example App\'\nEmail for contact: support@example.com\n\nDetailed information on terms of service provision and personal data processing is available at the following links:\nTerms of Use and Privacy Policy';

  @override
  String get receipt_pdf_bonus_title => 'Bonus Operation Details';

  @override
  String get receipt_bonus_breakdown_title => 'Bonus Breakdown';

  @override
  String get receipt_bonus_paid_service_label => 'Amount of paid service';

  @override
  String get receipt_bonus_user_level_label => 'User status';

  @override
  String get receipt_bonus_coefficient_label => 'Bonus coefficient';

  @override
  String receipt_bonus_percent_of_order(String percent) {
    return '$percent% of order amount';
  }

  @override
  String get receipt_bonus_accrued_label => 'Accrued bonuses';

  @override
  String receipt_bonus_points_short(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      many: '$count points',
      few: '$count points',
      one: '$count point',
    );
    return '$_temp0';
  }

  @override
  String get receipt_bonus_section_status => 'Bonus Status';

  @override
  String get receipt_bonus_points_status_label => 'Points Status';

  @override
  String get receipt_bonus_accrual_date_label => 'Accrual Date';

  @override
  String get receipt_bonus_expiry_title => 'Expiration Date';

  @override
  String receipt_bonus_valid_until(String date) {
    return 'valid until $date';
  }

  @override
  String get receipt_bonus_twelve_months_note =>
      'Points are valid for 12 months from the date of accrual';

  @override
  String get receipt_bonus_balance_title => 'Bonus Balance';

  @override
  String get receipt_bonus_balance_current => 'Current';

  @override
  String get receipt_bonus_balance_spendable => 'Available for spending';

  @override
  String get receipt_bonus_program_line_1 =>
      ' • Bonus points are accrued within the Example App loyalty program.';

  @override
  String get receipt_bonus_program_line_2 =>
      ' • The conditions for accrual, use, and validity period of points are regulated by the loyalty program rules.';

  @override
  String get receipt_bonus_rules_body =>
      ' • Points can be used for full or partial payment of the following Example App services.\n • Points cannot be exchanged for cash\n • Points are not accrued when paying with points\n • In case of service return, the accrued points will be deducted';

  @override
  String get rating_badge_terrible => 'Terrible';

  @override
  String get rating_badge_bad => 'Bad';

  @override
  String get rating_badge_normal => 'Okay';

  @override
  String get rating_badge_good => 'Good';

  @override
  String get rating_badge_excellent => 'Excellent';

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
  String get peer_home_title => 'Welcome to tete games';

  @override
  String get peer_home_mode_prompt => 'Choose a connection mode';

  @override
  String get peer_home_start_server_button => 'Wait for a player';

  @override
  String get peer_home_start_client_button => 'Find and connect';

  @override
  String get peer_home_retry_button => 'Retry';

  @override
  String get peer_dialog_cancel => 'Cancel';

  @override
  String get peer_dialog_error_title => 'Error';

  @override
  String get peer_error_bluetooth_unavailable => 'Bluetooth is turned off or unavailable';

  @override
  String get peer_nickname_dialog_title => 'Choose a nickname';

  @override
  String get peer_nickname_field_label => 'Nickname';

  @override
  String get peer_nickname_field_hint => 'Enter a nickname';

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
  String get peer_server_waiting_title => 'Waiting for connection...';

  @override
  String get peer_server_waiting_body => 'Your device is visible to nearby players';

  @override
  String get peer_server_invitation_title => 'Invitation received';

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
  String get peer_server_accept_button => 'Accept';

  @override
  String get peer_server_reject_button => 'Decline';

  @override
  String get peer_client_devices_title => 'Nearby devices';

  @override
  String get peer_client_loading => 'Loading...';

  @override
  String get peer_client_waiting_hosts_title => 'Waiting for hosts:';

  @override
  String get peer_client_searching => 'Searching...';

  @override
  String get peer_client_unknown_device => 'Unknown device';

  @override
  String get peer_client_our_app_badge => 'tete games app';

  @override
  String get peer_client_invite_button => 'Invite';

  @override
  String get peer_client_invitation_sent_title => 'Invitation sent';

  @override
  String get peer_client_wait_confirmation => 'Waiting for confirmation';

  @override
  String get peer_client_invitation_rejected_title => 'Invitation declined';

  @override
  String get peer_client_invitation_rejected_body => 'The host declined your invitation';

  @override
  String get peer_client_invitation_rejected_button => 'Close';

  @override
  String get peer_client_error_discovery => 'Failed to start device discovery';

  @override
  String get peer_client_error_connection => 'Failed to connect to the device';

  @override
  String get peer_games_list_title => 'Games';

  @override
  String get peer_games_list_stub => 'Games list coming soon';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get all_documents_title => 'All documents';

  @override
  String get core_error_unknown => 'Something went wrong...';

  @override
  String get something_went_wrong => 'Something went wrong';

  @override
  String get name_validator_empty_message => 'Cannot be empty';

  @override
  String get name_validator_invalid_message => 'Invalid name format';

  @override
  String get name_validator_invalid_detailed_message =>
      'Invalid name format. Use only Latin letters, spaces, hyphens, or apostrophes.';

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
  String get service_category_promo_title => 'Promo';

  @override
  String get nav_bar_main_title => 'Main';

  @override
  String get nav_bar_ordering_title => 'Ordering';

  @override
  String get nav_bar_my_trips_title => 'My Trips';

  @override
  String get nav_bar_profile_title => 'Profile';

  @override
  String get auth_login_title => 'Log in or create an account';

  @override
  String get auth_login_subtitle => 'We will send a login code to the provided email';

  @override
  String get auth_email_hint => 'Enter email address';

  @override
  String get auth_email_label => 'Enter email';

  @override
  String get auth_email_invalid_error => 'Check the correctness of input';

  @override
  String get auth_continue_button => 'Continue';

  @override
  String get auth_terms_prefix =>
      'By logging into your account or creating a new one, you agree to our ';

  @override
  String get auth_terms_link => 'Terms and Conditions';

  @override
  String get auth_terms_separator => ' and ';

  @override
  String get auth_privacy_link => 'Privacy Policy';

  @override
  String get auth_copyright => '2026. All rights reserved';

  @override
  String get auth_code_title => 'Check your email';

  @override
  String get auth_code_sent_prefix => 'We have sent a confirmation code to the address ';

  @override
  String get auth_code_sent_suffix => '. Enter it to continue logging in';

  @override
  String get auth_code_resend_prefix =>
      'Did not receive the email? Check the \'Spam\' folder or request a new code through ';

  @override
  String get auth_code_resend_button => 'Resend';

  @override
  String get auth_code_expired_error => 'The code has expired. Request a new one and try again';

  @override
  String get main_screen_title => 'Home';

  @override
  String get my_trips_screen_title => 'My Trips';

  @override
  String get profile_screen_title => 'Profile';

  @override
  String get example_action_navigateExample_title => 'Example navigation';

  @override
  String estimate_seconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds',
      many: '$seconds seconds',
      few: '$seconds seconds',
      one: '$seconds second',
    );
    return '$_temp0';
  }

  @override
  String get profile_welcome_anon_title => 'Welcome!';

  @override
  String profile_welcome_title(String name) {
    return 'Welcome, $name!';
  }

  @override
  String profile_level_status(String level) {
    return 'You have a basic level - $level';
  }

  @override
  String profile_level_remaining(String nextLevel, num amountRemaining) {
    String _temp0 = intl.Intl.pluralLogic(
      amountRemaining,
      locale: localeName,
      other: '$amountRemaining points',
      many: '$amountRemaining points',
      few: '$amountRemaining points',
      one: '$amountRemaining point',
      zero: '0 points',
    );
    return 'Remaining until level $nextLevel: $_temp0';
  }

  @override
  String get profile_details_button => 'More details';

  @override
  String get profile_header_current_status_title => 'YOUR CURRENT STATUS';

  @override
  String get profile_header_spent_for_period => 'Spent for the period';

  @override
  String profile_header_to_level(String levelName) {
    return 'To $levelName level';
  }

  @override
  String profile_header_amount_remaining(String amount) {
    return '$amount left';
  }

  @override
  String profile_header_percent_to_next_level(String percent) {
    return '$percent% to the next level';
  }

  @override
  String profile_header_bonus_usd_equivalent(String amount) {
    return '≈ $amount toward payment';
  }

  @override
  String profile_header_cashback_percent(String percent) {
    return '$percent% cashback';
  }

  @override
  String get profile_header_cashback_description => ' — you earn points with every purchase';

  @override
  String profile_header_cashback_at_level(String levelName) {
    return ' at $levelName level';
  }

  @override
  String get profile_header_your_bonuses => 'Your bonuses';

  @override
  String get profile_header_points => 'points';

  @override
  String get profile_section_my_travels => 'My travels';

  @override
  String get profile_item_bookings => 'Bookings';

  @override
  String get profile_item_my_reviews => 'My reviews';

  @override
  String get profile_section_account_management => 'Account management';

  @override
  String get profile_item_personal_data => 'Personal data';

  @override
  String get profile_item_other_travelers => 'Other travelers';

  @override
  String get profile_section_help => 'Help';

  @override
  String get profile_item_contact_support => 'Contact support';

  @override
  String get profile_item_articles => 'Travel Info';

  @override
  String get profile_item_our_blog => 'Our blog';

  @override
  String get profile_item_security_center => 'Security center';

  @override
  String get profile_section_payment_info => 'Payment information';

  @override
  String get profile_item_rewards_wallet => 'Rewards and wallet';

  @override
  String get profile_item_transactions => 'Transactions';

  @override
  String get profile_section_legal => 'Legal information';

  @override
  String get profile_item_privacy => 'Privacy';

  @override
  String get profile_item_terms => 'Terms of use';

  @override
  String get profile_item_all_documents => 'All documents';

  @override
  String get profile_section_settings => 'Settings';

  @override
  String get profile_item_personalization => 'Personalization Settings';

  @override
  String get profile_item_mailing => 'Mailing Settings';

  @override
  String get personalization_screen_title => 'Personalization Settings';

  @override
  String get personalization_language_label => 'Language';

  @override
  String get personalization_language_search_hint => 'Search by name';

  @override
  String get personalization_currency_label => 'Currency';

  @override
  String get personalization_currency_search_hint => 'Search by name';

  @override
  String get personalization_region_label => 'Region/Country';

  @override
  String get profile_logout_button => 'Log out';

  @override
  String get profile_delete_account_button => 'Delete account';

  @override
  String get auth_or_divider => 'or';

  @override
  String get auth_and => 'and';

  @override
  String get profile_not_auth_title => 'Log in to your account';

  @override
  String get profile_not_auth_subtitle =>
      'Save trips, routes, and favorite places. Earn points and save on orders';

  @override
  String get profile_login_button => 'Log in';

  @override
  String get auth_plug_title => 'Just a few more seconds...';

  @override
  String get auth_plug_comment => 'We are finishing the account login process';

  @override
  String get main_hero_title => 'VIP services at airports\naround the world';

  @override
  String get main_search_hint => 'Airport, city, or flight number...';

  @override
  String get main_search_date_hint => 'Flight date...';

  @override
  String get main_search_button => 'Find';

  @override
  String get main_search_button_continue => 'Continue';

  @override
  String get main_search_subtitle => 'Booking in a couple of minutes • 24/7 support';

  @override
  String get main_services_title => 'Services';

  @override
  String get main_loyalty_title => 'Loyalty Program';

  @override
  String get main_loyalty_description => 'Get back part of the trip cost in bonus points';

  @override
  String get main_loyalty_link => 'Learn more';

  @override
  String get main_airports_title => 'Popular Airports';

  @override
  String get main_airports_all => 'All';

  @override
  String get all_airports_screen_title => 'Airports with the best offers';

  @override
  String get all_airports_section_title => 'Airport selection';

  @override
  String get all_airports_book_button => 'Book';

  @override
  String get all_airports_empty => 'No results';

  @override
  String get all_airports_search_hint => 'Airport or city';

  @override
  String get search_services_search_title => 'Airport Search';

  @override
  String get search_services_all_airports_button => 'All Airports';

  @override
  String get empty_search_title => 'Nothing found';

  @override
  String get empty_search_subtitle => 'Try changing the query\nor try again later';

  @override
  String get main_transfer_placeholder => 'Transfer section is under development';

  @override
  String get personal_data_screen_title => 'Personal Data';

  @override
  String get personal_data_name_label => 'Name';

  @override
  String get personal_data_name_placeholder => 'Enter your name';

  @override
  String get personal_data_email_label => 'Email address';

  @override
  String get personal_data_phone_label => 'Phone number';

  @override
  String get personal_data_phone_placeholder => 'Enter your phone number';

  @override
  String get personal_data_birthdate_label => 'Date of birth';

  @override
  String get personal_data_birthdate_placeholder => 'Enter your date of birth';

  @override
  String get personal_data_gender_label => 'Gender';

  @override
  String get personal_data_gender_male => 'Male';

  @override
  String get personal_data_gender_female => 'Female';

  @override
  String get personal_data_citizenship_label => 'Citizenship';

  @override
  String get personal_data_citizenship_placeholder => 'Enter your citizenship';

  @override
  String get personal_data_delete_account => 'Delete account';

  @override
  String get main_transfer_title => 'Worldwide Transfer';

  @override
  String get main_transfer_subtitle =>
      'No flight connection\nWorks as a personal transfer from any point';

  @override
  String get main_transfer_types_title => 'Transfer Types';

  @override
  String get main_search_transfer_date_title => 'Trip Date';

  @override
  String get main_search_transfer_date_hint => 'Trip Date';

  @override
  String get main_search_transfer_from_title => 'Departure Address';

  @override
  String get main_search_transfer_from_hint => 'Departure Address';

  @override
  String get main_search_transfer_to_title => 'Arrival address';

  @override
  String get main_search_transfer_to_hint => 'Arrival address';

  @override
  String get edit_name_title => 'Enter your name';

  @override
  String get edit_name_avatar_changed_message => 'Profile photo updated';

  @override
  String get edit_name_photo_recommendation =>
      'For Example App to work as intended, we recommend uploading your real photo to your profile. This helps airport staff identify and assist you quickly without delays.';

  @override
  String get personal_data_firstname_label => 'First name';

  @override
  String get personal_data_firstname_hint => 'First name (in Latin, for example, Ivan)';

  @override
  String get personal_data_lastname_label => 'Last name';

  @override
  String get personal_data_lastname_hint => 'Last name (in Latin, for example, Ivanov)';

  @override
  String get personal_data_photo_label => 'Profile photo';

  @override
  String get personal_data_upload => 'Upload';

  @override
  String get personal_data_save => 'Save';

  @override
  String get change_email_confirm_button => 'Confirm';

  @override
  String get confirm_email_title => 'Check your email';

  @override
  String get confirm_email_sent_prefix => 'We have sent a confirmation code to the address ';

  @override
  String get confirm_email_sent_suffix => '. Enter it to confirm your email';

  @override
  String get confirm_email_resend_prefix =>
      'Didn\'t receive the email? Check your \'Spam\' folder or request a new code through ';

  @override
  String get confirm_email_resend_button => 'Resend';

  @override
  String get confirm_email_submit_button => 'Confirm';

  @override
  String get confirm_email_plug_title => 'Just a few more seconds...';

  @override
  String get confirm_email_plug_comment => 'Changing email address';

  @override
  String get confirm_delete_account_title => 'Confirm account deletion';

  @override
  String get confirm_delete_account_sent_prefix => 'We sent a confirmation code to ';

  @override
  String get confirm_delete_account_sent_suffix => '. Enter it to permanently delete your account';

  @override
  String get confirm_delete_account_submit_button => 'Delete account';

  @override
  String get confirm_delete_account_plug_title => 'Just a few more seconds…';

  @override
  String get confirm_delete_account_plug_comment => 'Deleting your account';

  @override
  String get birthday_screen_title => 'Date of birth';

  @override
  String get birthday_field_label => 'Date of Birth';

  @override
  String get save_button => 'Save';

  @override
  String get invalid_date_error => 'Enter a valid date';

  @override
  String get citizenship_screen_title => 'Citizenship';

  @override
  String get citizenship_search_placeholder => 'Search by country name';

  @override
  String get main_transfer_date_modal_title => 'Select Trip Date';

  @override
  String get main_flight_date_modal_title => 'Select Flight Date';

  @override
  String get invitation_dialog_title => 'Log in to your account';

  @override
  String get invitation_dialog_message =>
      'Log in to your profile to save passenger data and trip history';

  @override
  String get invitation_dialog_button => 'Log in';

  @override
  String get welcome_screen_title => 'Welcome!';

  @override
  String get welcome_screen_message =>
      '🎉 You have successfully registered and now have access to rewards in the loyalty program. Your current level:';

  @override
  String get welcome_screen_level => 'Start';

  @override
  String get welcome_screen_description =>
      'Earn bonus points for each payment. The more trips you take, the higher your status and the greater your benefits!';

  @override
  String get welcome_screen_got_it => 'Got it';

  @override
  String get welcome_screen_details => 'More about the program';

  @override
  String get welcome_screen_footer =>
      'Increase your level - get more bonuses, read more on the loyalty program page';

  @override
  String get flights_input_title => 'Enter Your Details';

  @override
  String stepped_header_step_label(int current, int total) {
    return 'Step $current/$total';
  }

  @override
  String get flights_input_description =>
      'Please provide your details in Latin letters so that airport staff can understand them';

  @override
  String get flights_input_flight_data_title => 'Flight Data';

  @override
  String get flights_input_with_transfer => 'With Transfer';

  @override
  String get flights_input_second_flight_data_title => 'Second Flight Data';

  @override
  String get flights_input_remove_flight => 'Remove';

  @override
  String get flights_input_flight_number_label => 'Number';

  @override
  String get flights_input_flight_number_hint => 'Flight number, for example, CU 6456';

  @override
  String get flights_input_flight_date_label => 'Date';

  @override
  String get flights_input_flight_date_hint => 'Flight date, DD.MM.YYYY';

  @override
  String get flights_input_footer_text =>
      'Enter the flight number - the airport will be loaded automatically, and you will be able to choose a service';

  @override
  String get flights_input_continue_button => 'Continue';

  @override
  String get flight_not_found_title => 'Flight not found.';

  @override
  String get flight_not_found_message =>
      'Check the flight number and date, if everything is correct, then fill in the departure time manually. Flight information may be updated later.';

  @override
  String get departure_time_label => 'Departure Time';

  @override
  String get airport_header_departure_title => 'Departure Airport';

  @override
  String get airport_header_arrival_title => 'Arrival Airport';

  @override
  String get airport_header_transit_title => 'Transit Point';

  @override
  String get airport_header_transit_arrival_title => 'Transit Point (Arrival)';

  @override
  String get airport_header_transit_departure_title => 'Transit Point (Departure)';

  @override
  String get flights_input_step_2 => 'Step 2/6';

  @override
  String get flights_input_conditions_title => 'Additional Conditions';

  @override
  String get flights_input_next_step_hint => 'Next, you will be able to select services';

  @override
  String get flight_details_first_flight => 'First flight';

  @override
  String get flight_details_second_flight => 'Second flight';

  @override
  String get flight_details_auto_filled_hint =>
      'Flight details are filled in automatically\nPlease check for accuracy';

  @override
  String get flight_details_transit_exit => 'City exit';

  @override
  String get flight_details_terminal_hint => 'Specify terminal';

  @override
  String get flight_details_terminal_label => 'Terminal';

  @override
  String get flight_details_airport_name_hint => 'Airport name';

  @override
  String get flight_details_single_terminal_name => 'Single terminal';

  @override
  String get info_card_tariffs_description =>
      'Tariffs depend on the airport, services, and passenger\'s age. Click here to see details';

  @override
  String get select_services_title => 'Select services';

  @override
  String select_services_airport_prompt(String airportName) {
    return 'Based on the flight data, select a service for this airport: $airportName';
  }

  @override
  String get select_services_main_services_hint =>
      'Select main services — additional options will appear below';

  @override
  String get select_services_no_service_needed => 'No service needed at this airport';

  @override
  String get select_services_fast_track_notice =>
      'There are several Fast Track services available at this airport. The cost and conditions may vary depending on the selected service.';

  @override
  String get select_services_vip_lounge_notice =>
      'There are several VIP lounges available at this airport. The cost and conditions may vary depending on the selected lounge.';

  @override
  String get select_services_transfer_notice =>
      'The cost of the transfer is calculated individually. A manager will contact you to agree on the final price. Payment is not required at this time. Provide the details to confirm the order.';

  @override
  String get select_services_accompaniment_notice =>
      'There are several accompaniment services available at this airport. The cost and conditions may vary depending on the selected service.';

  @override
  String get select_services_at_least_one_required_toast =>
      'To complete your order, select at least one service at any airport on your route.';

  @override
  String get auth_choice_title => 'Save booking in your account?';

  @override
  String get auth_choice_subtitle =>
      'If you already have an account — simply log in.\nIf not, we can create an account and save the booking in \'My Trips\'';

  @override
  String get auth_choice_login_button => 'Log in to account';

  @override
  String get auth_choice_create_account_label => 'Create account and save booking';

  @override
  String get auth_choice_create_account_hint =>
      'We will send a code to your email. After confirmation, all data will be saved.';

  @override
  String get auth_choice_without_auth_label => 'Continue without registration';

  @override
  String get auth_choice_without_auth_hint =>
      'The booking will not appear in \'My trips\'.\nTo manage the order, you will need the booking code - save it.';

  @override
  String get auth_choice_continue_button => 'Continue';

  @override
  String get flight_input_time_hint => 'HH:MM';

  @override
  String get select_services_vip_lounge => 'VIP Lounge';

  @override
  String get transfer_field_required_error => 'Field cannot be empty';

  @override
  String get transfer_route_title => 'Transfer route';

  @override
  String get transfer_departure_address_hint => 'Departure address';

  @override
  String get transfer_intermediate_point_hint => 'Intermediate point';

  @override
  String get transfer_arrival_address_hint => 'Arrival address';

  @override
  String get transfer_car_category_hint => 'Car category';

  @override
  String get transfer_add_stop_button => 'Add stop';

  @override
  String get flight_details_flight_label => 'Flight';

  @override
  String airport_detail_terminals_subtitle(String names) {
    return 'Terminals $names';
  }

  @override
  String get airport_detail_tariffs_title => 'Tariffs';

  @override
  String get airport_detail_terminal_hint => 'Terminal';

  @override
  String get airport_detail_all_terminals => 'All terminals';

  @override
  String airport_detail_terminal_option(String name) {
    return 'Terminal $name';
  }

  @override
  String get airport_detail_book_button => 'Book';

  @override
  String get airport_detail_what_included_title => 'What\'s included';

  @override
  String get airport_detail_photos_title => 'Photos';

  @override
  String get airport_detail_important_to_know => 'Important to know';

  @override
  String get airport_detail_checkout_button => 'Checkout';

  @override
  String get airport_detail_price_depends_on_tariff => 'Price depends on selected tariff';

  @override
  String get airport_detail_tariff_description => 'Description';

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
  String get airport_detail_price_label => 'Price';

  @override
  String get airport_detail_price_on_request => 'Price on request';

  @override
  String get airport_detail_overview_available_services_title => 'Available services';

  @override
  String get airport_detail_overview_customer_reviews_title => 'Customer reviews';

  @override
  String get airport_detail_overview_about_airport_title => 'About the airport';

  @override
  String get airport_detail_overview_faq_title => 'Questions & answers';

  @override
  String get airport_detail_general_information_title => 'General information';

  @override
  String get airport_detail_info_iata_label => 'IATA code';

  @override
  String get airport_detail_info_city_label => 'City';

  @override
  String get airport_detail_info_terminals_label => 'Terminals';

  @override
  String get airport_detail_info_gates_label => 'Gates';

  @override
  String get airport_detail_info_hours_label => 'Opening hours';

  @override
  String get airport_detail_info_passengers_label => 'Annual passengers';

  @override
  String get airport_detail_info_airlines_label => 'Airlines';

  @override
  String get airport_detail_info_address_label => 'Address';

  @override
  String get airport_detail_info_distance_to_city_label => 'Distance to city';

  @override
  String get airport_detail_info_public_transport_label => 'Public transport';

  @override
  String get airport_detail_getting_there_title => 'Getting there';

  @override
  String get airport_detail_getting_there_address_label => 'Address';

  @override
  String get airport_detail_getting_there_distance_label => 'Distance';

  @override
  String get airport_detail_getting_there_transport_label => 'Transport';

  @override
  String get airport_detail_getting_there_need_transfer_title => 'Need a transfer?';

  @override
  String get airport_detail_getting_there_book_premium_transfer_button => 'Book premium transfer';

  @override
  String get airport_detail_service_details_title => 'Service details';

  @override
  String get airport_detail_how_it_works_title => 'How it works';

  @override
  String get airport_detail_not_included_title => 'Not included';

  @override
  String get airport_detail_about_service_title => 'About the service';

  @override
  String get airport_detail_important_information_title => 'Important information';

  @override
  String get airport_detail_order_transfer_button => 'Order transfer';

  @override
  String get airport_detail_order_service_button => 'Order service';

  @override
  String get airport_detail_benefit_instant_confirmation => 'Instant confirmation';

  @override
  String get airport_detail_benefit_free_cancellation_24h =>
      'Free cancellation up to 24 hours before the service';

  @override
  String get airport_detail_benefit_e_ticket_email => 'E-ticket to email';

  @override
  String get airport_detail_stat_airlines_label => 'Airlines';

  @override
  String get airport_detail_stat_annual_passengers_label => 'Passengers per year';

  @override
  String get airport_detail_stat_working_hours_label => 'Opening hours';

  @override
  String get airport_detail_stat_free_cancellation_label => 'Free cancellation';

  @override
  String airport_detail_reviews_count(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '$count review',
    );
    return '$_temp0';
  }

  @override
  String airport_detail_services_available(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Available $count service types',
      one: 'Available $count service type',
    );
    return '$_temp0';
  }

  @override
  String get airport_detail_view_photos => 'View photos';

  @override
  String get airport_detail_retry_button => 'Retry';

  @override
  String get airport_detail_empty_title => 'Services Coming Soon';

  @override
  String get airport_detail_empty_description =>
      'Unfortunately, we do not currently offer services at this airport. But we are working on connecting new services and expanding coverage. You can leave your email - we will notify you as soon as the services become available.';

  @override
  String get airport_detail_empty_subscribe_button => 'Subscribe for Updates';

  @override
  String get airport_detail_subscribe_title => 'Get Notifications';

  @override
  String get airport_detail_subscribe_description =>
      'Leave your email - we will inform you when services at this airport become available';

  @override
  String get airport_detail_receive_news => 'Receive news and updates from Example App service';

  @override
  String get airport_detail_subscribe_submit_button => 'Subscribe';

  @override
  String get airport_detail_agreement_text => 'By subscribing, you agree to our';

  @override
  String get airport_detail_info_tarif_bottom_sheet_title =>
      'Service price depends on the terminal';

  @override
  String get airport_detail_info_tarif_bottom_sheet_description =>
      'You can view all options. When ordering, specify the flight number - we will automatically determine the terminal. If the terminal is not yet known, we will calculate the approximate cost and contact you for clarification.';

  @override
  String get core_delete_button => 'Delete';

  @override
  String get core_cancel_button => 'Cancel';

  @override
  String get core_cancel_short_button => 'Cancel';

  @override
  String get core_back_button => 'Back';

  @override
  String get core_male => 'Male';

  @override
  String get core_female => 'Female';

  @override
  String get core_not_specified => 'Not Specified';

  @override
  String get auth_invalid_code => 'Invalid Code';

  @override
  String get profile_traveler_card_default_name => 'Traveler';

  @override
  String get profile_traveler_card_gender_label => 'Gender:';

  @override
  String get profile_traveler_card_dob_label => 'Date of Birth:';

  @override
  String get profile_traveler_card_dob_not_specified => 'Not specified';

  @override
  String get profile_traveler_card_edit_button => 'Edit data';

  @override
  String get profile_traveler_card_badge_passenger => 'Passenger';

  @override
  String get profile_logout_message => 'Are you sure you want to log out of your account?';

  @override
  String get profile_travelers_title => 'Other Travelers';

  @override
  String get profile_travelers_empty_text =>
      'You have not added any other travelers yet. Save the data of your family, colleagues, or those you travel with most often - and they will be automatically filled in for bookings. This will save time and eliminate the need for re-entering information';

  @override
  String get profile_travelers_delete_dialog_title => 'Delete Passenger';

  @override
  String get profile_travelers_delete_dialog_message =>
      'Are you sure you want to delete the passenger from the list? This action cannot be undone';

  @override
  String get profile_travelers_add_button => 'Add Travelers';

  @override
  String get profile_delete_account_message => 'Are you sure you want to delete your account?';

  @override
  String get profile_birthday_hint_format => 'DD.MM.YYYY';

  @override
  String get services_endpoints_tariffs_title => 'Tariffs';

  @override
  String get core_logout_button => 'Log out';

  @override
  String get edit_traveler_add_title => 'Add Traveler';

  @override
  String get edit_traveler_edit_title => 'Edit Data';

  @override
  String get edit_traveler_add_button => 'Add';

  @override
  String get edit_traveler_consent_text =>
      'I confirm that the specified person agrees to the transfer of personal data';

  @override
  String get select_travelers_title => 'Passenger Data';

  @override
  String get select_travelers_subtitle =>
      'Data must be entered strictly in Latin letters, as in the passport';

  @override
  String get select_travelers_passengers_title => 'My data';

  @override
  String get select_travelers_i_am_flying => 'I am flying';

  @override
  String get select_travelers_adults => 'Adults';

  @override
  String get select_travelers_children => 'Children (2-12 years)';

  @override
  String get select_travelers_infants => 'Infants (up to 2 years)';

  @override
  String get select_travelers_prm => 'Passenger with reduced mobility (PRM)';

  @override
  String get select_travelers_add_passenger => 'Add passenger';

  @override
  String get select_travelers_add_companion => 'Add companion';

  @override
  String get select_travelers_form_select_from_list => 'Select from your list';

  @override
  String select_travelers_form_traveler_label(int id) {
    return 'Traveler #$id';
  }

  @override
  String get select_travelers_form_first_name_label => 'First name';

  @override
  String get select_travelers_form_first_name_hint => 'First name (in Latin, e.g. Ivan)';

  @override
  String get select_travelers_form_last_name_label => 'Last name';

  @override
  String get select_travelers_form_last_name_hint => 'Last name (in Latin, e.g. Ivanov)';

  @override
  String get select_travelers_form_citizenship_label => 'Citizenship';

  @override
  String get select_travelers_form_citizenship_hint => 'Not selected';

  @override
  String get select_travelers_form_birthdate_label => 'Date of birth';

  @override
  String get select_travelers_form_birthdate_hint => 'DD.MM.YYYY';

  @override
  String get select_travelers_form_phone_label => 'Contact phone';

  @override
  String get select_travelers_form_email_label => 'Email address';

  @override
  String get select_travelers_form_email_hint => 'example@example.com';

  @override
  String get select_travelers_form_delete => 'Delete';

  @override
  String select_travelers_passenger_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '2': 'second',
      '3': 'third',
      '4': 'fourth',
      '5': 'fifth',
      '6': 'sixth',
      '7': 'seventh',
      '8': 'eighth',
      '9': 'ninth',
      '10': 'tenth',
      'other': '$index passenger',
    });
    return 'Data $_temp0';
  }

  @override
  String get select_travelers_first_companion_header => 'Data of companion';

  @override
  String get select_travelers_first_companion_subtitle =>
      'Data should be entered in Latin letters exactly as in the passport';

  @override
  String select_travelers_companion_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '1': 'first',
      '2': 'second',
      '3': 'third',
      '4': 'fourth',
      '5': 'fifth',
      '6': 'sixth',
      '7': 'seventh',
      '8': 'eighth',
      '9': 'ninth',
      '10': 'tenth',
      'other': '$index-th  companion',
    });
    return 'Data $_temp0';
  }

  @override
  String get select_travelers_confirm_email_title => 'Confirm Email';

  @override
  String get select_travelers_confirm_email_create_account_message =>
      'Confirm your email to complete account creation and receive booking details.';

  @override
  String get select_travelers_confirm_email_guest_message =>
      'You can place an order without registration, but we need to confirm your email. This is necessary to send confirmation and service details.';

  @override
  String get select_travelers_confirm_email_continue_button => 'Continue';

  @override
  String get ordering_contact_person_minimum_age_error =>
      'The contact person must be at least 12 years old.';

  @override
  String get transfers_tariffs_car_categories_title => 'Car Categories';

  @override
  String get lounge_tariffs_car_categories_title => 'VIP Lounges';

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
  String get send_code_terms_agreement => 'By proceeding you agree to our ';

  @override
  String get tariffs_title => 'Tariffs';

  @override
  String get edit_traveler_name_hint =>
      'Enter the name exactly as it appears in the passport or other official document';

  @override
  String get payment_screen_title => 'Select Payment Method';

  @override
  String get payment_methods_card => 'By bank card';

  @override
  String get payment_methods_apple_google_pay => 'Apple Pay / Google Pay';

  @override
  String get payment_methods_soon => '(coming soon)';

  @override
  String get payment_bonus_points_auth_hint => 'Available after logging in/creating an account';

  @override
  String get payment_bonus_points_use => 'Use points';

  @override
  String payment_bonus_points_available(String available) {
    return 'Available $available';
  }

  @override
  String get payment_bonus_points_use_all => 'Use all';

  @override
  String get payment_total_title => 'Total cost:';

  @override
  String get payment_total_bonus_prefix => 'After payment you will receive';

  @override
  String payment_total_bonus_points(String points) {
    return '+$points points';
  }

  @override
  String get payment_total_bonus_suffix => 'They will automatically appear in your account';

  @override
  String get payment_terms_prefix => 'By continuing I agree with ';

  @override
  String get payment_terms_link => 'Terms of Use';

  @override
  String get payment_terms_and => ' and ';

  @override
  String get payment_privacy_link => 'Privacy Policy';

  @override
  String get payment_pay_button => 'Pay';

  @override
  String get payment_free_checkout_screen_title => 'Order processing';

  @override
  String get payment_free_checkout_payment_manual_hint =>
      'The transfer cost is calculated manually by the manager. After submitting the application, we will contact you within an hour to clarify the details and agree on the cost. Please wait for the call.\n\nAfter agreeing on the cost, you will be able to pay for the service in your personal account - in the \'My Trips\' → \'Bookings\' tab.';

  @override
  String get payment_free_checkout_submit_button => 'Submit application';

  @override
  String get summary_screen_title => 'Summary';

  @override
  String get summary_flight_info_title => 'Flight Information';

  @override
  String get summary_services_not_required => 'Services are not required at this airport';

  @override
  String get summary_transfer_price_not_included =>
      'Transfer price is not included. A manager will contact you to confirm the price.';

  @override
  String get summary_transfer_route_title => 'Transfer Route';

  @override
  String get summary_transfer_pickup_address_label => 'Pickup Address:';

  @override
  String get summary_transfer_stop_label => 'Stop:';

  @override
  String get summary_transfer_dropoff_address_label => 'Dropoff Address:';

  @override
  String get summary_transfer_car_category_label => 'Car Category:';

  @override
  String get summary_transfer_car_standard => 'Standard';

  @override
  String get summary_additional_conditions_title => 'Additional Conditions';

  @override
  String get summary_travelers_title => 'Travelers';

  @override
  String get summary_companions_title => 'Companions';

  @override
  String get summary_agreements_title => 'Agreements';

  @override
  String get summary_agreement_data_correctness => 'I confirm the correctness of the data';

  @override
  String get summary_agreement_terms_of_use => 'I agree to the privacy policy and terms of use';

  @override
  String get summary_submit_button => 'Proceed to Payment';

  @override
  String get summary_total_label => 'TOTAL:';

  @override
  String summary_terminal_label(String name) {
    return 'Terminal $name';
  }

  @override
  String summary_flight_number_label(String number) {
    return 'Flight: $number';
  }

  @override
  String get order_status_paid => 'Paid';

  @override
  String get order_status_waiting_payment => 'Awaiting payment';

  @override
  String get order_status_draft => 'Draft';

  @override
  String get order_status_processing => 'Processing';

  @override
  String order_ref_number(String ref) {
    return 'Order number: $ref';
  }

  @override
  String get my_trips_tab_drafts => 'Drafts';

  @override
  String get my_trips_tab_upcoming => 'Upcoming';

  @override
  String get my_trips_tab_completed => 'Completed';

  @override
  String get my_trips_tab_cancelled => 'Cancelled';

  @override
  String order_details_id_label(String id) {
    return 'Order #$id';
  }

  @override
  String get my_trips_not_auth_title => 'Your trips are here';

  @override
  String get my_trips_not_auth_subtitle => 'Sign in to save and view your trips';

  @override
  String get my_trips_empty_state_title => 'You have no bookings yet';

  @override
  String get my_trips_empty_state_subtitle =>
      'Make your first booking and all trips will appear here';

  @override
  String get my_trips_empty_state_find_booking_button => 'Can\'t find booking';

  @override
  String get my_trips_empty_state_select_airport_button => 'Go to airport selection';

  @override
  String get my_trips_empty_state_book_service_button => 'Book a service';

  @override
  String order_flight_number_label(String number) {
    return 'Flight: $number';
  }

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
  String get order_details_my_order_title => 'My order';

  @override
  String get order_details_booking_number => 'Booking number';

  @override
  String get order_details_flight_info => 'Flight information';

  @override
  String get order_details_show_to_employee => 'Show to employee';

  @override
  String get order_details_download_receipt => 'Download receipt';

  @override
  String get order_details_what_next => 'What\'s next?';

  @override
  String get order_details_price_details => 'Price details';

  @override
  String get order_details_additional_conditions => 'Additional conditions';

  @override
  String get order_details_travelers_companions => 'Travelers/Companions';

  @override
  String get order_details_our_recommendations => 'Our recommendations';

  @override
  String get order_details_add_to_calendar => 'Add to calendar';

  @override
  String get order_details_support_text => 'If you need to make changes, please contact support';

  @override
  String get order_details_cancel_order => 'Cancel order';

  @override
  String get order_details_order_new_service => 'Order new service';

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
  String get order_status_requires_surcharge => 'Requires surcharge';

  @override
  String get order_details_whats_next_text =>
      'We will take care to ensure that your journey goes smoothly and without any extra questions.\n\n1. Save the QR code/booking number, it is needed to quickly identify you\n  • It is needed for a Example App employee to quickly identify you\n  • You can open it at any time in the My trips section\n\n2. Wait for a message from us\n  • We will send a reminder in advance with the time, terminal, and meeting point\n  • If additional information is needed, a manager will contact you personally\n\n3. How to find an employee on the day of the trip\n  • Come to the specified meeting point: Fast Track counter, VIP entrance, or arrival zone\n  • The employee will be waiting for you\n  • If you don\'t see them right away, simply respond to the notification or call the number from the email, we are always available.\n\n4. What to have with you\n  • Passport\n  • QR code\n\nAnd be sure not to worry, you won\'t be alone at the airport — we are always available!';

  @override
  String get order_details_our_recommendations_text =>
      '• Arrive early\nFor international flights, we recommend arriving 2–2.5 hours in advance, for domestic flights — 1.5 hours, to comfortably go through all the stages with Fast Track or assistance.\n\n• Where is the service counter located\nThe Fast Track / Meet & Assist counter is located in the departure area, near the security checkpoint. Follow the signs for \"Fast Track / Priority\" or show your code to the employee at the entrance.\n\n• How to get to check-in\nFrom the entrance to the check-in counter is approximately a 3–7 minute walk. If you have booked assistance, an employee will meet you at the entrance or at an agreed point and will guide you through the entire process.\n\n• How long does the process take\nWith Fast Track, the processing time usually ranges from 5 to 15 minutes, depending on the terminal\'s busyness.\n\n• If you are traveling with luggage\nAn agent will help you carry your luggage and will take you to the priority check-in counter, if available in that terminal.';

  @override
  String get transfer_input_title => 'Enter your details';

  @override
  String get transfer_input_description =>
      'Please provide your details in Latin letters so that the staff can understand them';

  @override
  String get transfer_order_info_message =>
      'Transfer can be arranged separately or together with other airport services. To select multiple services, including transfer, go to the main form here.';

  @override
  String get transfer_order_info_button => 'Order airport services';

  @override
  String get transfer_trip_data_title => 'Trip data';

  @override
  String get transfer_date_label => 'Date';

  @override
  String get transfer_time_label => 'Time';

  @override
  String get transfer_car_category_label => 'Car category';

  @override
  String get transfer_trip_route_title => 'Trip route';

  @override
  String get transfer_departure_address_label => 'Departure address';

  @override
  String get transfer_arrival_address_label => 'Arrival address';

  @override
  String get transfer_intermediate_point_label => 'Intermediate point';

  @override
  String get transfer_auth_choice_title => 'Save booking in your account?';

  @override
  String get transfer_auth_choice_subtitle =>
      'If you already have an account — simply log in.\nIf not, we can create an account and save the booking in \'My trips\'';

  @override
  String get transfer_auth_choice_login_button => 'Log in';

  @override
  String get transfer_auth_choice_create_account_label => 'Create an account and save the booking';

  @override
  String get transfer_auth_choice_create_account_hint =>
      'We will send a code to your email. After confirmation, all data will be saved.';

  @override
  String get transfer_auth_choice_without_auth_label => 'Continue without registration';

  @override
  String get transfer_auth_choice_without_auth_hint =>
      'The booking will not appear in \'My trips\'.\nTo manage the order, you will need the booking code - save it.';

  @override
  String get transfer_auth_choice_continue_button => 'Continue';

  @override
  String get transfer_select_travelers_title => 'Passenger details';

  @override
  String get transfer_select_travelers_subtitle =>
      'Details must be entered strictly in Latin letters, as in the passport';

  @override
  String get transfer_select_travelers_passengers_title => 'My details';

  @override
  String get transfer_select_travelers_i_am_traveling => 'I am traveling';

  @override
  String get transfer_select_travelers_adults => 'Adults';

  @override
  String get transfer_select_travelers_children => 'Children (2-12 years)';

  @override
  String get transfer_select_travelers_infants => 'Infants (up to 2 years)';

  @override
  String get transfer_select_travelers_prm => 'Passenger with reduced mobility (PRM)';

  @override
  String get transfer_select_travelers_add_passenger => 'Add passenger';

  @override
  String get transfer_select_travelers_add_companion => 'Add companion';

  @override
  String get transfer_select_travelers_form_select_from_list => 'Select from your list';

  @override
  String transfer_select_travelers_form_traveler_label(Object id) {
    return 'Traveler #$id';
  }

  @override
  String get transfer_select_travelers_form_first_name_label => 'First name';

  @override
  String get transfer_select_travelers_form_first_name_hint =>
      'First name (in Latin letters, for example, Ivan)';

  @override
  String get transfer_select_travelers_form_last_name_label => 'Last Name';

  @override
  String get transfer_select_travelers_form_last_name_hint => 'Last Name (in Latin, e.g. Ivanov)';

  @override
  String get transfer_select_travelers_form_citizenship_label => 'Citizenship';

  @override
  String get transfer_select_travelers_form_citizenship_hint => 'Not selected';

  @override
  String get transfer_select_travelers_form_birthdate_label => 'Date of Birth';

  @override
  String get transfer_select_travelers_form_birthdate_hint => 'DD.MM.YYYY';

  @override
  String get transfer_select_travelers_form_phone_label => 'Contact Phone';

  @override
  String get transfer_select_travelers_form_email_label => 'Email Address';

  @override
  String get transfer_select_travelers_form_email_hint => 'example@example.com';

  @override
  String get transfer_select_travelers_form_delete => 'Delete';

  @override
  String transfer_select_travelers_passenger_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '2': 'second',
      '3': 'third',
      '4': 'fourth',
      '5': 'fifth',
      '6': 'sixth',
      '7': 'seventh',
      '8': 'eighth',
      '9': 'ninth',
      '10': 'tenth',
      'other': '$index-th  passenger',
    });
    return 'Data of $_temp0';
  }

  @override
  String get transfer_select_travelers_first_companion_header => 'Data of Companion';

  @override
  String get transfer_select_travelers_first_companion_subtitle =>
      'Data should be entered strictly in Latin letters, as in the passport';

  @override
  String transfer_select_travelers_companion_header(String index) {
    String _temp0 = intl.Intl.selectLogic(index, {
      '1': 'first',
      '2': 'second',
      '3': 'third',
      '4': 'fourth',
      '5': 'fifth',
      '6': 'sixth',
      '7': 'seventh',
      '8': 'eighth',
      '9': 'ninth',
      '10': 'tenth',
      'other': '$index-th  companion',
    });
    return 'Data of $_temp0';
  }

  @override
  String get transfer_select_travelers_confirm_email_title => 'Confirm Email';

  @override
  String get transfer_select_travelers_confirm_email_create_account_message =>
      'Confirm your email to complete account creation and receive booking details.';

  @override
  String get transfer_select_travelers_confirm_email_guest_message =>
      'You can place an order without registration, but we need to confirm your email. This is necessary to send confirmation and service details.';

  @override
  String get transfer_select_travelers_confirm_email_continue_button => 'Continue';

  @override
  String get transfer_auth_code_title => 'Enter Code';

  @override
  String get transfer_auth_code_sent_prefix => 'We have sent an email with a confirmation code to ';

  @override
  String get transfer_auth_code_sent_suffix => '. Please enter it.';

  @override
  String get transfer_auth_code_resend_prefix => 'You can resend the code in ';

  @override
  String get transfer_auth_code_resend_button => 'Resend';

  @override
  String get transfer_send_code_terms_agreement =>
      'By clicking on the \"Continue\" button, you agree to the ';

  @override
  String get transfer_auth_terms_link => 'Terms of Use';

  @override
  String get transfer_auth_and => 'and';

  @override
  String get transfer_auth_privacy_link => 'Privacy Policy';

  @override
  String get transfer_auth_copyright => '© Example App 2024';

  @override
  String get transfer_auth_continue_button => 'Continue';

  @override
  String get transfer_checkout_screen_title => 'Order Checkout';

  @override
  String get transfer_checkout_transfer_route_title => 'Transfer Route';

  @override
  String get transfer_checkout_transfer_pickup_address_label => 'Pickup Address';

  @override
  String get transfer_checkout_transfer_dropoff_address_label => 'Dropoff Address';

  @override
  String get transfer_checkout_transfer_stop_label => 'Stop';

  @override
  String get transfer_checkout_transfer_car_category_label => 'Car Category';

  @override
  String get transfer_checkout_transfer_car_standard => 'Standard';

  @override
  String get transfer_checkout_total_label => 'Total';

  @override
  String get transfer_checkout_additional_conditions_title => 'Additional Conditions';

  @override
  String get transfer_checkout_travelers_title => 'Passenger Information';

  @override
  String get transfer_checkout_companions_title => 'Companion Information';

  @override
  String get transfer_checkout_agreements_title => 'Agreements';

  @override
  String get transfer_checkout_agreement_data_correctness =>
      'I confirm the correctness of the data';

  @override
  String get transfer_checkout_agreement_terms_of_use =>
      'I agree to the privacy policy and terms of use';

  @override
  String get transfer_checkout_submit_button => 'Submit application';

  @override
  String get transfer_checkout_payment_manual_hint =>
      'The transfer cost is calculated manually by the manager. After submitting the application, we will contact you within an hour to clarify the details and agree on the cost. Please wait for the call.\n\nAfter agreeing on the cost, you will be able to pay for the service in your personal account - in the \'My trips\' → \'Bookings\' tab.';

  @override
  String get transfer_auth_invalid_code_error => 'Invalid code';

  @override
  String get payment_success_dialog_title => 'Payment successful';

  @override
  String get payment_success_dialog_message => 'Don\'t forget to save the booking ID';

  @override
  String get payment_success_dialog_button => 'Okay';

  @override
  String get transfer_checkout_success_dialog_title => 'Application accepted';

  @override
  String get transfer_checkout_success_dialog_message =>
      'Thank you! We have received your transfer request. A manager will contact you shortly to clarify the details and confirm the trip.';

  @override
  String get transfer_checkout_success_dialog_button => 'Okay';

  @override
  String get support_help_screen => 'Help';

  @override
  String get support_chat => 'Support chat';

  @override
  String get support_assistent => 'Assistant';

  @override
  String get support_faq => 'FAQ';

  @override
  String get support_tickets => 'Tickets';

  @override
  String get support_new_ticket => 'New ticket';

  @override
  String get support_cancel_booking => 'Cancel booking';

  @override
  String get support_booking_number => 'Booking number';

  @override
  String get support_not_booking_number => 'No booking number';

  @override
  String get support_suggestions_question_label => 'What would you like to ask about?';

  @override
  String get support_input_hint => 'Enter text...';

  @override
  String get support_bot_request_ref_number => 'Please provide the booking number';

  @override
  String get support_bot_ticket_created =>
      'Thank you for reaching out! Our specialist is already reviewing your request.';

  @override
  String get support_bot_chat_end =>
      'Chat ended, if the issue is not resolved, please open a new request';

  @override
  String get support_bot_no_ref_fallback =>
      'Write what happened. We are connecting a specialist and will respond to you soon!';

  @override
  String get support_category_fast_track => 'Fast Track';

  @override
  String get support_category_vip_lounge => 'VIP Lounge';

  @override
  String get support_category_transfer => 'Transfer';

  @override
  String get support_category_meet_assist => 'Meet & Assist';

  @override
  String get support_category_other => 'Other';

  @override
  String get transactions_screen_title => 'Transactions';

  @override
  String get transactions_tab_all => 'All';

  @override
  String get transactions_tab_payments => 'Payments';

  @override
  String get transactions_tab_refunds => 'Refunds';

  @override
  String get transactions_tab_bonuses => 'Bonuses';

  @override
  String get transactions_all_empty_state =>
      'History is empty.\nYour payments, refunds, and bonus points will be displayed here after the first transaction.';

  @override
  String get transactions_payments_empty_state =>
      'History is empty.\nYour payments will be displayed here after the first transaction.';

  @override
  String get transactions_refunds_empty_state =>
      'History is empty.\nRefunds will be displayed here.';

  @override
  String get transactions_bonuses_empty_state =>
      'History is empty.\nBonus points will be displayed here.';

  @override
  String get transaction_card_details_button => 'Details';

  @override
  String get transaction_card_parameter_accrued_bonuses => 'Accrued bonuses';

  @override
  String get transaction_card_parameter_order => 'Order:';

  @override
  String get transaction_card_parameter_date => 'Date:';

  @override
  String get transaction_card_parameter_amount => 'Amount:';

  @override
  String get transaction_status_success => 'Success';

  @override
  String get transaction_status_refunded => 'Refunded';

  @override
  String get transaction_status_accrued => 'Accrued';

  @override
  String get transaction_status_pending => 'Pending';

  @override
  String get transaction_status_failed => 'Failed';

  @override
  String get transaction_status_unknown => 'Unknown';

  @override
  String get receipt_title => 'Transaction Receipt';

  @override
  String get receipt_transaction_id => 'Transaction ID';

  @override
  String get receipt_date => 'Date and Time';

  @override
  String get receipt_amount => 'Amount';

  @override
  String get receipt_status => 'Status';

  @override
  String get receipt_payment_method => 'Payment Method';

  @override
  String get receipt_payer => 'Payer';

  @override
  String get receipt_merchant => 'Merchant';

  @override
  String get receipt_merchant_name => 'Example App';

  @override
  String get receipt_merchant_address => 'Moscow, Arbat Street, 1';

  @override
  String get receipt_transaction_type => 'Transaction Type';

  @override
  String get receipt_transaction_type_deposit => 'Deposit';

  @override
  String get receipt_transaction_type_adjustment => 'Adjustment';

  @override
  String get receipt_payment_method_manual => 'Manual';

  @override
  String get receipt_external_id => 'External ID';

  @override
  String get receipt_order_number => 'Order Number';

  @override
  String get receipt_description => 'Description';

  @override
  String get receipt_loading_title => 'Generating Receipt';

  @override
  String get receipt_loading_comment => 'Please wait, we are preparing the document...';

  @override
  String get receipt_footer_text =>
      'The receipt is automatically generated in the Example App app.\nThis is an official document confirming the transaction.';

  @override
  String privacy_update_date(String date) {
    return 'Updated: $date';
  }

  @override
  String get loyalty_title => 'Loyalty Program';

  @override
  String loyalty_bonus_badge(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: 'Your bonuses: $points points',
      many: 'Your bonuses: $points points',
      few: 'Your bonuses: $points points',
      one: 'Your bonuses: $points point',
      zero: 'Your bonuses: 0 points',
    );
    return '$_temp0';
  }

  @override
  String get loyalty_bonus_description =>
      'Each paid service brings you closer to the next level of the program. The higher the status, the more points are returned to your account.';

  @override
  String get loyalty_bonus_details_link => 'More about bonus points';

  @override
  String get loyalty_current_level_title => 'You are at the base level';

  @override
  String loyalty_current_level_cashback(String percents) {
    return '$percents% in points with each purchase';
  }

  @override
  String loyalty_points_to_next_level(int points) {
    return 'You need $points more points to reach the next level';
  }

  @override
  String get loyalty_about_levels_title => 'Save on future trips';

  @override
  String get loyalty_about_levels_card_1_title => 'Move to a new level faster';

  @override
  String get loyalty_about_levels_card_1_description =>
      'We take into account every booking of yours - and upgrading your status becomes easy';

  @override
  String get loyalty_about_levels_card_2_title => 'Always get more';

  @override
  String get loyalty_about_levels_card_2_description =>
      'The higher your level, the more points are credited back to your account with each trip';

  @override
  String get loyalty_about_levels_card_3_title => 'Pay for trips more profitably';

  @override
  String get loyalty_about_levels_card_3_description =>
      'Use accumulated points to pay less at the next airport';

  @override
  String get loyalty_bonus_description_new =>
      'With each payment for services, you receive bonus points. The amount depends on your status.\nStatus is determined by the total cost of paid services and is fixed forever.';

  @override
  String loyalty_current_level_description(Object nextLevel, Object points) {
    return 'You need $points more points to reach the next level, and then the discounts and rewards of level $nextLevel will be yours.\nAll bookings are taken into account!';
  }

  @override
  String loyalty_progress_caption(Object percent) {
    return '$percent% to the next level. Progress is automatically calculated based on your bookings';
  }

  @override
  String get loyalty_level_at_registration => 'Accrued upon registration in the service';

  @override
  String loyalty_level_accrued_from(String amount) {
    return 'Accrued when ordering from $amount';
  }

  @override
  String get loyalty_conditions_link => 'Program terms';

  @override
  String get loyalty_not_auth_message =>
      'Log in to accumulate points and participate in the loyalty program';

  @override
  String get loyalty_login_button => 'Log in';

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
  String loyalty_current_level_user(String levelName) {
    return 'You are at level $levelName!';
  }

  @override
  String get loyalty_level_status_1 => 'this is the base level';

  @override
  String get loyalty_level_status_2 => 'second level';

  @override
  String get loyalty_level_status_3 => 'third level';

  @override
  String get loyalty_level_status_4 => 'fourth level';

  @override
  String get loyalty_level_status_5 => 'fifth level';

  @override
  String get loyalty_level_status_6 => 'sixth level';

  @override
  String loyalty_level_status_other(int rank) {
    return '${rank}th level';
  }

  @override
  String loyalty_level_cashback_percent(String percents) {
    return '$percents%';
  }

  @override
  String get loyalty_level_cashback_suffix => ' in points with each purchase';

  @override
  String get loyalty_level_threshold_base => 'Base level';

  @override
  String loyalty_level_threshold_from_amount(String amount) {
    return 'When total reaches $amount';
  }

  @override
  String get loyalty_level_privilege_1_1 => 'Points accumulation';

  @override
  String get loyalty_level_privilege_1_2 => 'Basic support';

  @override
  String get loyalty_level_privilege_1_3 => 'Access to promotions';

  @override
  String get loyalty_level_privilege_2_1 => 'Priority support';

  @override
  String get loyalty_level_privilege_2_2 => 'Early access to discounts';

  @override
  String get loyalty_level_privilege_2_3 => 'Birthday bonus';

  @override
  String get loyalty_level_privilege_3_1 => 'Personal manager';

  @override
  String get loyalty_level_privilege_3_2 => 'Free upgrade';

  @override
  String get loyalty_level_privilege_3_3 => 'Exclusive offers';

  @override
  String get loyalty_level_privilege_4_1 => '24/7 concierge service';

  @override
  String get loyalty_level_privilege_4_2 => 'Free services';

  @override
  String get loyalty_level_privilege_4_3 => 'VIP events';

  @override
  String get loyalty_status_metric_current_level => 'Current level';

  @override
  String get loyalty_status_metric_cashback => 'Cashback on purchases';

  @override
  String get loyalty_bonus_accrual_history => 'Accrual history';

  @override
  String loyalty_progress_next_level_points(String nextLevelName, String pointsText) {
    return '$nextLevelName · $pointsText';
  }

  @override
  String loyalty_current_level_user_greeting(String userName, String levelName) {
    return '$userName, you are at level $levelName!';
  }

  @override
  String article_update_date(String date) {
    return 'Updated: $date';
  }

  @override
  String get article_read_full => 'Read full article';

  @override
  String get article_help_instruction_travelers => 'Help and instructions for travelers';

  @override
  String get article_go_to_service => 'Go to services';

  @override
  String get article_select => 'Select article';

  @override
  String get article_share => 'Share article';

  @override
  String get article_book_service => 'Book services';

  @override
  String get article_search_title => 'Article Search';

  @override
  String get notifications_title => 'My Notifications';

  @override
  String get notifications_text_empty =>
      'No notifications yet. \nImportant messages about your bookings, payments, and service changes will be displayed here. As soon as there is activity, we will notify you.';

  @override
  String get notifications_toggle_title => 'Subscriptions';

  @override
  String get notifications_turn_on => 'Turn on notifications';

  @override
  String get notifications_turn_off => 'Turn off notifications';

  @override
  String get notifications_book_service => 'Book Services';

  @override
  String get notifications_new => 'New';

  @override
  String get notifications_no_new => 'No new notifications';

  @override
  String get notifications_read => 'Read';

  @override
  String get notifications_read_all => 'Read All';

  @override
  String get notifications_detail => 'Details';

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
  String receipt_header_id(String id) {
    return 'ID: $id';
  }

  @override
  String get my_trips_delete_draft_dialog_title => 'Delete Draft?';

  @override
  String get my_trips_delete_draft_dialog_message => 'The order draft will be permanently deleted.';

  @override
  String get my_trips_draft_continue_ordering => 'Continue Ordering';

  @override
  String calendar_event_flight_title(String flightNumber) {
    return 'Flight $flightNumber';
  }

  @override
  String calendar_event_flight_description(String airline, String departure, String arrival) {
    return 'Flight with $airline ($departure → $arrival)';
  }

  @override
  String get cancellation_screen_title => 'Booking Cancellation';

  @override
  String get cancellation_search_subtitle =>
      'Enter booking details to check cancellation possibility';

  @override
  String get cancellation_email_at_checkout_label => 'Email at Checkout';

  @override
  String get cancellation_email_short_hint => 'Email';

  @override
  String get cancellation_find_booking_button => 'Find Booking';

  @override
  String get cancellation_field_required_error => 'Required field';

  @override
  String get cancellation_order_not_found_title => 'Booking not found';

  @override
  String get cancellation_order_not_found_write_support => 'Contact support';

  @override
  String get cancellation_order_not_found_body =>
      'Please check the booking number and email address. If the issue persists, contact support.';

  @override
  String cancellation_order_not_found_details(String orderNumber, String email) {
    return 'Booking number:\n$orderNumber\n\nEmail:\n$email';
  }

  @override
  String get cancellation_cancelled_title => 'Booking cancelled';

  @override
  String get cancellation_cancelled_message =>
      'Cancellation and refund information will appear in \'My Trips\'.\n\nConfirmation has also been sent to your email.';

  @override
  String get cancellation_auth_manage_bookings_title =>
      'Want to manage bookings more conveniently?';

  @override
  String get cancellation_auth_skip => 'Skip';

  @override
  String get cancellation_auth_invite_body =>
      'Create or log in to your account to see all trips, statuses, and notifications in one place.';

  @override
  String get cancellation_confirm_title => 'Are you sure you want to cancel the booking?';

  @override
  String get cancellation_confirm_message => 'This action cannot be undone';

  @override
  String get cancellation_confirm_primary => 'Confirm';

  @override
  String get core_order_number_copied_to_clipboard => 'Order number copied to clipboard';

  @override
  String get cancellation_status_available => 'Cancellation available';

  @override
  String get cancellation_status_unavailable => 'Cancellation unavailable';

  @override
  String get cancellation_available_hint => 'You can cancel the booking and receive a refund.';

  @override
  String get cancellation_unavailable_hint =>
      'The free cancellation period has expired, so the order cannot be cancelled. Refund is not available. More details in the rules below.';

  @override
  String get cancellation_support_hint =>
      'If you need to make changes, please contact support instead of cancelling the order';

  @override
  String get order_status_cancelled => 'Cancelled';

  @override
  String get order_refund_status_processing => 'Refund is processing';

  @override
  String get order_refund_status_refunded => 'Funds refunded';

  @override
  String get order_refund_status_error => 'Refund error';

  @override
  String get order_status_payment_error => 'Payment error';

  @override
  String get order_status_cancel_requested => 'Cancellation';

  @override
  String get order_status_waiting_processing => 'In queue';

  @override
  String get order_status_waiting_partner => 'At partner';

  @override
  String get order_status_partner_confirmed => 'Confirmed';

  @override
  String get order_status_in_progress => 'In progress';

  @override
  String get order_status_pending_pre_flight => 'Before flight';

  @override
  String get order_status_in_flight => 'In flight';

  @override
  String get order_status_pending_post_flight => 'After flight';

  @override
  String get order_status_completed => 'Completed';

  @override
  String get order_status_partner_rejected => 'Rejected';

  @override
  String get order_status_refund_error => 'Refund error';

  @override
  String get order_status_refund_processing => 'Refunding';

  @override
  String get order_status_refunded => 'Refunded';

  @override
  String get search_services_initial_title => 'Start typing airport or flight';

  @override
  String get search_services_initial_subtitle =>
      'Find airport by name or city, or enter flight number to book services at arrival or departure airport';

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
  String get private_jet_charter_title => 'Private aircraft charter';

  @override
  String get private_jet_charter_subtitle =>
      'Fly on your schedule. No queues, delays, or compromises. Access to 5,000+ aircraft worldwide.';

  @override
  String get main_search_private_jet_departure_title => 'From';

  @override
  String get main_search_private_jet_departure_hint => 'From (city or airport)';

  @override
  String get main_search_private_jet_arrival_title => 'To';

  @override
  String get main_search_private_jet_arrival_hint => 'To (city or airport)';

  @override
  String get main_search_private_jet_date_title => 'Date';

  @override
  String get main_search_private_jet_date_hint => 'Date';

  @override
  String get main_search_private_jet_date_picker_title => 'Select date';

  @override
  String get main_search_private_jet_passengers_title => 'Passengers';

  @override
  String get main_search_private_jet_passengers_hint => 'Passengers';

  @override
  String get main_search_private_jet_passengers_more_than_20 => '> 20 passengers';

  @override
  String get private_jet_benefit_fleet_title => '5,000+ aircraft';

  @override
  String get private_jet_benefit_fleet_subtitle =>
      'Access to the world\'s largest private jet fleet';

  @override
  String get private_jet_benefit_booking_title => 'In 2 hours';

  @override
  String get private_jet_benefit_booking_subtitle => 'Book with as little as 2 hours\' notice';

  @override
  String get private_jet_benefit_safety_title => 'Safety certification';

  @override
  String get private_jet_benefit_safety_subtitle => 'All aircraft meet ARGUS/Wyvern standards';

  @override
  String get private_jet_benefit_destinations_title => 'Fly anywhere';

  @override
  String get private_jet_benefit_destinations_subtitle =>
      'Access to 40,000+ airports worldwide — including remote runways';

  @override
  String get private_jet_popular_types_title => 'Popular aircraft types';

  @override
  String private_jet_passengers_up_to(int count) {
    return 'Up to $count pax';
  }

  @override
  String get private_jet_price_from => 'From';

  @override
  String get private_jet_per_hour => '/ hour';

  @override
  String get private_jet_concierge_title => 'Personal concierge 24/7';

  @override
  String get private_jet_concierge_description =>
      'Don\'t want to fill out forms? We get it. Our concierge team is available around the clock to select your aircraft, arrange transfers, catering, and last-minute changes.';

  @override
  String get private_jet_concierge_feature_fast_reply =>
      'Fast response — under 2 minutes on average';

  @override
  String get private_jet_concierge_feature_multilingual =>
      'Multilingual team — English, Arabic, Russian, French';

  @override
  String get private_jet_concierge_feature_full_service =>
      'Full service — flights, hotels, transfers, events';

  @override
  String get private_jet_concierge_feature_personal_manager =>
      'Personal manager for your entire trip';

  @override
  String get private_jet_concierge_whatsapp_button => 'Message on WhatsApp';

  @override
  String get private_jet_concierge_online_status => 'ONLINE NOW';

  @override
  String get private_jet_details_range_label => 'Range';

  @override
  String get private_jet_details_speed_label => 'Speed';

  @override
  String get private_jet_details_baggage_label => 'Baggage';

  @override
  String get private_jet_details_cabin_dimensions_title => 'Cabin dimensions';

  @override
  String get private_jet_details_cabin_height_label => 'Height';

  @override
  String get private_jet_details_cabin_width_label => 'Width';

  @override
  String get private_jet_details_cabin_length_label => 'Length';

  @override
  String get private_jet_details_send_request_button => 'Submit request';

  @override
  String get private_jet_details_call_button => 'Call';

  @override
  String get private_jet_ordering_placeholder => 'Private jet request booking — coming soon';

  @override
  String units_km(int value) {
    return '$value km';
  }

  @override
  String units_kmh(int value) {
    return '$value km/h';
  }

  @override
  String units_kg(int value) {
    return '$value kg';
  }
}

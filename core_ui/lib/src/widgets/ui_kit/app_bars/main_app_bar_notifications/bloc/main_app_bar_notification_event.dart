part of 'main_app_bar_notification_bloc.dart';

@freezed
abstract class MainAppBarNotificationEvent with _$MainAppBarNotificationEvent {
  const factory MainAppBarNotificationEvent.loadIndicator() = _LoadIndicator;
  const factory MainAppBarNotificationEvent.authStateChanged(AuthenticationState authState) =
      _SupportEventAuthStateChanged;
}

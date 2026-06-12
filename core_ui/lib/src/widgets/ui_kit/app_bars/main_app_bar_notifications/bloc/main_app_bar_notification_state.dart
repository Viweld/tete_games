part of 'main_app_bar_notification_bloc.dart';

@freezed
abstract class MainAppBarNotificationState with _$MainAppBarNotificationState {
  const factory MainAppBarNotificationState({
    required AuthenticationState authState,
    UnreadIndicator? unreadIndicator,
  }) = _MainAppBarNotificationState;
}

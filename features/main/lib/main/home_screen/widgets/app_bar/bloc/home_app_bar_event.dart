part of 'home_app_bar_bloc.dart';

@freezed
sealed class HomeAppBarEvent with _$HomeAppBarEvent {
  const factory HomeAppBarEvent.profileChanged({required PlayerProfile? profile}) =
      HomeAppBarProfileChanged;

  const factory HomeAppBarEvent.connectionFrameReceived({required AppConnectionFrame frame}) =
      HomeAppBarConnectionFrameReceived;
}

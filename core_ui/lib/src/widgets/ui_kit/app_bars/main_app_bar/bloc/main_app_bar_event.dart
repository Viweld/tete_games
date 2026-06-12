part of 'main_app_bar_bloc.dart';

@freezed
abstract class MainAppBarEvent with _$MainAppBarEvent {
  const factory MainAppBarEvent.profileChanged(UserProfile? profile) = _ProfileChanged;
}

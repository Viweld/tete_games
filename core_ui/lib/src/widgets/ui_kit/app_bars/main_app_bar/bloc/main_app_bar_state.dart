part of 'main_app_bar_bloc.dart';

@freezed
abstract class MainAppBarState with _$MainAppBarState {
  const factory MainAppBarState({UserProfile? profile}) = _MainAppBarState;
}

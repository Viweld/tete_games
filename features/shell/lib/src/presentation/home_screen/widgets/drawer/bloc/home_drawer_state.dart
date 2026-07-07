part of 'home_drawer_bloc.dart';

@freezed
abstract class HomeDrawerState with _$HomeDrawerState {
  const factory HomeDrawerState({
    PlayerProfile? profile,
    @Default(false) bool arePermissionsGranted,
    @Default(false) bool isAdapterEnabled,
    @Default(false) bool isConnected,
    HomeDrawerEffect? effect,
  }) = _HomeDrawerState;
}

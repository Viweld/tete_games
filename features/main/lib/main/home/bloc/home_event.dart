part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.refreshRequested() = _RefreshRequested;
  const factory HomeEvent.effectHandled() = _EffectHandled;
}

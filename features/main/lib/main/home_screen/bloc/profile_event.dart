part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init() = _Init;
  const factory ProfileEvent.refreshRequested() = _RefreshRequested;
  const factory ProfileEvent.effectHandled() = _EffectHandled;
}

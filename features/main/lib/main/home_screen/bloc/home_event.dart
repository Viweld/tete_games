part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.startServerSessionTapped() = _StartServerSessionTapped;
  const factory HomeEvent.startClientSessionTapped() = _StartClientSessionTapped;
  const factory HomeEvent.transportConnected() = _TransportConnected;
  const factory HomeEvent.effectHandled() = _EffectHandled;
}

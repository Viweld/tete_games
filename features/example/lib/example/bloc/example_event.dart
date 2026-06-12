part of 'example_bloc.dart';

@freezed
sealed class ExampleEvent with _$ExampleEvent {
  const factory ExampleEvent.initialize() = _Initialize;
  const factory ExampleEvent.refresh() = _Refresh;
  const factory ExampleEvent.navigateExample() = _NavigateExample;
  const factory ExampleEvent.effectHandled() = _EffectHandled;
}

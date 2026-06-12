part of 'example_bloc.dart';

@freezed
abstract class ExampleState with _$ExampleState {
  const factory ExampleState({
    @Default(FragmentState.active) FragmentState state,
    ExampleEffect? effect,
  }) = _ExampleState;
}

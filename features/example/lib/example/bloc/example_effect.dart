part of 'example_bloc.dart';

@freezed
sealed class ExampleEffect with _$ExampleEffect {
  const factory ExampleEffect.navigateExample() = NavigateExampleEffect;
}

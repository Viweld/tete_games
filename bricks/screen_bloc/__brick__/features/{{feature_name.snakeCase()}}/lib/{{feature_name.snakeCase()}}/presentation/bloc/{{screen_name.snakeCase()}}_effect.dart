part of '{{screen_name.snakeCase()}}_bloc.dart';

@freezed
sealed class {{screen_name.pascalCase()}}Effect with _${{screen_name.pascalCase()}}Effect {
  const factory {{screen_name.pascalCase()}}Effect.navigateBack() = NavigateBackEffect;
}

part of '{{screen_name.snakeCase()}}_bloc.dart';

@freezed
abstract class {{screen_name.pascalCase()}}State with _${{screen_name.pascalCase()}}State {
  const factory {{screen_name.pascalCase()}}State({
    @Default(false) bool isLoading,
    String? error,
    {{screen_name.pascalCase()}}Effect? effect,
  }) = _{{screen_name.pascalCase()}}State;
}

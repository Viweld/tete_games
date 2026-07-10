part of '{{screen_name.snakeCase()}}_bloc.dart';

@freezed
sealed class {{screen_name.pascalCase()}}Event with _${{screen_name.pascalCase()}}Event {
  const factory {{screen_name.pascalCase()}}Event.init() = _Init;
  const factory {{screen_name.pascalCase()}}Event.refreshRequested() = _RefreshRequested;
  const factory {{screen_name.pascalCase()}}Event.effectHandled() = _EffectHandled;
}

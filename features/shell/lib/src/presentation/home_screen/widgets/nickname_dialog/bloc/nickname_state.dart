part of 'nickname_bloc.dart';

@freezed
abstract class NicknameState with _$NicknameState {
  const factory NicknameState({
    @Default('') String nickname,
    NicknameValidationKind? validationKind,
    @Default(false) bool isSaveEnabled,
    NicknameEffect? effect,
  }) = _NicknameState;
}

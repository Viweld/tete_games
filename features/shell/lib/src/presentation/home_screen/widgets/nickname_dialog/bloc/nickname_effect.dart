part of 'nickname_bloc.dart';

@freezed
sealed class NicknameEffect with _$NicknameEffect {
  const factory NicknameEffect.saved() = NicknameSavedEffect;

  const factory NicknameEffect.saveFailed() = NicknameSaveFailedEffect;
}

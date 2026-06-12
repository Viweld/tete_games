part of 'nickname_bloc.dart';

@freezed
sealed class NicknameEvent with _$NicknameEvent {
  const factory NicknameEvent.nicknameChanged({required String nickname}) = NicknameChanged;

  const factory NicknameEvent.saveTapped() = NicknameSaveTapped;

  const factory NicknameEvent.effectHandled() = NicknameEffectHandled;
}

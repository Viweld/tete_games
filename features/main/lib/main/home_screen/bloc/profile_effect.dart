part of 'profile_bloc.dart';

@freezed
sealed class ProfileEffect with _$ProfileEffect {
  const factory ProfileEffect.showNicknameDialog({required NicknameDialogContext context}) =
      ShowNicknameDialogEffect;
}

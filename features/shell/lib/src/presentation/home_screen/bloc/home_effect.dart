part of 'home_bloc.dart';

@freezed
sealed class HomeEffect with _$HomeEffect {
  const factory HomeEffect.showNicknameDialog({required NicknameDialogContext context}) =
      ShowNicknameDialogEffect;

  const factory HomeEffect.closeConnectionOverlay() = CloseConnectionOverlayEffect;

  const factory HomeEffect.showToast({required PeerToastKind kind}) = ShowToastEffect;
}

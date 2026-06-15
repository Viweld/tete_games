part of 'home_bloc.dart';

@freezed
sealed class HomeEffect with _$HomeEffect {
  const factory HomeEffect.showConnectionOverlay() = ShowConnectionOverlayEffect;
  const factory HomeEffect.closeConnectionOverlay() = CloseConnectionOverlayEffect;
  const factory HomeEffect.showProfileDialog() = ShowProfileDialogEffect;
  const factory HomeEffect.showToast({required PeerToastKind kind}) = ShowToastEffect;
  const factory HomeEffect.requestNicknameForOverlayRole() = RequestNicknameForOverlayRoleEffect;
}

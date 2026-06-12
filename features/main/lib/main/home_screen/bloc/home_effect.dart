part of 'home_bloc.dart';

@freezed
sealed class HomeEffect with _$HomeEffect {
  const factory HomeEffect.showNicknameDialog({required PeerRole role}) = ShowNicknameDialogEffect;

  const factory HomeEffect.showServerSessionDialog() = ShowServerSessionDialogEffect;

  const factory HomeEffect.showClientSessionDialog() = ShowClientSessionDialogEffect;

  const factory HomeEffect.navigateToGamesList() = NavigateToGamesListEffect;
}

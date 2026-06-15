part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isConnected,
    String? remoteDisplayName,
    String? remotePlayerId,
    @Default(OverlayRenderViewState()) OverlayRenderViewState overlay,
    @Default(false) bool isGamesEnabled,
    @Default(FrameProjectionInput()) FrameProjectionInput projection,
    @Default(0) int lastHandledFrameId,
    @Default(false) bool isOverlayVisible,
    HomeEffect? effect,
  }) = _HomeState;
}

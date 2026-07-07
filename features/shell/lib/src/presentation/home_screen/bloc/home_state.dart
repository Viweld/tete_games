part of 'home_bloc.dart';

enum HomePendingOverlayRole { host, client }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    PlayerProfile? profile,
    @Default(false) bool isConnected,
    String? remoteDisplayName,
    String? remotePlayerId,
    @Default(OverlayRenderViewState()) OverlayRenderViewState overlay,
    @Default(false) bool isGamesEnabled,
    @Default(HomeOverlayProjection()) HomeOverlayProjection projection,
    @Default(0) int lastHandledFrameId,
    @Default(false) bool isOverlayVisible,
    HomePendingOverlayRole? pendingOverlayRole,
    HomeEffect? effect,
  }) = _HomeState;
}

import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_effect.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._peerConnectionService) : super(const HomeState()) {
    on<HomeEvent>(
      (HomeEvent event, Emitter<HomeState> emit) => event.map(
        init: (_) => _onInit(emit),
        frameReceived: (_FrameReceived event) => _onFrameReceived(event.frame, emit),
        connectMenuTapped: (_) => _onConnectMenuTapped(emit),
        hostTapped: (_) => _onHostTapped(emit),
        clientTapped: (_) => _onClientTapped(emit),
        disconnectMenuTapped: (_) => _onDisconnectMenuTapped(emit),
        profileMenuTapped: (_) => _onProfileMenuTapped(emit),
        deviceHighlightChanged: (_DeviceHighlightChanged event) =>
            _onDeviceHighlightChanged(event.deviceId, emit),
        inviteDeviceTapped: (_) => _onInviteDeviceTapped(emit),
        acceptInvitationTapped: (_) => _onAcceptInvitationTapped(emit),
        rejectInvitationTapped: (_) => _onRejectInvitationTapped(emit),
        overlayOpened: (_) => _onOverlayOpened(emit),
        overlayClosed: (_) => _onOverlayClosed(emit),
        overlayDismissTapped: (_) => _onOverlayDismissTapped(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _framesSubscription = _peerConnectionService.frames.listen(_onFrame);
    add(const HomeEvent.init());
  }

  final PeerConnectionService _peerConnectionService;

  late final StreamSubscription<AppConnectionFrame> _framesSubscription;

  @override
  Future<void> close() async {
    await _framesSubscription.cancel();
    return super.close();
  }

  void _onFrame(AppConnectionFrame frame) {
    if (isClosed) return;
    add(HomeEvent.frameReceived(frame));
  }

  Future<void> _onInit(Emitter<HomeState> emit) async {}

  Future<void> _onFrameReceived(AppConnectionFrame frame, Emitter<HomeState> emit) async {
    final bool shouldRunEffects = frame.frameId > state.lastHandledFrameId;
    final FrameProjectionInput projection = _validatedProjection(
      state.projection,
      frame.state.overlay.devices,
    );

    emit(
      state.copyWith(
        isConnected: frame.state.shared.isConnected,
        remoteDisplayName: frame.state.shared.remoteDisplayName,
        remotePlayerId: frame.state.shared.remotePlayerId,
        overlay: frame.state.overlay,
        isGamesEnabled: frame.state.home.isGamesEnabled,
        projection: projection,
        lastHandledFrameId: shouldRunEffects ? frame.frameId : state.lastHandledFrameId,
      ),
    );

    if (!shouldRunEffects) return;

    final HomeEffect? effect = _mapFrameEventsToEffect(frame);
    if (effect != null) {
      emit(state.copyWith(effect: effect));
    }
  }

  FrameProjectionInput _validatedProjection(
    FrameProjectionInput projection,
    List<PeerDevice> devices,
  ) {
    final String? highlightedId = projection.highlightedDeviceId;
    if (highlightedId == null) return projection;

    final bool stillExists = devices.any((PeerDevice device) => device.id == highlightedId);
    if (stillExists) return projection;

    return projection.copyWith(clearHighlight: true);
  }

  HomeEffect? _mapFrameEventsToEffect(AppConnectionFrame frame) {
    if (frame.criticalEvents.isNotEmpty) {
      for (final PeerUiEvent event in frame.criticalEvents) {
        if (event is PeerUiCloseOverlayEvent) {
          return const HomeEffect.closeConnectionOverlay();
        }
      }
    }

    if (frame.softEvents.isNotEmpty) {
      final PeerUiEvent first = frame.softEvents.first;
      if (first is PeerUiShowToastEvent) {
        return HomeEffect.showToast(kind: first.kind);
      }
    }

    return null;
  }

  void _onConnectMenuTapped(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: const HomeEffect.showConnectionOverlay()));
  }

  Future<void> _onHostTapped(Emitter<HomeState> emit) async {
    await _peerConnectionService.startHostSession(projection: state.projection);
  }

  Future<void> _onClientTapped(Emitter<HomeState> emit) async {
    await _peerConnectionService.startClientSession(projection: state.projection);
  }

  Future<void> _onDisconnectMenuTapped(Emitter<HomeState> emit) async {
    await _peerConnectionService.closeSession(
      origin: PeerSessionCloseOrigin.user,
      reason: PeerSessionCloseReason.userDisconnect,
      projection: state.projection,
    );
  }

  void _onProfileMenuTapped(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: const HomeEffect.showProfileDialog()));
  }

  void _onDeviceHighlightChanged(String? deviceId, Emitter<HomeState> emit) {
    emit(state.copyWith(projection: FrameProjectionInput(highlightedDeviceId: deviceId)));
  }

  Future<void> _onInviteDeviceTapped(Emitter<HomeState> emit) async {
    final String? deviceId = state.projection.highlightedDeviceId;
    if (deviceId == null) return;

    await _peerConnectionService.inviteDevice(deviceId: deviceId, projection: state.projection);
  }

  Future<void> _onAcceptInvitationTapped(Emitter<HomeState> emit) async {
    await _peerConnectionService.acceptInvitation(projection: state.projection);
  }

  Future<void> _onRejectInvitationTapped(Emitter<HomeState> emit) async {
    await _peerConnectionService.rejectInvitation(projection: state.projection);
  }

  void _onOverlayOpened(Emitter<HomeState> emit) {
    emit(state.copyWith(isOverlayVisible: true));
  }

  Future<void> _onOverlayDismissTapped(Emitter<HomeState> emit) async {
    final bool wasConnected = state.isConnected;
    final FrameProjectionInput projection = state.projection;

    emit(state.copyWith(isOverlayVisible: false, projection: const FrameProjectionInput()));

    if (wasConnected) return;

    await _peerConnectionService.closeSession(
      origin: PeerSessionCloseOrigin.user,
      reason: PeerSessionCloseReason.userDismissedOverlay,
      projection: projection,
    );
  }

  void _onOverlayClosed(Emitter<HomeState> emit) {
    emit(state.copyWith(isOverlayVisible: false, projection: const FrameProjectionInput()));
  }

  void _onEffectHandled(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: null));
  }
}

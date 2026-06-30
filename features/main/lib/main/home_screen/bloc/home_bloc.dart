import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog_context.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_effect.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PeerConnectionService _peerConnectionService;
  final ProfileRepository _profileRepository;
  StreamSubscription<PlayerProfile?>? _profileSubscription;
  StreamSubscription<AppConnectionFrame>? _framesSubscription;

  HomeBloc(this._peerConnectionService, this._profileRepository)
    : super(HomeState(profile: _profileRepository.cachedProfile)) {
    on<HomeEvent>(
      (HomeEvent event, Emitter<HomeState> emit) => event.map(
        init: (_) => _onInit(emit),
        profileChanged: (_ProfileChanged event) => _onProfileChanged(event, emit),
        frameReceived: (_FrameReceived event) => _onFrameReceived(event, emit),
        connectMenuTapped: (_) => _onConnectMenuTapped(emit),
        hostTapped: (_) => _onHostTapped(emit),
        clientTapped: (_) => _onClientTapped(emit),
        disconnectMenuTapped: (_) => _onDisconnectMenuTapped(emit),
        profileMenuTapped: (_) => _onProfileMenuTapped(emit),
        deviceHighlightChanged: (_DeviceHighlightChanged event) =>
            _onDeviceHighlightChanged(event, emit),
        inviteDeviceTapped: (_) => _onInviteDeviceTapped(emit),
        acceptInvitationTapped: (_) => _onAcceptInvitationTapped(emit),
        rejectInvitationTapped: (_) => _onRejectInvitationTapped(emit),
        overlayOpened: (_) => _onOverlayOpened(emit),
        overlayClosed: (_) => _onOverlayClosed(emit),
        overlayDismissTapped: (_) => _onOverlayDismissTapped(emit),
        overlayRoleNicknameConfirmed: (_) => _onOverlayRoleNicknameConfirmed(emit),
        overlayRoleNicknameCancelled: (_) => _onOverlayRoleNicknameCancelled(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _profileSubscription = _profileRepository.profileStream.listen((PlayerProfile? profile) {
      if (isClosed) return;
      add(HomeEvent.profileChanged(profile: profile));
    });

    _framesSubscription = _peerConnectionService.frames.listen(_onFrame);
    add(const HomeEvent.init());
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    await _framesSubscription?.cancel();
    return super.close();
  }

  void _onFrame(AppConnectionFrame frame) {
    if (isClosed) return;
    add(HomeEvent.frameReceived(frame));
  }

  Future<void> _onInit(Emitter<HomeState> emit) async {
    emit(state.copyWith(profile: _profileRepository.cachedProfile));

    final bool isFirstLaunch = await _profileRepository.isFirstLaunch();

    if (state.profile == null && isFirstLaunch) {
      emit(
        state.copyWith(
          effect: const HomeEffect.showNicknameDialog(context: NicknameDialogContext.firstLaunch),
        ),
      );
    }
  }

  void _onProfileChanged(_ProfileChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(profile: event.profile));
  }

  Future<void> _onFrameReceived(_FrameReceived event, Emitter<HomeState> emit) async {
    final AppConnectionFrame frame = event.frame;
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

  Future<void> _onConnectMenuTapped(Emitter<HomeState> emit) async {
    if (!_hasProfile) {
      emit(
        state.copyWith(
          effect: const HomeEffect.showNicknameDialog(context: NicknameDialogContext.connect),
        ),
      );
      return;
    }

    await _openConnectionOverlay(emit);
  }

  Future<void> _onHostTapped(Emitter<HomeState> emit) async {
    if (!_hasProfile) {
      emit(
        state.copyWith(
          effect: const HomeEffect.showNicknameDialog(context: NicknameDialogContext.overlayRole),
          pendingOverlayRole: HomePendingOverlayRole.host,
        ),
      );
      return;
    }

    await _peerConnectionService.startHostSession(projection: state.projection);
  }

  Future<void> _onClientTapped(Emitter<HomeState> emit) async {
    if (!_hasProfile) {
      emit(
        state.copyWith(
          effect: const HomeEffect.showNicknameDialog(context: NicknameDialogContext.overlayRole),
          pendingOverlayRole: HomePendingOverlayRole.client,
        ),
      );
      return;
    }

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
    emit(
      state.copyWith(
        effect: const HomeEffect.showNicknameDialog(context: NicknameDialogContext.profileMenu),
      ),
    );
  }

  void _onDeviceHighlightChanged(_DeviceHighlightChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(projection: FrameProjectionInput(highlightedDeviceId: event.deviceId)));
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

  Future<void> _onOverlayOpened(Emitter<HomeState> emit) async {
    await _openConnectionOverlay(emit);
  }

  Future<void> _onOverlayDismissTapped(Emitter<HomeState> emit) async {
    final FrameProjectionInput projection = state.projection;

    emit(state.copyWith(isOverlayVisible: false, projection: const FrameProjectionInput()));

    await _peerConnectionService.closeSession(
      origin: PeerSessionCloseOrigin.user,
      reason: PeerSessionCloseReason.userDismissedOverlay,
      projection: projection,
    );
  }

  void _onOverlayClosed(Emitter<HomeState> emit) {
    emit(state.copyWith(isOverlayVisible: false, projection: const FrameProjectionInput()));
  }

  Future<void> _onOverlayRoleNicknameConfirmed(Emitter<HomeState> emit) async {
    final HomePendingOverlayRole? pendingRole = state.pendingOverlayRole;
    emit(state.copyWith(pendingOverlayRole: null));
    if (pendingRole == null) return;

    switch (pendingRole) {
      case HomePendingOverlayRole.host:
        await _peerConnectionService.startHostSession(projection: state.projection);
      case HomePendingOverlayRole.client:
        await _peerConnectionService.startClientSession(projection: state.projection);
    }
  }

  void _onOverlayRoleNicknameCancelled(Emitter<HomeState> emit) {
    emit(state.copyWith(pendingOverlayRole: null));
  }

  void _onEffectHandled(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _openConnectionOverlay(Emitter<HomeState> emit) async {
    emit(state.copyWith(isOverlayVisible: true));
    await _peerConnectionService.openRoleSelection(projection: state.projection);
  }

  bool get _hasProfile => state.profile != null;
}

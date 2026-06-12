import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'client_session_event.dart';
part 'client_session_state.dart';
part 'client_session_effect.dart';
part 'client_session_bloc.freezed.dart';

@injectable
class ClientSessionBloc extends Bloc<ClientSessionEvent, ClientSessionState> {
  ClientSessionBloc(this._clientSessionRepository, this._peerTransportRepository)
    : super(const ClientSessionState(phase: ClientSessionPhase.initializing)) {
    on<ClientSessionEvent>(
      (ClientSessionEvent event, Emitter<ClientSessionState> emit) => event.map(
        init: (_) => _onInit(emit),
        devicesUpdated: (ClientSessionDevicesUpdated event) => _onDevicesUpdated(event, emit),
        deviceSelected: (ClientSessionDeviceSelected event) => _onDeviceSelected(event, emit),
        connectTapped: (_) => _onConnectTapped(emit),
        invitationAccepted: (_) => _onInvitationAccepted(emit),
        invitationRejected: (_) => _onInvitationRejected(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _devicesSubscription = _clientSessionRepository.discoveredDevices.listen(_onDevicesChanged);
    _messagesSubscription = _peerTransportRepository.sessionMessages.listen(_onSessionMessage);

    add(const ClientSessionEvent.init());
  }

  final IPeerClientSessionRepository _clientSessionRepository;
  final IPeerTransportRepository _peerTransportRepository;

  late final StreamSubscription<List<PeerDevice>> _devicesSubscription;
  late final StreamSubscription<PeerSessionMessage> _messagesSubscription;

  @override
  Future<void> close() async {
    await _devicesSubscription.cancel();
    await _messagesSubscription.cancel();
    await _clientSessionRepository.stopDiscovery();
    return super.close();
  }

  void _onDevicesChanged(List<PeerDevice> devices) {
    if (isClosed) return;
    add(ClientSessionEvent.devicesUpdated(devices: devices));
  }

  void _onSessionMessage(PeerSessionMessage message) {
    if (isClosed) return;
    switch (message) {
      case PeerAcceptance():
        add(const ClientSessionEvent.invitationAccepted());
      case PeerRejection():
        add(const ClientSessionEvent.invitationRejected());
      default:
        break;
    }
  }

  Future<void> _onInit(Emitter<ClientSessionState> emit) async {
    try {
      await _clientSessionRepository.startDiscovery();
      emit(state.copyWith(phase: ClientSessionPhase.browsing));
    } on Object {
      emit(
        state.copyWith(
          phase: ClientSessionPhase.error,
          errorKind: ClientSessionErrorKind.discoveryFailed,
        ),
      );
      rethrow;
    }
  }

  void _onDevicesUpdated(ClientSessionDevicesUpdated event, Emitter<ClientSessionState> emit) {
    emit(state.copyWith(devices: event.devices));
  }

  void _onDeviceSelected(ClientSessionDeviceSelected event, Emitter<ClientSessionState> emit) {
    final PeerDevice? currentSelection = state.selectedDevice;
    final PeerDevice? nextSelection = currentSelection?.id == event.device.id ? null : event.device;

    emit(state.copyWith(selectedDevice: nextSelection));
  }

  Future<void> _onConnectTapped(Emitter<ClientSessionState> emit) async {
    final PeerDevice? device = state.selectedDevice;
    if (device == null) return;

    emit(state.copyWith(phase: ClientSessionPhase.remoteConfirmationPending));

    try {
      await _clientSessionRepository.connectToDevice(device);
    } on Object {
      emit(
        state.copyWith(
          phase: ClientSessionPhase.error,
          errorKind: ClientSessionErrorKind.connectionFailed,
        ),
      );
      rethrow;
    }
  }

  void _onInvitationAccepted(Emitter<ClientSessionState> emit) {
    emit(state.copyWith(effect: const ClientSessionEffect.closeDialog()));
  }

  void _onInvitationRejected(Emitter<ClientSessionState> emit) {
    emit(state.copyWith(phase: ClientSessionPhase.invitationRejected));
  }

  void _onEffectHandled(Emitter<ClientSessionState> emit) {
    emit(state.copyWith(effect: null));
  }
}

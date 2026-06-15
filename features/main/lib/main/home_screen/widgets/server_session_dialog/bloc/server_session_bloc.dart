import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'server_session_event.dart';
part 'server_session_state.dart';
part 'server_session_effect.dart';
part 'server_session_bloc.freezed.dart';

@injectable
class ServerSessionBloc extends Bloc<ServerSessionEvent, ServerSessionState> {
  ServerSessionBloc(
    this._serverSessionRepository,
    this._peerTransportRepository,
    this._blocErrorHandler,
  ) : super(const ServerSessionState(phase: ServerSessionPhase.invitationPending)) {
    on<ServerSessionEvent>(
      (ServerSessionEvent event, Emitter<ServerSessionState> emit) => event.map(
        init: (_) => _onInit(emit),
        invitationReceived: (ServerSessionInvitationReceived event) =>
            _onInvitationReceived(event, emit),
        acceptTapped: (_) => _onAcceptTapped(emit),
        rejectTapped: (_) => _onRejectTapped(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _messagesSubscription = _peerTransportRepository.sessionMessages.listen(_onSessionMessage);
    add(const ServerSessionEvent.init());
  }

  final IPeerServerSessionRepository _serverSessionRepository;
  final IPeerTransportRepository _peerTransportRepository;
  final BlocErrorHandler _blocErrorHandler;

  late final StreamSubscription<PeerSessionMessage> _messagesSubscription;

  @override
  Future<void> close() async {
    await _messagesSubscription.cancel();
    await _serverSessionRepository.stopAdvertising();
    return super.close();
  }

  void _onSessionMessage(PeerSessionMessage message) {
    if (isClosed) return;
    if (message is PeerInvitation) {
      add(ServerSessionEvent.invitationReceived(remoteEndpoint: message.remoteEndpoint));
    }
  }

  Future<void> _onInit(Emitter<ServerSessionState> emit) async {
    try {
      await _serverSessionRepository.startAdvertising();
    } on Object catch (error, stackTrace) {
      if (_blocErrorHandler.handle(error, stackTrace: stackTrace)) {
        rethrow;
      }
      emit(
        state.copyWith(
          phase: ServerSessionPhase.error,
          errorKind: ServerSessionErrorKind.bluetoothUnavailable,
        ),
      );
    }
  }

  void _onInvitationReceived(
    ServerSessionInvitationReceived event,
    Emitter<ServerSessionState> emit,
  ) {
    emit(
      state.copyWith(phase: ServerSessionPhase.userDecision, remoteEndpoint: event.remoteEndpoint),
    );
  }

  Future<void> _onAcceptTapped(Emitter<ServerSessionState> emit) async {
    await _serverSessionRepository.acceptInvitation();
    emit(state.copyWith(effect: const ServerSessionEffect.closeDialog()));
  }

  Future<void> _onRejectTapped(Emitter<ServerSessionState> emit) async {
    await _serverSessionRepository.rejectInvitation();
    emit(state.copyWith(phase: ServerSessionPhase.invitationPending, remoteEndpoint: null));
  }

  void _onEffectHandled(Emitter<ServerSessionState> emit) {
    emit(state.copyWith(effect: null));
  }
}

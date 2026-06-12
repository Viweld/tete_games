import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_effect.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._playerProfileRepository, this._peerTransportRepository)
    : super(const HomeState(phase: HomePhase.initializing)) {
    on<HomeEvent>(
      (HomeEvent event, Emitter<HomeState> emit) => event.map(
        init: (_) => _onInit(emit),
        startServerSessionTapped: (_) => _onStartServerSessionTapped(emit),
        startClientSessionTapped: (_) => _onStartClientSessionTapped(emit),
        transportConnected: (_) => _onTransportConnected(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _connectionSubscription = _peerTransportRepository.connectionState.listen(
      _onConnectionStateChanged,
    );
    add(const HomeEvent.init());
  }

  final IPlayerProfileRepository _playerProfileRepository;
  final IPeerTransportRepository _peerTransportRepository;

  late final StreamSubscription<PeerConnectionState> _connectionSubscription;

  @override
  Future<void> close() async {
    await _connectionSubscription.cancel();
    await _peerTransportRepository.dispose();
    return super.close();
  }

  void _onConnectionStateChanged(PeerConnectionState connectionState) {
    if (isClosed) return;
    if (connectionState is PeerConnected) {
      add(const HomeEvent.transportConnected());
    }
  }

  Future<void> _onInit(Emitter<HomeState> emit) async {
    emit(state.copyWith(phase: HomePhase.initializing, isLoading: true, errorKind: null));
    await _playerProfileRepository.getCurrentPlayer();
    emit(state.copyWith(phase: HomePhase.ready, isLoading: false));
  }

  Future<void> _onStartServerSessionTapped(Emitter<HomeState> emit) async {
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    if (profile == null) {
      emit(state.copyWith(effect: const HomeEffect.showNicknameDialog(role: PeerRole.server)));
      return;
    }

    emit(state.copyWith(effect: const HomeEffect.showServerSessionDialog()));
  }

  Future<void> _onStartClientSessionTapped(Emitter<HomeState> emit) async {
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    if (profile == null) {
      emit(state.copyWith(effect: const HomeEffect.showNicknameDialog(role: PeerRole.client)));
      return;
    }

    emit(state.copyWith(effect: const HomeEffect.showClientSessionDialog()));
  }

  void _onTransportConnected(Emitter<HomeState> emit) {
    emit(
      state.copyWith(phase: HomePhase.connected, effect: const HomeEffect.navigateToGamesList()),
    );
  }

  void _onEffectHandled(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: null));
  }
}

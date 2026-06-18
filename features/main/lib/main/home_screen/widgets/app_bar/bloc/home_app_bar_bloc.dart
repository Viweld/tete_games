import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_app_bar_event.dart';
part 'home_app_bar_state.dart';
part 'home_app_bar_bloc.freezed.dart';

@injectable
class HomeAppBarBloc extends Bloc<HomeAppBarEvent, HomeAppBarState> {
  HomeAppBarBloc(this._profileRepository, this._peerConnectionService)
    : super(const HomeAppBarState()) {
    on<HomeAppBarEvent>(
      (HomeAppBarEvent event, Emitter<HomeAppBarState> emit) => event.map(
        profileChanged: (HomeAppBarProfileChanged event) => _onProfileChanged(event, emit),
        connectionFrameReceived: (HomeAppBarConnectionFrameReceived event) =>
            _onConnectionFrameReceived(event, emit),
      ),
    );

    _profileSubscription = _profileRepository.profileStream.listen((PlayerProfile? profile) {
      if (isClosed) return;
      add(HomeAppBarEvent.profileChanged(profile: profile));
    });

    _framesSubscription = _peerConnectionService.frames.listen((AppConnectionFrame frame) {
      if (isClosed) return;
      add(HomeAppBarEvent.connectionFrameReceived(frame: frame));
    });
  }

  final ProfileRepository _profileRepository;
  final PeerConnectionService _peerConnectionService;

  StreamSubscription<PlayerProfile?>? _profileSubscription;
  StreamSubscription<AppConnectionFrame>? _framesSubscription;

  void _onProfileChanged(HomeAppBarProfileChanged event, Emitter<HomeAppBarState> emit) {
    emit(state.copyWith(localDisplayName: event.profile?.displayName));
  }

  void _onConnectionFrameReceived(
    HomeAppBarConnectionFrameReceived event,
    Emitter<HomeAppBarState> emit,
  ) {
    final SharedConnectionViewState shared = event.frame.state.shared;
    emit(
      state.copyWith(isConnected: shared.isConnected, remoteDisplayName: shared.remoteDisplayName),
    );
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    await _framesSubscription?.cancel();
    return super.close();
  }
}

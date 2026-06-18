import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'profile_section_event.dart';
part 'profile_section_state.dart';
part 'profile_section_effect.dart';
part 'profile_section_bloc.freezed.dart';

@injectable
class ProfileSectionBloc extends Bloc<ProfileSectionEvent, ProfileSectionState> {
  ProfileSectionBloc(this._profileRepository, this._peerConnectionService)
    : super(const ProfileSectionState()) {
    on<ProfileSectionEvent>(
      (ProfileSectionEvent event, Emitter<ProfileSectionState> emit) => event.map(
        profileChanged: (ProfileSectionProfileChanged event) => _onProfileChanged(event, emit),
        connectionStateChanged: (ProfileSectionConnectionStateChanged event) =>
            _onConnectionStateChanged(event, emit),
        editProfileTapped: (_) => _onEditProfileTapped(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _profileSubscription = _profileRepository.profileStream.listen((PlayerProfile? profile) {
      if (isClosed) return;
      add(ProfileSectionEvent.profileChanged(profile: profile));
    });

    _framesSubscription = _peerConnectionService.frames.listen((AppConnectionFrame frame) {
      if (isClosed) return;
      add(ProfileSectionEvent.connectionStateChanged(isConnected: frame.state.shared.isConnected));
    });
  }

  final ProfileRepository _profileRepository;
  final PeerConnectionService _peerConnectionService;

  StreamSubscription<PlayerProfile?>? _profileSubscription;
  StreamSubscription<AppConnectionFrame>? _framesSubscription;

  void _onProfileChanged(ProfileSectionProfileChanged event, Emitter<ProfileSectionState> emit) {
    emit(state.copyWith(profile: event.profile));
  }

  void _onConnectionStateChanged(
    ProfileSectionConnectionStateChanged event,
    Emitter<ProfileSectionState> emit,
  ) {
    emit(state.copyWith(isConnected: event.isConnected));
  }

  void _onEditProfileTapped(Emitter<ProfileSectionState> emit) {
    if (state.isConnected) return;

    emit(state.copyWith(effect: const ProfileSectionEffect.editProfileRequested()));
  }

  void _onEffectHandled(Emitter<ProfileSectionState> emit) {
    emit(state.copyWith(effect: null));
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    await _framesSubscription?.cancel();
    return super.close();
  }
}

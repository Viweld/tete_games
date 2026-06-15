import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_effect.dart';
part 'profile_bloc.freezed.dart';

enum NicknameDialogContext { firstLaunch, connect, overlayRole, profileMenu }

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._playerProfileRepository) : super(const ProfileState(isLoading: true)) {
    on<ProfileEvent>(
      (ProfileEvent event, Emitter<ProfileState> emit) => event.map(
        init: (_) => _onInit(emit),
        refreshRequested: (_) => _onRefreshRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    add(const ProfileEvent.init());
  }

  final IPlayerProfileRepository _playerProfileRepository;

  Future<void> _onInit(Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    final bool isFirstLaunch = await _playerProfileRepository.isFirstLaunch();

    ProfileEffect? effect;
    if (profile == null && isFirstLaunch) {
      effect = const ProfileEffect.showNicknameDialog(context: NicknameDialogContext.firstLaunch);
    }

    emit(state.copyWith(isLoading: false, profile: profile, effect: effect));
  }

  Future<void> _onRefreshRequested(Emitter<ProfileState> emit) async {
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    emit(state.copyWith(profile: profile));
  }

  void _onEffectHandled(Emitter<ProfileState> emit) {
    emit(state.copyWith(effect: null));
  }
}

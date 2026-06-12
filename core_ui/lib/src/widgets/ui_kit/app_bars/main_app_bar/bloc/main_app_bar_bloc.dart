import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'main_app_bar_bloc.freezed.dart';

part 'main_app_bar_event.dart';

part 'main_app_bar_state.dart';

@injectable
class MainAppBarBloc extends Bloc<MainAppBarEvent, MainAppBarState> {
  late final StreamSubscription<UserProfile?> _profileStreamSubscription;

  MainAppBarBloc({required ProfileRepository profileRepository})
    : super(MainAppBarState(profile: profileRepository.profileData)) {
    on<MainAppBarEvent>((MainAppBarEvent event, Emitter<MainAppBarState> emit) {
      event.map(profileChanged: (_ProfileChanged e) => _onProfileChanged(e, emit));
    });

    _profileStreamSubscription = profileRepository.profileStream.listen(_profileStreamListener);
  }

  void _profileStreamListener(UserProfile? profile) {
    if (isClosed) return;
    add(MainAppBarEvent.profileChanged(profile));
  }

  @override
  Future<void> close() async {
    await _profileStreamSubscription.cancel();
    await super.close();
  }

  void _onProfileChanged(_ProfileChanged event, Emitter<MainAppBarState> emit) =>
      emit(super.state.copyWith(profile: event.profile));
}

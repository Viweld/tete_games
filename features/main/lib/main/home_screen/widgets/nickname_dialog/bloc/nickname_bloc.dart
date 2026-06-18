import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'nickname_event.dart';
part 'nickname_state.dart';
part 'nickname_effect.dart';
part 'nickname_bloc.freezed.dart';

enum NicknameValidationKind { empty, tooLong, wrongFormat }

@injectable
class NicknameBloc extends Bloc<NicknameEvent, NicknameState> {
  NicknameBloc(this._profileRepository) : super(const NicknameState()) {
    on<NicknameEvent>(
      (NicknameEvent event, Emitter<NicknameState> emit) => event.map(
        nicknameChanged: (NicknameChanged event) => _onNicknameChanged(event, emit),
        saveTapped: (_) => _onSaveTapped(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );
  }

  final ProfileRepository _profileRepository;

  void _onNicknameChanged(NicknameChanged event, Emitter<NicknameState> emit) {
    final String nickname = event.nickname.trim();
    final NicknameValidationKind? validationKind = _validateNickname(nickname);

    emit(
      state.copyWith(
        nickname: nickname,
        validationKind: validationKind,
        isSaveEnabled: validationKind == null && nickname.isNotEmpty,
      ),
    );
  }

  Future<void> _onSaveTapped(Emitter<NicknameState> emit) async {
    if (!state.isSaveEnabled) return;

    try {
      final PlayerProfile? currentProfile = await _profileRepository.getCurrentPlayer();
      final PlayerProfile profile = PlayerProfile(
        id: currentProfile?.id ?? const Uuid().v4(),
        displayName: state.nickname,
      );
      await _profileRepository.savePlayer(profile);
      await _profileRepository.setFirstLaunchCompleted();
      emit(state.copyWith(effect: const NicknameEffect.saved()));
    } on Object {
      emit(state.copyWith(effect: const NicknameEffect.saveFailed()));
      rethrow;
    }
  }

  NicknameValidationKind? _validateNickname(String nickname) {
    if (nickname.isEmpty) {
      return NicknameValidationKind.empty;
    }
    if (nickname.length > 20) {
      return NicknameValidationKind.tooLong;
    }
    if (nickname.contains(' ')) {
      return NicknameValidationKind.wrongFormat;
    }
    return null;
  }

  void _onEffectHandled(Emitter<NicknameState> emit) {
    emit(state.copyWith(effect: null));
  }
}

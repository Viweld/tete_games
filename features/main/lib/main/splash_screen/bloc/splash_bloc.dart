import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

part 'splash_bloc.freezed.dart';
part 'splash_effect.dart';
part 'splash_events.dart';
part 'splash_states.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._settingsRepository,
    this._localeController,
    this._profileRepository,
    this._appAnimations,
  ) : super(const SplashState.notInitialized()) {
    on<SplashEvent>(
      (SplashEvent event, Emitter<SplashState> emit) => event.map(
        initialize: (_) => _onInitialize(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    add(const SplashEvent.initialize());
  }

  final SettingsRepository _settingsRepository;
  final LocaleController _localeController;
  final ProfileRepository _profileRepository;
  final AppAnimations _appAnimations;

  Future<void> _onInitialize(Emitter<SplashState> emit) async {
    await _prepareLanguage();
    await Future.wait(<Future<void>>[_profileRepository.initialize(), _appAnimations.preload()]);

    NativeSplashService.removeSplash();

    emit(const SplashState.initialized(effect: SplashEffect.navigateRoot()));
  }

  void _onEffectHandled(Emitter<SplashState> emit) => emit(state.copyWith(effect: null));

  Future<void> _prepareLanguage() async {
    final String? savedCode = await _settingsRepository.getSavedLanguageCode();

    final String systemCode =
        LanguageCodeMapper.toLanguageCode(PlatformDispatcher.instance.locale) ?? 'en';

    final String resolvedCode = savedCode ?? systemCode;

    if (savedCode == null) {
      await _settingsRepository.saveLanguageCode(systemCode);
    }

    _localeController.setLocaleFromCode(resolvedCode);
  }
}

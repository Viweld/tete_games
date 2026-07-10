import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/localization/locale_controller.dart';
import 'package:core_ui/src/theme/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/presentation/splash_screen/bloc/splash_bloc.dart';

import 'support/shell_test_fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeSettingsRepository settingsRepository;
  late LocaleController localeController;
  late FakeProfileRepository profileRepository;
  late AppAnimations appAnimations;

  setUp(() {
    settingsRepository = FakeSettingsRepository();
    localeController = LocaleController(initial: const Locale('en'));
    profileRepository = FakeProfileRepository();
    appAnimations = AppAnimations();
  });

  tearDown(() async {
    await profileRepository.dispose();
  });

  SplashBloc buildBloc() =>
      SplashBloc(settingsRepository, localeController, profileRepository, appAnimations);

  group('SplashBloc', () {
    blocTest<SplashBloc, SplashState>(
      'initialize preloads data and navigates to root',
      build: buildBloc,
      expect: () => <SplashState>[
        const SplashState.initialized(effect: SplashEffect.navigateRoot()),
      ],
    );

    blocTest<SplashBloc, SplashState>(
      'initialize uses saved language without persisting again',
      build: () {
        settingsRepository.savedLanguageCode = 'ru';
        return buildBloc();
      },
      expect: () => <SplashState>[
        const SplashState.initialized(effect: SplashEffect.navigateRoot()),
      ],
      verify: (_) {
        expect(settingsRepository.saveLanguageCodeCalls, 0);
        expect(localeController.locale, const Locale('ru'));
      },
    );

    blocTest<SplashBloc, SplashState>(
      'initialize saves system language when storage is empty',
      build: buildBloc,
      expect: () => <SplashState>[
        const SplashState.initialized(effect: SplashEffect.navigateRoot()),
      ],
      verify: (_) {
        expect(settingsRepository.saveLanguageCodeCalls, 1);
        expect(settingsRepository.lastSavedLanguageCode, isNotNull);
      },
    );
  });
}

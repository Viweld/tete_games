import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/domain/models/player_profile.dart';
import 'package:shell/src/presentation/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart';

import 'support/shell_test_fakes.dart';

void main() {
  group('NicknameBloc', () {
    late FakeProfileRepository profileRepository;

    setUp(() {
      profileRepository = FakeProfileRepository();
    });

    tearDown(() => profileRepository.dispose());

    blocTest<NicknameBloc, NicknameState>(
      'enables save for valid nickname',
      build: () => NicknameBloc(profileRepository),
      act: (NicknameBloc bloc) => bloc.add(const NicknameEvent.nicknameChanged(nickname: 'Neo')),
      expect: () => <NicknameState>[const NicknameState(nickname: 'Neo', isSaveEnabled: true)],
    );

    blocTest<NicknameBloc, NicknameState>(
      'rejects empty nickname',
      build: () => NicknameBloc(profileRepository),
      act: (NicknameBloc bloc) => bloc.add(const NicknameEvent.nicknameChanged(nickname: '   ')),
      expect: () => <NicknameState>[
        const NicknameState(validationKind: NicknameValidationKind.empty),
      ],
    );

    blocTest<NicknameBloc, NicknameState>(
      'rejects nickname longer than 20 characters',
      build: () => NicknameBloc(profileRepository),
      act: (NicknameBloc bloc) =>
          bloc.add(const NicknameEvent.nicknameChanged(nickname: 'abcdefghijklmnopqrstu')),
      expect: () => <NicknameState>[
        const NicknameState(
          nickname: 'abcdefghijklmnopqrstu',
          validationKind: NicknameValidationKind.tooLong,
        ),
      ],
    );

    blocTest<NicknameBloc, NicknameState>(
      'rejects nickname with spaces',
      build: () => NicknameBloc(profileRepository),
      act: (NicknameBloc bloc) =>
          bloc.add(const NicknameEvent.nicknameChanged(nickname: 'Neo Neo')),
      expect: () => <NicknameState>[
        const NicknameState(
          nickname: 'Neo Neo',
          validationKind: NicknameValidationKind.wrongFormat,
        ),
      ],
    );

    blocTest<NicknameBloc, NicknameState>(
      'save keeps existing profile id',
      build: () {
        profileRepository = FakeProfileRepository(
          cachedProfile: const PlayerProfile(id: 'existing-id', displayName: 'Old'),
        );
        return NicknameBloc(profileRepository);
      },
      seed: () => const NicknameState(nickname: 'Neo', isSaveEnabled: true),
      act: (NicknameBloc bloc) => bloc.add(const NicknameEvent.saveTapped()),
      expect: () => <NicknameState>[
        const NicknameState(nickname: 'Neo', isSaveEnabled: true, effect: NicknameEffect.saved()),
      ],
      verify: (_) async {
        final PlayerProfile? saved = await profileRepository.getCurrentPlayer();
        expect(saved?.id, 'existing-id');
        expect(saved?.displayName, 'Neo');
      },
    );
  });
}

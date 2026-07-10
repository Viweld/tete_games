import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/domain/models/player_profile.dart';
import 'package:shell/src/presentation/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart';

import 'support/shell_test_fakes.dart';

void main() {
  group('HomeAppBarBloc', () {
    late FakeProfileRepository profileRepository;
    late FakePeerConnectionService peerConnectionService;

    setUp(() {
      profileRepository = FakeProfileRepository(
        cachedProfile: const PlayerProfile(id: 'player-1', displayName: 'Neo'),
      );
      peerConnectionService = FakePeerConnectionService();
    });

    tearDown(() async {
      await profileRepository.dispose();
      await peerConnectionService.dispose();
    });

    HomeAppBarBloc buildBloc() => HomeAppBarBloc(profileRepository, peerConnectionService);

    test('initial state uses cached profile display name', () {
      final HomeAppBarBloc bloc = buildBloc();

      expect(bloc.state.localDisplayName, 'Neo');
      expect(bloc.state.isConnected, isFalse);

      bloc.close();
    });

    blocTest<HomeAppBarBloc, HomeAppBarState>(
      'profileChanged updates local display name',
      build: buildBloc,
      act: (HomeAppBarBloc bloc) => bloc.add(
        const HomeAppBarEvent.profileChanged(
          profile: PlayerProfile(id: 'player-1', displayName: 'Trinity'),
        ),
      ),
      expect: () => <HomeAppBarState>[const HomeAppBarState(localDisplayName: 'Trinity')],
    );

    blocTest<HomeAppBarBloc, HomeAppBarState>(
      'connectionFrameReceived maps shared connection state',
      build: buildBloc,
      act: (HomeAppBarBloc bloc) => bloc.add(
        HomeAppBarEvent.connectionFrameReceived(
          frame: buildTestFrame(frameId: 1, isConnected: true, remoteDisplayName: 'Remote'),
        ),
      ),
      expect: () => <HomeAppBarState>[
        const HomeAppBarState(
          localDisplayName: 'Neo',
          isConnected: true,
          remoteDisplayName: 'Remote',
        ),
      ],
    );

    blocTest<HomeAppBarBloc, HomeAppBarState>(
      'profile stream updates local display name',
      build: buildBloc,
      act: (HomeAppBarBloc bloc) async {
        profileRepository.emitProfile(const PlayerProfile(id: 'player-1', displayName: 'Trinity'));
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => <HomeAppBarState>[const HomeAppBarState(localDisplayName: 'Trinity')],
    );

    blocTest<HomeAppBarBloc, HomeAppBarState>(
      'connection frames stream updates remote display name',
      build: buildBloc,
      act: (HomeAppBarBloc bloc) async {
        peerConnectionService.emitFrame(
          buildTestFrame(frameId: 2, isConnected: true, remoteDisplayName: 'Morpheus'),
        );
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => <HomeAppBarState>[
        const HomeAppBarState(
          localDisplayName: 'Neo',
          isConnected: true,
          remoteDisplayName: 'Morpheus',
        ),
      ],
    );

    blocTest<HomeAppBarBloc, HomeAppBarState>(
      'connection frames stream clears remote name when disconnected',
      build: buildBloc,
      seed: () => const HomeAppBarState(
        localDisplayName: 'Neo',
        isConnected: true,
        remoteDisplayName: 'Morpheus',
      ),
      act: (HomeAppBarBloc bloc) async {
        peerConnectionService.emitFrame(buildTestFrame(frameId: 3));
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => <HomeAppBarState>[const HomeAppBarState(localDisplayName: 'Neo')],
    );
  });
}

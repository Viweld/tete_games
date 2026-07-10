import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peer/peer_connection.dart';
import 'package:shell/src/domain/models/player_profile.dart';
import 'package:shell/src/presentation/home_screen/bloc/home_bloc.dart';
import 'package:shell/src/presentation/home_screen/models/home_overlay_projection.dart';
import 'package:shell/src/presentation/home_screen/widgets/nickname_dialog/nickname_dialog_context.dart';

import 'support/shell_test_fakes.dart';

void main() {
  group('HomeBloc', () {
    late FakePeerConnectionService peerConnectionService;
    late FakeProfileRepository profileRepository;

    setUp(() {
      peerConnectionService = FakePeerConnectionService();
      profileRepository = FakeProfileRepository(
        cachedProfile: const PlayerProfile(id: 'player-1', displayName: 'Neo'),
      );
    });

    tearDown(() async {
      await profileRepository.dispose();
      await peerConnectionService.dispose();
    });

    HomeBloc buildBloc() => HomeBloc(peerConnectionService, profileRepository);

    blocTest<HomeBloc, HomeState>(
      'connectMenuTapped without profile shows nickname dialog',
      build: () {
        profileRepository = FakeProfileRepository();
        return buildBloc();
      },
      skip: 1,
      act: (HomeBloc bloc) async {
        await Future<void>.delayed(Duration.zero);
        bloc.add(const HomeEvent.connectMenuTapped());
      },
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.showNicknameDialog(context: NicknameDialogContext.connect),
        ),
      ],
      verify: (_) {
        expect(peerConnectionService.openRoleSelectionCalls, 0);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'connectMenuTapped with profile opens overlay and role selection',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) async {
        await Future<void>.delayed(Duration.zero);
        bloc.add(const HomeEvent.connectMenuTapped());
      },
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.isOverlayVisible, 'overlay', isTrue),
      ],
      verify: (_) {
        expect(peerConnectionService.openRoleSelectionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'hostTapped without profile requests nickname before starting host session',
      build: () {
        profileRepository = FakeProfileRepository();
        return buildBloc();
      },
      skip: 1,
      act: (HomeBloc bloc) async {
        await Future<void>.delayed(Duration.zero);
        bloc.add(const HomeEvent.hostTapped());
      },
      expect: () => <Matcher>[
        isA<HomeState>()
            .having(
              (HomeState state) => state.effect,
              'effect',
              const HomeEffect.showNicknameDialog(context: NicknameDialogContext.overlayRole),
            )
            .having(
              (HomeState state) => state.pendingOverlayRole,
              'pending role',
              HomePendingOverlayRole.host,
            ),
      ],
      verify: (_) {
        expect(peerConnectionService.startHostSessionCalls, 0);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'overlayRoleNicknameConfirmed starts pending host session',
      build: buildBloc,
      seed: () => const HomeState(pendingOverlayRole: HomePendingOverlayRole.host),
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayRoleNicknameConfirmed()),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.pendingOverlayRole,
          'pending role cleared',
          isNull,
        ),
      ],
      verify: (_) {
        expect(peerConnectionService.startHostSessionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'frame replay guard skips duplicate frame effects',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) async {
        bloc.add(
          HomeEvent.frameReceived(
            buildTestFrame(
              frameId: 1,
              softEvents: <PeerUiEvent>[
                const PeerUiShowToastEvent(
                  eventSequence: 0,
                  eventId: '0:showToast',
                  frameId: 1,
                  sessionId: 'session-1',
                  kind: PeerToastKind.peerDisconnected,
                ),
              ],
            ),
          ),
        );
        await Future<void>.delayed(Duration.zero);
        bloc.add(
          HomeEvent.frameReceived(
            buildTestFrame(
              frameId: 1,
              softEvents: <PeerUiEvent>[
                const PeerUiShowToastEvent(
                  eventSequence: 0,
                  eventId: '0:showToast',
                  frameId: 1,
                  sessionId: 'session-1',
                  kind: PeerToastKind.linkLost,
                ),
              ],
            ),
          ),
        );
      },
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.lastHandledFrameId, 'frame id', 1),
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.showToast(kind: PeerToastKind.peerDisconnected),
        ),
      ],
      verify: (HomeBloc bloc) {
        expect(bloc.state.effect, const HomeEffect.showToast(kind: PeerToastKind.peerDisconnected));
      },
    );

    blocTest<HomeBloc, HomeState>(
      'frameReceived maps toast soft event to HomeEffect',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(
        HomeEvent.frameReceived(
          buildTestFrame(
            frameId: 1,
            softEvents: <PeerUiEvent>[
              const PeerUiShowToastEvent(
                eventSequence: 0,
                eventId: '0:showToast',
                frameId: 1,
                sessionId: 'session-1',
                kind: PeerToastKind.peerDisconnected,
              ),
            ],
          ),
        ),
      ),
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.lastHandledFrameId, 'frame id', 1),
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.showToast(kind: PeerToastKind.peerDisconnected),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'frameReceived maps close overlay critical event to HomeEffect',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(
        HomeEvent.frameReceived(
          buildTestFrame(
            frameId: 3,
            criticalEvents: <PeerUiEvent>[
              const PeerUiCloseOverlayEvent(
                eventSequence: 0,
                eventId: '0:closeOverlay',
                frameId: 3,
                sessionId: 'session-1',
              ),
            ],
          ),
        ),
      ),
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.lastHandledFrameId, 'frame id', 3),
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.closeConnectionOverlay(),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'clears highlight when device disappears from frame',
      build: buildBloc,
      seed: () =>
          const HomeState(projection: HomeOverlayProjection(highlightedDeviceId: 'missing')),
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(
        HomeEvent.frameReceived(
          buildTestFrame(
            frameId: 4,
            devices: const <PeerDevice>[PeerDevice(id: 'device-1', name: 'Player', isOurApp: true)],
          ),
        ),
      ),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.projection.highlightedDeviceId,
          'highlight',
          isNull,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'inviteDeviceTapped forwards highlighted device id',
      build: buildBloc,
      seed: () =>
          const HomeState(projection: HomeOverlayProjection(highlightedDeviceId: 'device-1')),
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.inviteDeviceTapped()),
      verify: (_) {
        expect(peerConnectionService.inviteDeviceCalls, 1);
        expect(peerConnectionService.lastInvitedDeviceId, 'device-1');
      },
    );

    blocTest<HomeBloc, HomeState>(
      'disconnectMenuTapped closes active peer session',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.disconnectMenuTapped()),
      verify: (_) {
        expect(peerConnectionService.closeSessionCalls, 1);
        expect(peerConnectionService.lastCloseReason, PeerSessionCloseReason.userDisconnect);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'retryConnectionTapped delegates to peer service',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.retryConnectionTapped()),
      verify: (_) {
        expect(peerConnectionService.retryLastSessionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'appResumed delegates to peer service',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.appResumed()),
      verify: (_) {
        expect(peerConnectionService.onAppResumedCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'init shows first launch nickname when profile is absent',
      build: () {
        profileRepository = FakeProfileRepository(isFirstLaunchResult: true);
        return buildBloc();
      },
      expect: () => <Matcher>[
        isA<HomeState>(),
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.showNicknameDialog(context: NicknameDialogContext.firstLaunch),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'clientTapped without profile requests nickname before starting client session',
      build: () {
        profileRepository = FakeProfileRepository();
        return buildBloc();
      },
      skip: 1,
      act: (HomeBloc bloc) async {
        await Future<void>.delayed(Duration.zero);
        bloc.add(const HomeEvent.clientTapped());
      },
      expect: () => <Matcher>[
        isA<HomeState>()
            .having(
              (HomeState state) => state.effect,
              'effect',
              const HomeEffect.showNicknameDialog(context: NicknameDialogContext.overlayRole),
            )
            .having(
              (HomeState state) => state.pendingOverlayRole,
              'pending role',
              HomePendingOverlayRole.client,
            ),
      ],
      verify: (_) {
        expect(peerConnectionService.startClientSessionCalls, 0);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'clientTapped with profile starts client session',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.clientTapped()),
      verify: (_) {
        expect(peerConnectionService.startClientSessionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'hostTapped with profile starts host session',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.hostTapped()),
      verify: (_) {
        expect(peerConnectionService.startHostSessionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'profileMenuTapped shows profile nickname dialog',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.profileMenuTapped()),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.effect,
          'effect',
          const HomeEffect.showNicknameDialog(context: NicknameDialogContext.profileMenu),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'profileChanged updates cached profile in state',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(
        const HomeEvent.profileChanged(
          profile: PlayerProfile(id: 'player-2', displayName: 'Trinity'),
        ),
      ),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.profile?.displayName,
          'display name',
          'Trinity',
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'deviceHighlightChanged updates overlay projection',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.deviceHighlightChanged('device-1')),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.projection.highlightedDeviceId,
          'highlight',
          'device-1',
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'acceptInvitationTapped delegates to peer service',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.acceptInvitationTapped()),
      verify: (_) {
        expect(peerConnectionService.acceptInvitationCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'rejectInvitationTapped delegates to peer service',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.rejectInvitationTapped()),
      verify: (_) {
        expect(peerConnectionService.rejectInvitationCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'overlayOpened opens role selection overlay',
      build: buildBloc,
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayOpened()),
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.isOverlayVisible, 'overlay', isTrue),
      ],
      verify: (_) {
        expect(peerConnectionService.openRoleSelectionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'overlayClosed hides overlay and clears projection',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeState(
        isOverlayVisible: true,
        projection: HomeOverlayProjection(highlightedDeviceId: 'device-1'),
      ),
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayClosed()),
      expect: () => <Matcher>[
        isA<HomeState>()
            .having((HomeState state) => state.isOverlayVisible, 'overlay', isFalse)
            .having((HomeState state) => state.projection.highlightedDeviceId, 'highlight', isNull),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'overlayDismissTapped closes overlay session',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeState(
        isOverlayVisible: true,
        projection: HomeOverlayProjection(highlightedDeviceId: 'device-1'),
      ),
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayDismissTapped()),
      expect: () => <Matcher>[
        isA<HomeState>()
            .having((HomeState state) => state.isOverlayVisible, 'overlay', isFalse)
            .having((HomeState state) => state.projection.highlightedDeviceId, 'highlight', isNull),
      ],
      verify: (_) {
        expect(peerConnectionService.closeSessionCalls, 1);
        expect(peerConnectionService.lastCloseReason, PeerSessionCloseReason.userDismissedOverlay);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'overlayRoleNicknameConfirmed starts pending client session',
      build: buildBloc,
      seed: () => const HomeState(pendingOverlayRole: HomePendingOverlayRole.client),
      skip: 1,
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayRoleNicknameConfirmed()),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.pendingOverlayRole,
          'pending role cleared',
          isNull,
        ),
      ],
      verify: (_) {
        expect(peerConnectionService.startClientSessionCalls, 1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'overlayRoleNicknameCancelled clears pending overlay role',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeState(pendingOverlayRole: HomePendingOverlayRole.host),
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.overlayRoleNicknameCancelled()),
      expect: () => <Matcher>[
        isA<HomeState>().having(
          (HomeState state) => state.pendingOverlayRole,
          'pending role',
          isNull,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'effectHandled clears home effect',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeState(effect: HomeEffect.showToast(kind: PeerToastKind.linkLost)),
      act: (HomeBloc bloc) => bloc.add(const HomeEvent.effectHandled()),
      expect: () => <Matcher>[
        isA<HomeState>().having((HomeState state) => state.effect, 'effect', isNull),
      ],
    );
  });
}

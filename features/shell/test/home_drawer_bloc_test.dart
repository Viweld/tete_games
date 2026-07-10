import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/domain/models/bluetooth/bluetooth_permission_request_result.dart';
import 'package:shell/src/domain/models/bluetooth/bluetooth_status_snapshot.dart';
import 'package:shell/src/domain/models/player_profile.dart';
import 'package:shell/src/presentation/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart';

import 'support/shell_test_fakes.dart';

void main() {
  group('HomeDrawerBloc', () {
    late FakeProfileRepository profileRepository;
    late FakeBluetoothStatusService bluetoothStatusService;
    late FakePeerConnectionService peerConnectionService;

    setUp(() {
      profileRepository = FakeProfileRepository(
        cachedProfile: const PlayerProfile(id: 'player-1', displayName: 'Neo'),
      );
      bluetoothStatusService = FakeBluetoothStatusService(
        snapshot: const BluetoothStatusSnapshot(
          arePermissionsGranted: true,
          isAdapterEnabled: true,
        ),
      );
      peerConnectionService = FakePeerConnectionService();
    });

    tearDown(() async {
      await profileRepository.dispose();
      await bluetoothStatusService.dispose();
      await peerConnectionService.dispose();
    });

    HomeDrawerBloc buildBloc() =>
        HomeDrawerBloc(profileRepository, bluetoothStatusService, peerConnectionService);

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'init loads bluetooth snapshot',
      build: buildBloc,
      expect: () => <Matcher>[
        isA<HomeDrawerState>()
            .having((HomeDrawerState state) => state.arePermissionsGranted, 'permissions', isTrue)
            .having((HomeDrawerState state) => state.isAdapterEnabled, 'adapter', isTrue),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'permissionIconTapped shows info when permissions already granted',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeDrawerState(arePermissionsGranted: true),
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.permissionIconTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showPermissionsGrantedInfo(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'permissionIconTapped opens settings when permanently denied',
      build: () {
        bluetoothStatusService = FakeBluetoothStatusService(
          snapshot: const BluetoothStatusSnapshot(
            arePermissionsGranted: false,
            isAdapterEnabled: true,
          ),
          arePermissionsPermanentlyDeniedResult: true,
        );
        return buildBloc();
      },
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.permissionIconTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showPermissionsDeniedSettings(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'permissionIconTapped shows settings after permanently denied request',
      build: () {
        bluetoothStatusService = FakeBluetoothStatusService(
          snapshot: const BluetoothStatusSnapshot(
            arePermissionsGranted: false,
            isAdapterEnabled: true,
          ),
          requestPermissionsResult: BluetoothPermissionRequestResult.permanentlyDenied,
        );
        return buildBloc();
      },
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.permissionIconTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showPermissionsDeniedSettings(),
        ),
      ],
      verify: (_) {
        expect(bluetoothStatusService.refreshPermissionsCalls, 1);
      },
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'adapterIconTapped shows enabled info when adapter is on',
      build: () {
        bluetoothStatusService = FakeBluetoothStatusService(
          snapshot: const BluetoothStatusSnapshot(
            arePermissionsGranted: true,
            isAdapterEnabled: true,
          ),
        );
        return buildBloc();
      },
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.adapterIconTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showAdapterEnabledInfo(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'profileChanged updates drawer profile',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(
        const HomeDrawerEvent.profileChanged(
          profile: PlayerProfile(id: 'player-2', displayName: 'Trinity'),
        ),
      ),
      expect: () => <HomeDrawerState>[
        const HomeDrawerState(
          profile: PlayerProfile(id: 'player-2', displayName: 'Trinity'),
          arePermissionsGranted: true,
          isAdapterEnabled: true,
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'connectionStateChanged updates isConnected from frames',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) async {
        peerConnectionService.emitFrame(buildTestFrame(frameId: 1, isConnected: true));
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.isConnected,
          'connected',
          isTrue,
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'adapterIconTapped shows disabled info when adapter is off',
      build: () {
        bluetoothStatusService = FakeBluetoothStatusService(
          snapshot: const BluetoothStatusSnapshot(
            arePermissionsGranted: true,
            isAdapterEnabled: false,
          ),
        );
        return buildBloc();
      },
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.adapterIconTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showAdapterDisabledInfo(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'editProfileTapped is blocked while connected',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeDrawerState(isConnected: true),
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.editProfileTapped()),
      expect: () => <HomeDrawerState>[],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'editProfileTapped requests profile edit when disconnected',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.editProfileTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.editProfileRequested(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'disconnectTapped shows confirmation effect',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.disconnectTapped()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having(
          (HomeDrawerState state) => state.effect,
          'effect',
          const HomeDrawerEffect.showDisconnectConfirmation(),
        ),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'openAppSettingsRequested delegates to bluetooth service',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.openAppSettingsRequested()),
      verify: (_) {
        expect(bluetoothStatusService.openAppSettingsCalls, 1);
      },
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'snapshotChanged updates bluetooth flags',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(
        const HomeDrawerEvent.snapshotChanged(
          arePermissionsGranted: false,
          isAdapterEnabled: false,
        ),
      ),
      expect: () => <Matcher>[
        isA<HomeDrawerState>()
            .having((HomeDrawerState state) => state.arePermissionsGranted, 'permissions', isFalse)
            .having((HomeDrawerState state) => state.isAdapterEnabled, 'adapter', isFalse),
      ],
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'appResumed refreshes bluetooth permissions',
      build: buildBloc,
      skip: 1,
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.appResumed()),
      verify: (_) {
        expect(bluetoothStatusService.refreshPermissionsCalls, 1);
      },
    );

    blocTest<HomeDrawerBloc, HomeDrawerState>(
      'effectHandled clears drawer effect',
      build: buildBloc,
      skip: 1,
      seed: () => const HomeDrawerState(effect: HomeDrawerEffect.showDisconnectConfirmation()),
      act: (HomeDrawerBloc bloc) => bloc.add(const HomeDrawerEvent.effectHandled()),
      expect: () => <Matcher>[
        isA<HomeDrawerState>().having((HomeDrawerState state) => state.effect, 'effect', isNull),
      ],
    );
  });
}

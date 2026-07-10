import 'dart:async';

import 'package:peer/peer_connection.dart';
import 'package:shell/shell_domain.dart';

final class FakeProfileRepository implements ProfileRepository {
  FakeProfileRepository({PlayerProfile? cachedProfile, this.isFirstLaunchResult = false})
    : storedProfile = cachedProfile;

  PlayerProfile? storedProfile;
  bool isFirstLaunchResult;

  @override
  PlayerProfile? get cachedProfile => storedProfile;

  final StreamController<PlayerProfile?> _controller = StreamController<PlayerProfile?>.broadcast();

  @override
  Stream<PlayerProfile?> get profileStream => _controller.stream;

  @override
  Future<void> initialize() async {}

  @override
  Future<PlayerProfile?> getCurrentPlayer() async => storedProfile;

  @override
  Future<void> savePlayer(PlayerProfile player) async {
    storedProfile = player;
    _controller.add(player);
  }

  @override
  Future<bool> isFirstLaunch() async => isFirstLaunchResult;

  @override
  Future<void> setFirstLaunchCompleted() async {}

  void emitProfile(PlayerProfile? profile) {
    storedProfile = profile;
    _controller.add(profile);
  }

  Future<void> dispose() => _controller.close();
}

final class FakeSettingsRepository implements SettingsRepository {
  FakeSettingsRepository({this.savedLanguageCode});

  String? savedLanguageCode;
  int saveLanguageCodeCalls = 0;
  String? lastSavedLanguageCode;

  @override
  Future<String?> getSavedLanguageCode() async => savedLanguageCode;

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    saveLanguageCodeCalls++;
    lastSavedLanguageCode = languageCode;
    savedLanguageCode = languageCode;
  }
}

final class FakePeerConnectionService implements PeerConnectionService {
  final StreamController<AppConnectionFrame> _framesController =
      StreamController<AppConnectionFrame>.broadcast();

  int openRoleSelectionCalls = 0;
  int startHostSessionCalls = 0;
  int startClientSessionCalls = 0;
  int inviteDeviceCalls = 0;
  int retryLastSessionCalls = 0;
  int onAppResumedCalls = 0;
  int closeSessionCalls = 0;
  int acceptInvitationCalls = 0;
  int rejectInvitationCalls = 0;
  String? lastInvitedDeviceId;
  PeerSessionCloseReason? lastCloseReason;

  @override
  Stream<AppConnectionFrame> get frames => _framesController.stream;

  void emitFrame(AppConnectionFrame frame) => _framesController.add(frame);

  @override
  Future<void> openRoleSelection() async => openRoleSelectionCalls++;

  @override
  Future<void> startHostSession() async => startHostSessionCalls++;

  @override
  Future<void> startClientSession() async => startClientSessionCalls++;

  @override
  Future<void> acceptInvitation() async => acceptInvitationCalls++;

  @override
  Future<void> rejectInvitation() async => rejectInvitationCalls++;

  @override
  Future<void> inviteDevice({required String deviceId}) async {
    inviteDeviceCalls++;
    lastInvitedDeviceId = deviceId;
  }

  @override
  Future<void> closeSession({
    required PeerSessionCloseOrigin origin,
    required PeerSessionCloseReason reason,
  }) async {
    closeSessionCalls++;
    lastCloseReason = reason;
  }

  @override
  Future<void> retryLastSession() async => retryLastSessionCalls++;

  @override
  Future<void> onAppResumed() async => onAppResumedCalls++;

  @override
  Future<void> dispose() async => _framesController.close();
}

final class FakeBluetoothStatusService implements BluetoothStatusService {
  FakeBluetoothStatusService({
    this.snapshot = const BluetoothStatusSnapshot(
      arePermissionsGranted: false,
      isAdapterEnabled: false,
    ),
    this.arePermissionsPermanentlyDeniedResult = false,
    this.requestPermissionsResult = BluetoothPermissionRequestResult.granted,
  });

  BluetoothStatusSnapshot snapshot;
  bool arePermissionsPermanentlyDeniedResult;
  BluetoothPermissionRequestResult requestPermissionsResult;

  int refreshPermissionsCalls = 0;
  int openAppSettingsCalls = 0;

  final StreamController<BluetoothStatusSnapshot> _statusController =
      StreamController<BluetoothStatusSnapshot>.broadcast();

  @override
  Stream<BluetoothStatusSnapshot> get statusStream => _statusController.stream;

  void emitSnapshot(BluetoothStatusSnapshot value) {
    snapshot = value;
    _statusController.add(value);
  }

  @override
  Future<BluetoothStatusSnapshot> readSnapshot() async => snapshot;

  @override
  Future<void> refreshPermissions() async => refreshPermissionsCalls++;

  @override
  Future<bool> arePermissionsPermanentlyDenied() async => arePermissionsPermanentlyDeniedResult;

  @override
  Future<BluetoothPermissionRequestResult> requestPermissions() async => requestPermissionsResult;

  @override
  Future<bool> openAppSettings() async {
    openAppSettingsCalls++;
    return true;
  }

  Future<void> dispose() => _statusController.close();
}

AppConnectionFrame buildTestFrame({
  required int frameId,
  bool isConnected = false,
  String? remoteDisplayName,
  String? remotePlayerId,
  List<PeerDevice> devices = const <PeerDevice>[],
  List<PeerUiEvent> criticalEvents = const <PeerUiEvent>[],
  List<PeerUiEvent> softEvents = const <PeerUiEvent>[],
}) {
  return AppConnectionFrame(
    frameId: frameId,
    sessionId: 'session-1',
    state: AppConnectionViewState(
      shared: SharedConnectionViewState(
        isConnected: isConnected,
        remoteDisplayName: remoteDisplayName,
        remotePlayerId: remotePlayerId,
      ),
      overlay: OverlayRenderViewState(devices: devices),
    ),
    criticalEvents: criticalEvents,
    softEvents: softEvents,
  );
}

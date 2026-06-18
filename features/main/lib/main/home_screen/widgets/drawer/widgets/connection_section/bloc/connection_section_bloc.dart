import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'connection_section_event.dart';
part 'connection_section_state.dart';
part 'connection_section_effect.dart';
part 'connection_section_bloc.freezed.dart';

@injectable
class ConnectionSectionBloc extends Bloc<ConnectionSectionEvent, ConnectionSectionState> {
  ConnectionSectionBloc(this._bluetoothStatusService, this._peerConnectionService)
    : super(const ConnectionSectionState()) {
    on<ConnectionSectionEvent>(
      (ConnectionSectionEvent event, Emitter<ConnectionSectionState> emit) => event.map(
        init: (_) => _onInit(emit),
        appResumed: (_) => _onAppResumed(emit),
        connectionStateChanged: (ConnectionSectionConnectionStateChanged event) =>
            _onConnectionStateChanged(event, emit),
        snapshotChanged: (ConnectionSectionSnapshotChanged event) =>
            _onSnapshotChanged(event, emit),
        permissionIconTapped: (_) => _onPermissionIconTapped(emit),
        adapterIconTapped: (_) => _onAdapterIconTapped(emit),
        disconnectTapped: (_) => _onDisconnectTapped(emit),
        openAppSettingsRequested: (_) => _onOpenAppSettingsRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _statusSubscription = _bluetoothStatusService.statusStream.listen(
      (BluetoothStatusSnapshot snapshot) => add(
        ConnectionSectionEvent.snapshotChanged(
          arePermissionsGranted: snapshot.arePermissionsGranted,
          isAdapterEnabled: snapshot.isAdapterEnabled,
        ),
      ),
    );

    _framesSubscription = _peerConnectionService.frames.listen((AppConnectionFrame frame) {
      if (isClosed) return;
      add(
        ConnectionSectionEvent.connectionStateChanged(isConnected: frame.state.shared.isConnected),
      );
    });

    add(const ConnectionSectionEvent.init());
  }

  final BluetoothStatusService _bluetoothStatusService;
  final PeerConnectionService _peerConnectionService;
  StreamSubscription<BluetoothStatusSnapshot>? _statusSubscription;
  StreamSubscription<AppConnectionFrame>? _framesSubscription;

  Future<void> _onInit(Emitter<ConnectionSectionState> emit) async {
    try {
      final BluetoothStatusSnapshot snapshot = await _bluetoothStatusService.readSnapshot();
      emit(
        state.copyWith(
          arePermissionsGranted: snapshot.arePermissionsGranted,
          isAdapterEnabled: snapshot.isAdapterEnabled,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onAppResumed(Emitter<ConnectionSectionState> emit) async {
    try {
      await _bluetoothStatusService.refreshPermissions();
    } on Object {
      rethrow;
    }
  }

  void _onConnectionStateChanged(
    ConnectionSectionConnectionStateChanged event,
    Emitter<ConnectionSectionState> emit,
  ) {
    emit(state.copyWith(isConnected: event.isConnected));
  }

  void _onSnapshotChanged(
    ConnectionSectionSnapshotChanged event,
    Emitter<ConnectionSectionState> emit,
  ) {
    emit(
      state.copyWith(
        arePermissionsGranted: event.arePermissionsGranted,
        isAdapterEnabled: event.isAdapterEnabled,
      ),
    );
  }

  Future<void> _onPermissionIconTapped(Emitter<ConnectionSectionState> emit) async {
    if (state.arePermissionsGranted) {
      emit(state.copyWith(effect: const ConnectionSectionEffect.showPermissionsGrantedInfo()));
      return;
    }

    try {
      if (await _bluetoothStatusService.arePermissionsPermanentlyDenied()) {
        emit(state.copyWith(effect: const ConnectionSectionEffect.showPermissionsDeniedSettings()));
        return;
      }

      final BluetoothPermissionRequestResult result = await _bluetoothStatusService
          .requestPermissions();
      await _bluetoothStatusService.refreshPermissions();

      if (result == BluetoothPermissionRequestResult.permanentlyDenied) {
        emit(state.copyWith(effect: const ConnectionSectionEffect.showPermissionsDeniedSettings()));
      }
    } on Object {
      rethrow;
    }
  }

  void _onAdapterIconTapped(Emitter<ConnectionSectionState> emit) {
    if (state.isAdapterEnabled) {
      emit(state.copyWith(effect: const ConnectionSectionEffect.showAdapterEnabledInfo()));
      return;
    }

    emit(state.copyWith(effect: const ConnectionSectionEffect.showAdapterDisabledInfo()));
  }

  void _onDisconnectTapped(Emitter<ConnectionSectionState> emit) {
    emit(state.copyWith(effect: const ConnectionSectionEffect.showDisconnectConfirmation()));
  }

  Future<void> _onOpenAppSettingsRequested(Emitter<ConnectionSectionState> emit) async {
    try {
      await _bluetoothStatusService.openAppSettings();
    } on Object {
      rethrow;
    }
  }

  void _onEffectHandled(Emitter<ConnectionSectionState> emit) {
    emit(state.copyWith(effect: null));
  }

  @override
  Future<void> close() async {
    await _statusSubscription?.cancel();
    await _framesSubscription?.cancel();
    return super.close();
  }
}

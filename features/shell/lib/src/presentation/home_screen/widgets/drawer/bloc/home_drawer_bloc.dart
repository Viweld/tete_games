import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'home_drawer_event.dart';
part 'home_drawer_state.dart';
part 'home_drawer_effect.dart';
part 'home_drawer_bloc.freezed.dart';

@injectable
class HomeDrawerBloc extends Bloc<HomeDrawerEvent, HomeDrawerState> {
  final ProfileRepository _profileRepository;
  final BluetoothStatusService _bluetoothStatusService;
  final PeerConnectionService _peerConnectionService;
  StreamSubscription<PlayerProfile?>? _profileSubscription;
  StreamSubscription<BluetoothStatusSnapshot>? _statusSubscription;
  StreamSubscription<AppConnectionFrame>? _framesSubscription;

  HomeDrawerBloc(this._profileRepository, this._bluetoothStatusService, this._peerConnectionService)
    : super(HomeDrawerState(profile: _profileRepository.cachedProfile)) {
    on<HomeDrawerEvent>(
      (HomeDrawerEvent event, Emitter<HomeDrawerState> emit) => event.map(
        init: (_) => _onInit(emit),
        appResumed: (_) => _onAppResumed(emit),
        profileChanged: (HomeDrawerProfileChanged event) => _onProfileChanged(event, emit),
        connectionStateChanged: (HomeDrawerConnectionStateChanged event) =>
            _onConnectionStateChanged(event, emit),
        snapshotChanged: (HomeDrawerSnapshotChanged event) => _onSnapshotChanged(event, emit),
        permissionIconTapped: (_) => _onPermissionIconTapped(emit),
        adapterIconTapped: (_) => _onAdapterIconTapped(emit),
        editProfileTapped: (_) => _onEditProfileTapped(emit),
        disconnectTapped: (_) => _onDisconnectTapped(emit),
        openAppSettingsRequested: (_) => _onOpenAppSettingsRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    _profileSubscription = _profileRepository.profileStream.listen((PlayerProfile? profile) {
      if (isClosed) return;
      add(HomeDrawerEvent.profileChanged(profile: profile));
    });

    _statusSubscription = _bluetoothStatusService.statusStream.listen(
      (BluetoothStatusSnapshot snapshot) => add(
        HomeDrawerEvent.snapshotChanged(
          arePermissionsGranted: snapshot.arePermissionsGranted,
          isAdapterEnabled: snapshot.isAdapterEnabled,
        ),
      ),
    );

    _framesSubscription = _peerConnectionService.frames.listen((AppConnectionFrame frame) {
      if (isClosed) return;
      add(HomeDrawerEvent.connectionStateChanged(isConnected: frame.state.shared.isConnected));
    });

    add(const HomeDrawerEvent.init());
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    await _statusSubscription?.cancel();
    await _framesSubscription?.cancel();
    return super.close();
  }

  Future<void> _onInit(Emitter<HomeDrawerState> emit) async {
    try {
      final BluetoothStatusSnapshot snapshot = await _bluetoothStatusService.readSnapshot();
      emit(
        state.copyWith(
          profile: _profileRepository.cachedProfile,
          arePermissionsGranted: snapshot.arePermissionsGranted,
          isAdapterEnabled: snapshot.isAdapterEnabled,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onAppResumed(Emitter<HomeDrawerState> emit) async {
    try {
      await _bluetoothStatusService.refreshPermissions();
    } on Object {
      rethrow;
    }
  }

  void _onProfileChanged(HomeDrawerProfileChanged event, Emitter<HomeDrawerState> emit) {
    emit(state.copyWith(profile: event.profile));
  }

  void _onConnectionStateChanged(
    HomeDrawerConnectionStateChanged event,
    Emitter<HomeDrawerState> emit,
  ) {
    emit(state.copyWith(isConnected: event.isConnected));
  }

  void _onSnapshotChanged(HomeDrawerSnapshotChanged event, Emitter<HomeDrawerState> emit) {
    emit(
      state.copyWith(
        arePermissionsGranted: event.arePermissionsGranted,
        isAdapterEnabled: event.isAdapterEnabled,
      ),
    );
  }

  Future<void> _onPermissionIconTapped(Emitter<HomeDrawerState> emit) async {
    if (state.arePermissionsGranted) {
      emit(state.copyWith(effect: const HomeDrawerEffect.showPermissionsGrantedInfo()));
      return;
    }

    try {
      if (await _bluetoothStatusService.arePermissionsPermanentlyDenied()) {
        emit(state.copyWith(effect: const HomeDrawerEffect.showPermissionsDeniedSettings()));
        return;
      }

      final BluetoothPermissionRequestResult result = await _bluetoothStatusService
          .requestPermissions();
      await _bluetoothStatusService.refreshPermissions();

      if (result == BluetoothPermissionRequestResult.permanentlyDenied) {
        emit(state.copyWith(effect: const HomeDrawerEffect.showPermissionsDeniedSettings()));
      }
    } on Object {
      rethrow;
    }
  }

  void _onAdapterIconTapped(Emitter<HomeDrawerState> emit) {
    if (state.isAdapterEnabled) {
      emit(state.copyWith(effect: const HomeDrawerEffect.showAdapterEnabledInfo()));
      return;
    }

    emit(state.copyWith(effect: const HomeDrawerEffect.showAdapterDisabledInfo()));
  }

  void _onEditProfileTapped(Emitter<HomeDrawerState> emit) {
    if (state.isConnected) return;

    emit(state.copyWith(effect: const HomeDrawerEffect.editProfileRequested()));
  }

  void _onDisconnectTapped(Emitter<HomeDrawerState> emit) {
    emit(state.copyWith(effect: const HomeDrawerEffect.showDisconnectConfirmation()));
  }

  Future<void> _onOpenAppSettingsRequested(Emitter<HomeDrawerState> emit) async {
    try {
      await _bluetoothStatusService.openAppSettings();
    } on Object {
      rethrow;
    }
  }

  void _onEffectHandled(Emitter<HomeDrawerState> emit) {
    emit(state.copyWith(effect: null));
  }
}

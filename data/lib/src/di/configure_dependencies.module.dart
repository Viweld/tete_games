// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:data/src/bluetooth/bluetooth_status_service_impl.dart' as _i138;
import 'package:data/src/peer/ble_peer_logger.dart' as _i561;
import 'package:data/src/peer/di/ble_peer_module.dart' as _i68;
import 'package:data/src/peer/peer_connection_service_impl.dart' as _i547;
import 'package:data/src/peer/peer_lifecycle.dart' as _i29;
import 'package:data/src/peer/repositories/local_device_repository_impl.dart'
    as _i304;
import 'package:data/src/peer/repositories/peer_client_session_repository_impl.dart'
    as _i569;
import 'package:data/src/peer/repositories/peer_server_session_repository_impl.dart'
    as _i1055;
import 'package:data/src/peer/repositories/peer_transport_repository_impl.dart'
    as _i683;
import 'package:data/src/peer/repositories/profile_repository_impl.dart'
    as _i579;
import 'package:data/src/repositories/repositories.dart' as _i876;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final blePeerModule = _$BlePeerModule();
    gh.lazySingleton<_i561.BlePeerLogger>(() => blePeerModule.blePeerLogger());
    gh.lazySingleton<_i494.PushEventsRepository>(
        () => _i876.PushEventsRepositoryImpl());
    gh.lazySingleton<_i494.SettingsRepository>(
        () => _i876.SettingsRepositoryImpl(gh<_i494.LocalDataProvider>()));
    gh.lazySingleton<_i494.ProfileRepository>(
      () => _i579.ProfileRepositoryImpl(gh<_i494.LocalDataProvider>()),
      dispose: _i579.disposeProfileRepository,
    );
    gh.lazySingleton<_i494.LocalDeviceRepository>(
        () => _i304.LocalDeviceRepositoryImpl(gh<_i494.AppConfig>()));
    gh.lazySingleton<_i494.BluetoothStatusService>(
      () => _i138.BluetoothStatusServiceImpl(),
      dispose: _i138.disposeBluetoothStatusService,
    );
    gh.lazySingleton<_i29.PeerLifecycle>(() => _i29.PeerLifecycle(
          gh<_i494.AppConfig>(),
          gh<_i561.BlePeerLogger>(),
        ));
    gh.lazySingleton<_i494.PeerServerSessionRepository>(
        () => _i1055.PeerServerSessionRepositoryImpl(
              gh<_i29.PeerLifecycle>(),
              gh<_i494.ProfileRepository>(),
              gh<_i494.LocalDeviceRepository>(),
            ));
    gh.lazySingleton<_i494.PeerTransportRepository>(
        () => _i683.PeerTransportRepositoryImpl(gh<_i29.PeerLifecycle>()));
    gh.lazySingleton<_i494.PeerClientSessionRepository>(
        () => _i569.PeerClientSessionRepositoryImpl(
              gh<_i29.PeerLifecycle>(),
              gh<_i494.ProfileRepository>(),
              gh<_i494.LocalDeviceRepository>(),
            ));
    gh.lazySingleton<_i494.PeerConnectionService>(
      () => _i547.PeerConnectionServiceImpl(
        gh<_i494.PeerServerSessionRepository>(),
        gh<_i494.PeerClientSessionRepository>(),
        gh<_i494.PeerTransportRepository>(),
        gh<_i494.ProfileRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
  }
}

class _$BlePeerModule extends _i68.BlePeerModule {}

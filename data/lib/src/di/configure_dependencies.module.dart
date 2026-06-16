// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:ble_peer_session/ble_peer_session.dart' as _i286;
import 'package:core/core.dart' as _i494;
import 'package:data/src/di/firebase_module.dart' as _i650;
import 'package:data/src/di/local_module.dart' as _i993;
import 'package:data/src/peer/ble_peer_logger.dart' as _i561;
import 'package:data/src/peer/di/ble_peer_module.dart' as _i68;
import 'package:data/src/peer/peer_connection_service_impl.dart' as _i547;
import 'package:data/src/peer/repositories/ble_peer_client_session_repository.dart' as _i846;
import 'package:data/src/peer/repositories/ble_peer_server_session_repository.dart' as _i98;
import 'package:data/src/peer/repositories/ble_peer_transport_repository.dart' as _i491;
import 'package:data/src/peer/repositories/local_device_repository.dart' as _i5;
import 'package:data/src/peer/repositories/player_profile_repository.dart' as _i856;
import 'package:data/src/providers/local/local_providers.dart' as _i37;
import 'package:data/src/repositories/repositories.dart' as _i876;
import 'package:domain/domain.dart' as _i494;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final localeModule = _$LocaleModule();
    final firebasePackageModule = _$FirebasePackageModule();
    final blePeerModule = _$BlePeerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(() => localeModule.prefs, preResolve: true);
    gh.lazySingleton<_i892.FirebaseMessaging>(() => firebasePackageModule.firebaseMessaging());
    gh.lazySingleton<_i561.BlePeerLogger>(() => blePeerModule.blePeerLogger());
    gh.lazySingleton<_i494.PushEventsRepository>(() => _i876.PushEventsRepositoryImpl());
    gh.lazySingleton<_i494.ILocalDeviceRepository>(
      () => _i5.LocalDeviceRepository(gh<_i494.AppConfig>()),
    );
    gh.lazySingleton<_i37.LocalDataProvider>(
      () => _i37.LocalDataProviderImpl(sharedPreferences: gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i494.SettingsRepository>(
      () => _i876.SettingsRepositoryImpl(gh<_i37.LocalDataProvider>()),
    );
    gh.lazySingleton<_i494.IPlayerProfileRepository>(
      () => _i856.PlayerProfileRepository(gh<_i37.LocalDataProvider>()),
    );
    gh.lazySingleton<_i286.Peer>(
      () => blePeerModule.peer(gh<_i494.AppConfig>(), gh<_i561.BlePeerLogger>()),
    );
    gh.lazySingleton<_i494.IPeerTransportRepository>(
      () => _i491.BlePeerTransportRepository(gh<_i286.Peer>()),
    );
    gh.lazySingleton<_i494.IPeerServerSessionRepository>(
      () => _i98.BlePeerServerSessionRepository(
        gh<_i286.Peer>(),
        gh<_i494.IPlayerProfileRepository>(),
        gh<_i494.ILocalDeviceRepository>(),
      ),
    );
    gh.lazySingleton<_i494.IPeerClientSessionRepository>(
      () => _i846.BlePeerClientSessionRepository(
        gh<_i286.Peer>(),
        gh<_i494.IPlayerProfileRepository>(),
        gh<_i494.ILocalDeviceRepository>(),
      ),
    );
    gh.lazySingleton<_i494.PeerConnectionService>(
      () => _i547.PeerConnectionServiceImpl(
        gh<_i494.IPeerServerSessionRepository>(),
        gh<_i494.IPeerClientSessionRepository>(),
        gh<_i494.IPeerTransportRepository>(),
        gh<_i494.IPlayerProfileRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
  }
}

class _$LocaleModule extends _i993.LocaleModule {}

class _$FirebasePackageModule extends _i650.FirebasePackageModule {}

class _$BlePeerModule extends _i68.BlePeerModule {}

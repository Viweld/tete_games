// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:infrastructure/src/di/firebase_module.dart' as _i329;
import 'package:infrastructure/src/firebase/firebase_push_service.dart' as _i800;
import 'package:infrastructure/src/peer/ble_peer_logger.dart' as _i275;
import 'package:infrastructure/src/peer/di/ble_peer_module.dart' as _i213;
import 'package:infrastructure/src/peer/peer_lifecycle.dart' as _i988;
import 'package:infrastructure/src/peer/repositories/local_device_repository_impl.dart' as _i592;
import 'package:infrastructure/src/peer/repositories/peer_client_session_repository_impl.dart'
    as _i921;
import 'package:infrastructure/src/peer/repositories/peer_server_session_repository_impl.dart'
    as _i483;
import 'package:infrastructure/src/peer/repositories/peer_transport_repository_impl.dart' as _i525;
import 'package:infrastructure/src/push/repositories/push_events_repository.dart' as _i682;
import 'package:infrastructure/src/push/repositories/push_events_repository_impl.dart' as _i214;
import 'package:infrastructure/src/storage/local_data_provider_impl.dart' as _i586;
import 'package:injectable/injectable.dart' as _i526;
import 'package:peer/peer_connection.dart' as _i124;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final localStorageModule = _$LocalStorageModule();
    final firebasePackageModule = _$FirebasePackageModule();
    final blePeerModule = _$BlePeerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localStorageModule.sharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(() => firebasePackageModule.firebaseMessaging());
    gh.lazySingleton<_i275.BlePeerLogger>(() => blePeerModule.blePeerLogger());
    gh.lazySingleton<_i682.PushEventsRepository>(() => _i214.PushEventsRepositoryImpl());
    gh.lazySingleton<_i124.LocalDeviceRepository>(
      () => _i592.LocalDeviceRepositoryImpl(gh<_i494.AppConfig>()),
    );
    gh.lazySingleton<_i494.LocalDataProvider>(
      () => _i586.LocalDataProviderImpl(sharedPreferences: gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i988.PeerLifecycle>(
      () => _i988.PeerLifecycle(gh<_i494.AppConfig>(), gh<_i275.BlePeerLogger>()),
    );
    gh.lazySingleton<_i800.FirebasePushService>(
      () => _i800.FirebasePushService(
        eventsRepository: gh<_i682.PushEventsRepository>(),
        pushPreferences: gh<_i494.PushNotificationPreferences>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i124.PeerServerSessionRepository>(
      () => _i483.PeerServerSessionRepositoryImpl(
        gh<_i988.PeerLifecycle>(),
        gh<_i124.PeerPlayerIdentitySource>(),
        gh<_i124.LocalDeviceRepository>(),
      ),
    );
    gh.lazySingleton<_i124.PeerTransportRepository>(
      () => _i525.PeerTransportRepositoryImpl(gh<_i988.PeerLifecycle>()),
    );
    gh.lazySingleton<_i124.PeerClientSessionRepository>(
      () => _i921.PeerClientSessionRepositoryImpl(
        gh<_i988.PeerLifecycle>(),
        gh<_i124.PeerPlayerIdentitySource>(),
        gh<_i124.LocalDeviceRepository>(),
      ),
    );
  }
}

class _$LocalStorageModule extends _i586.LocalStorageModule {}

class _$FirebasePackageModule extends _i329.FirebasePackageModule {}

class _$BlePeerModule extends _i213.BlePeerModule {}

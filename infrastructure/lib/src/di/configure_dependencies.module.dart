// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:domain/domain.dart' as _i494;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:infrastructure/src/di/firebase_module.dart' as _i329;
import 'package:infrastructure/src/firebase/firebase_push_service.dart'
    as _i800;
import 'package:infrastructure/src/storage/local_data_provider_impl.dart'
    as _i586;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final localStorageModule = _$LocalStorageModule();
    final firebasePackageModule = _$FirebasePackageModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localStorageModule.sharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebasePackageModule.firebaseMessaging());
    gh.lazySingleton<_i800.FirebasePushService>(
      () => _i800.FirebasePushService(
        eventsRepository: gh<_i494.PushEventsRepository>(),
        settingsRepository: gh<_i494.SettingsRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i494.LocalDataProvider>(() => _i586.LocalDataProviderImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
  }
}

class _$LocalStorageModule extends _i586.LocalStorageModule {}

class _$FirebasePackageModule extends _i329.FirebasePackageModule {}

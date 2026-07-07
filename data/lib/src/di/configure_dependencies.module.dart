// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:data/src/repositories/profile/profile_repository_impl.dart' as _i579;
import 'package:data/src/repositories/repositories.dart' as _i876;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i494.PushEventsRepository>(
      () => _i876.PushEventsRepositoryImpl(),
    );
    gh.lazySingleton<_i494.SettingsRepository>(
      () => _i876.SettingsRepositoryImpl(gh<_i494.LocalDataProvider>()),
    );
    gh.lazySingleton<_i494.ProfileRepository>(
      () => _i579.ProfileRepositoryImpl(gh<_i494.LocalDataProvider>()),
      dispose: _i579.disposeProfileRepository,
    );
  }
}

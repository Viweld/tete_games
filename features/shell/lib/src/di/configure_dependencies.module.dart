// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:core_ui/core_ui.dart' as _i728;
import 'package:injectable/injectable.dart' as _i526;
import 'package:peer/peer_connection.dart' as _i124;
import 'package:shell/shell_domain.dart' as _i573;
import 'package:shell/src/data/bluetooth/bluetooth_status_service_impl.dart' as _i721;
import 'package:shell/src/data/peer/profile_peer_identity_source.dart' as _i396;
import 'package:shell/src/data/repositories/profile_repository_impl.dart' as _i295;
import 'package:shell/src/data/repositories/settings_repository_impl.dart' as _i597;
import 'package:shell/src/presentation/home_screen/bloc/home_bloc.dart' as _i410;
import 'package:shell/src/presentation/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart'
    as _i937;
import 'package:shell/src/presentation/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart'
    as _i141;
import 'package:shell/src/presentation/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart'
    as _i923;
import 'package:shell/src/presentation/splash_screen/bloc/splash_bloc.dart' as _i459;

class ShellPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i573.SettingsRepository>(
      () => _i597.SettingsRepositoryImpl(gh<_i494.LocalDataProvider>()),
    );
    gh.lazySingleton<_i573.ProfileRepository>(
      () => _i295.ProfileRepositoryImpl(gh<_i494.LocalDataProvider>()),
      dispose: _i295.disposeProfileRepository,
    );
    gh.factory<_i459.SplashBloc>(
      () => _i459.SplashBloc(
        gh<_i573.SettingsRepository>(),
        gh<_i494.LocaleController>(),
        gh<_i573.ProfileRepository>(),
        gh<_i728.AppAnimations>(),
      ),
    );
    gh.lazySingleton<_i573.BluetoothStatusService>(
      () => _i721.BluetoothStatusServiceImpl(),
      dispose: _i721.disposeBluetoothStatusService,
    );
    gh.factory<_i937.HomeAppBarBloc>(
      () => _i937.HomeAppBarBloc(gh<_i573.ProfileRepository>(), gh<_i124.PeerConnectionService>()),
    );
    gh.factory<_i141.HomeDrawerBloc>(
      () => _i141.HomeDrawerBloc(
        gh<_i573.ProfileRepository>(),
        gh<_i573.BluetoothStatusService>(),
        gh<_i124.PeerConnectionService>(),
      ),
    );
    gh.factory<_i923.NicknameBloc>(() => _i923.NicknameBloc(gh<_i573.ProfileRepository>()));
    gh.factory<_i410.HomeBloc>(
      () => _i410.HomeBloc(gh<_i124.PeerConnectionService>(), gh<_i573.ProfileRepository>()),
    );
    gh.lazySingleton<_i124.PeerPlayerIdentitySource>(
      () => _i396.ProfilePeerIdentitySource(gh<_i573.ProfileRepository>()),
    );
  }
}

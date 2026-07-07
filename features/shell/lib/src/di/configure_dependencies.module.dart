// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:core_ui/core_ui.dart' as _i728;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:peer/peer_connection.dart' as _i124;
import 'package:shell/src/presentation/home_screen/bloc/home_bloc.dart'
    as _i410;
import 'package:shell/src/presentation/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart'
    as _i937;
import 'package:shell/src/presentation/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart'
    as _i141;
import 'package:shell/src/presentation/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart'
    as _i923;
import 'package:shell/src/presentation/splash_screen/bloc/splash_bloc.dart'
    as _i459;

class ShellPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i410.HomeBloc>(() => _i410.HomeBloc(
          gh<_i124.PeerConnectionService>(),
          gh<_i494.ProfileRepository>(),
        ));
    gh.factory<_i459.SplashBloc>(() => _i459.SplashBloc(
          gh<_i494.SettingsRepository>(),
          gh<_i494.LocaleController>(),
          gh<_i494.ProfileRepository>(),
          gh<_i728.AppAnimations>(),
        ));
    gh.factory<_i937.HomeAppBarBloc>(() => _i937.HomeAppBarBloc(
          gh<_i494.ProfileRepository>(),
          gh<_i124.PeerConnectionService>(),
        ));
    gh.factory<_i923.NicknameBloc>(
        () => _i923.NicknameBloc(gh<_i494.ProfileRepository>()));
    gh.factory<_i141.HomeDrawerBloc>(() => _i141.HomeDrawerBloc(
          gh<_i494.ProfileRepository>(),
          gh<_i494.BluetoothStatusService>(),
          gh<_i124.PeerConnectionService>(),
        ));
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:core_ui/core_ui.dart' as _i728;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:main/main/home_screen/bloc/home_bloc.dart' as _i1007;
import 'package:main/main/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart' as _i518;
import 'package:main/main/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart' as _i375;
import 'package:main/main/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart' as _i355;
import 'package:main/main/splash_screen/bloc/splash_bloc.dart' as _i517;

class MainPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i375.HomeDrawerBloc>(
      () => _i375.HomeDrawerBloc(
        gh<_i494.ProfileRepository>(),
        gh<_i494.BluetoothStatusService>(),
        gh<_i494.PeerConnectionService>(),
      ),
    );
    gh.factory<_i517.SplashBloc>(
      () => _i517.SplashBloc(
        gh<_i494.SettingsRepository>(),
        gh<_i494.LocaleController>(),
        gh<_i494.ProfileRepository>(),
        gh<_i728.AppAnimations>(),
      ),
    );
    gh.factory<_i355.NicknameBloc>(() => _i355.NicknameBloc(gh<_i494.ProfileRepository>()));
    gh.factory<_i1007.HomeBloc>(
      () => _i1007.HomeBloc(gh<_i494.PeerConnectionService>(), gh<_i494.ProfileRepository>()),
    );
    gh.factory<_i518.HomeAppBarBloc>(
      () => _i518.HomeAppBarBloc(gh<_i494.ProfileRepository>(), gh<_i494.PeerConnectionService>()),
    );
  }
}

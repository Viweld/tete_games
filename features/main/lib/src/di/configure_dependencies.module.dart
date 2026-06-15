// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:main/main/home_screen/bloc/home_bloc.dart' as _i1007;
import 'package:main/main/home_screen/widgets/client_session_dialog/bloc/client_session_bloc.dart'
    as _i623;
import 'package:main/main/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart'
    as _i355;
import 'package:main/main/home_screen/widgets/server_session_dialog/bloc/server_session_bloc.dart'
    as _i847;
import 'package:main/main/splash_screen/bloc/splash_bloc.dart' as _i517;

class MainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i847.ServerSessionBloc>(() => _i847.ServerSessionBloc(
          gh<_i494.IPeerServerSessionRepository>(),
          gh<_i494.IPeerTransportRepository>(),
          gh<_i494.BlocErrorHandler>(),
        ));
    gh.factory<_i517.SplashBloc>(() => _i517.SplashBloc(
          gh<_i494.SettingsRepository>(),
          gh<_i494.LocaleController>(),
        ));
    gh.factory<_i355.NicknameBloc>(
        () => _i355.NicknameBloc(gh<_i494.IPlayerProfileRepository>()));
    gh.factory<_i1007.HomeBloc>(() => _i1007.HomeBloc(
          gh<_i494.IPlayerProfileRepository>(),
          gh<_i494.IPeerTransportRepository>(),
        ));
    gh.factory<_i623.ClientSessionBloc>(() => _i623.ClientSessionBloc(
          gh<_i494.IPeerClientSessionRepository>(),
          gh<_i494.IPeerTransportRepository>(),
          gh<_i494.BlocErrorHandler>(),
        ));
  }
}

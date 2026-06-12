// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:main/main/home/bloc/home_bloc.dart' as _i1051;
import 'package:main/main/splash_screen/bloc/splash_bloc.dart' as _i517;

class MainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1051.HomeBloc>(() => _i1051.HomeBloc());
    gh.factory<_i517.SplashBloc>(() => _i517.SplashBloc(
          gh<_i494.AuthRepository>(),
          gh<_i494.SettingsRepository>(),
          gh<_i494.LocaleController>(),
        ));
  }
}

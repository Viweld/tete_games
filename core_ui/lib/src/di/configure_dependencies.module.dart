// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar/bloc/main_app_bar_bloc.dart'
    as _i778;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class CoreUiPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i778.MainAppBarBloc>(() =>
        _i778.MainAppBarBloc(profileRepository: gh<_i494.ProfileRepository>()));
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_ui/src/di/configure_dependencies.module.dart' as _i339;
import 'package:data/src/di/configure_dependencies.module.dart' as _i282;
import 'package:domain/src/di/configure_dependencies.module.dart' as _i697;
import 'package:get_it/get_it.dart' as _i174;
import 'package:infrastructure/src/di/configure_dependencies.module.dart'
    as _i1041;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;
import 'package:shell/src/di/configure_dependencies.module.dart' as _i684;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i1041.InfrastructurePackageModule().init(gh);
    await _i1058.NavigationPackageModule().init(gh);
    await _i339.CoreUiPackageModule().init(gh);
    await _i282.DataPackageModule().init(gh);
    await _i697.DomainPackageModule().init(gh);
    await _i684.ShellPackageModule().init(gh);
    return this;
  }
}

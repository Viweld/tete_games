// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;

import '../services/firebase/firebase_push_service.dart' as _i982;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i982.FirebasePushService>(
      () => _i982.FirebasePushService(
        eventsRepository: gh<_i494.PushEventsRepository>(),
        notificationsRepository: gh<_i494.NotificationsRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
    await _i1058.NavigationPackageModule().init(gh);
    await _i1058.CoreUiPackageModule().init(gh);
    await _i437.DataPackageModule().init(gh);
    await _i494.DomainPackageModule().init(gh);
    await _i1058.MainPackageModule().init(gh);
    await _i1058.ExamplePackageModule().init(gh);
    return this;
  }
}

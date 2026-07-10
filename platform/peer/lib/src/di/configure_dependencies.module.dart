// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:peer/peer_connection.dart' as _i124;
import 'package:peer/src/data/peer_connection_service_impl.dart' as _i389;

class PeerPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i124.PeerConnectionService>(
      () => _i389.PeerConnectionServiceImpl(
        gh<_i124.PeerServerSessionRepository>(),
        gh<_i124.PeerClientSessionRepository>(),
        gh<_i124.PeerTransportRepository>(),
        gh<_i124.PeerPlayerIdentitySource>(),
        gh<_i124.PeerBleSessionGuard>(),
      ),
      dispose: (i) => i.dispose(),
    );
  }
}

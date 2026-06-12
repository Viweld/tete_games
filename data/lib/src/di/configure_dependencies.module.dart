// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:ble_peer_session/ble_peer_session.dart' as _i286;
import 'package:core/core.dart' as _i494;
import 'package:data/src/di/api_module.dart' as _i737;
import 'package:data/src/di/firebase_module.dart' as _i650;
import 'package:data/src/di/local_module.dart' as _i993;
import 'package:data/src/peer/ble_peer_logger.dart' as _i561;
import 'package:data/src/peer/di/ble_peer_module.dart' as _i68;
import 'package:data/src/peer/repositories/ble_peer_client_session_repository.dart'
    as _i846;
import 'package:data/src/peer/repositories/ble_peer_server_session_repository.dart'
    as _i98;
import 'package:data/src/peer/repositories/ble_peer_transport_repository.dart'
    as _i491;
import 'package:data/src/peer/repositories/local_device_repository.dart' as _i5;
import 'package:data/src/peer/repositories/player_profile_repository.dart'
    as _i856;
import 'package:data/src/providers/api/airports/airports_api_provider.dart'
    as _i1014;
import 'package:data/src/providers/api/api_provider.dart' as _i357;
import 'package:data/src/providers/api/article/article_api_provider.dart'
    as _i366;
import 'package:data/src/providers/api/auth/auth_api_provider.dart' as _i151;
import 'package:data/src/providers/api/conditions/conditions_api_provider.dart'
    as _i584;
import 'package:data/src/providers/api/contacts/contacts_api_provider.dart'
    as _i669;
import 'package:data/src/providers/api/documents/documents_api_provider.dart'
    as _i951;
import 'package:data/src/providers/api/flights/flights_api_provider.dart'
    as _i952;
import 'package:data/src/providers/api/loyalty/loyalty_api_provider.dart'
    as _i673;
import 'package:data/src/providers/api/notifications/notifications_api_provider.dart'
    as _i310;
import 'package:data/src/providers/api/ordering/ordering_api_provider.dart'
    as _i742;
import 'package:data/src/providers/api/reference_data/reference_data_api_provider.dart'
    as _i343;
import 'package:data/src/providers/api/services/services_api_provider.dart'
    as _i710;
import 'package:data/src/providers/api/support/support_api_provider.dart'
    as _i1013;
import 'package:data/src/providers/api/transactions/transactions_api_provider.dart'
    as _i915;
import 'package:data/src/providers/api/travelers/travelers_api_provider.dart'
    as _i605;
import 'package:data/src/providers/api/user_profile/user_profile_api_provider.dart'
    as _i485;
import 'package:data/src/providers/local/local_providers.dart' as _i37;
import 'package:data/src/providers/providers.dart' as _i868;
import 'package:data/src/providers/secure/secure_providers.dart' as _i412;
import 'package:data/src/repositories/repositories.dart' as _i876;
import 'package:data/src/services/api_call_wrapper.dart' as _i267;
import 'package:data/src/services/auth_session_manager.dart' as _i212;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final localeModule = _$LocaleModule();
    final firebasePackageModule = _$FirebasePackageModule();
    final blePeerModule = _$BlePeerModule();
    final apiModule = _$ApiModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localeModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebasePackageModule.firebaseMessaging());
    gh.lazySingleton<_i561.BlePeerLogger>(() => blePeerModule.blePeerLogger());
    gh.lazySingleton<_i267.ApiCallWrapper>(() => _i267.ApiCallWrapper());
    gh.lazySingleton<_i412.SecureDataProvider>(
        () => _i412.SecureDataProviderImpl());
    gh.lazySingleton<_i494.PushEventsRepository>(
        () => _i876.PushEventsRepositoryImpl());
    gh.lazySingleton<_i494.ILocalDeviceRepository>(
        () => _i5.LocalDeviceRepository(gh<_i494.AppConfig>()));
    gh.singleton<Map<String, dynamic>>(
      () => apiModule.headers,
      instanceName: 'Headers',
    );
    gh.lazySingleton<_i37.LocalDataProvider>(() => _i37.LocalDataProviderImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.singleton<String>(
      () => apiModule.baseUrl(gh<_i494.AppConfig>()),
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i494.TimersRepository>(() => _i876.TimersRepositoryImpl(
        localCacheDataProvider: gh<_i868.LocalDataProvider>()));
    gh.lazySingleton<_i286.BlePeerSessionModule>(
        () => blePeerModule.blePeerSessionModule(
              gh<_i494.AppConfig>(),
              gh<_i561.BlePeerLogger>(),
            ));
    gh.lazySingleton<_i286.TransportFacade>(
        () => blePeerModule.transportFacade(gh<_i286.BlePeerSessionModule>()));
    gh.lazySingleton<_i286.TransportSessionClient>(() =>
        blePeerModule.transportSessionClient(gh<_i286.BlePeerSessionModule>()));
    gh.lazySingleton<_i286.TransportSessionServer>(() =>
        blePeerModule.transportSessionServer(gh<_i286.BlePeerSessionModule>()));
    gh.lazySingleton<_i494.IPlayerProfileRepository>(
        () => _i856.PlayerProfileRepository(gh<_i37.LocalDataProvider>()));
    gh.lazySingleton<_i494.SettingsRepository>(
        () => _i876.SettingsRepositoryImpl(gh<_i868.LocalDataProvider>()));
    gh.singleton<_i361.Dio>(
      () => apiModule.authDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<Map<String, dynamic>>(instanceName: 'Headers'),
        gh<_i494.LocaleController>(),
        gh<_i494.CurrencyController>(),
      ),
      instanceName: 'AuthDio',
    );
    gh.factory<_i151.AuthApiProvider>(
        () => _i151.AuthApiProvider(gh<_i361.Dio>(instanceName: 'AuthDio')));
    gh.lazySingleton<_i494.IPeerTransportRepository>(
        () => _i491.BlePeerTransportRepository(gh<_i286.TransportFacade>()));
    gh.lazySingleton<_i494.IPeerClientSessionRepository>(
        () => _i846.BlePeerClientSessionRepository(
              gh<_i286.TransportFacade>(),
              gh<_i286.TransportSessionClient>(),
              gh<_i494.IPlayerProfileRepository>(),
              gh<_i494.ILocalDeviceRepository>(),
            ));
    gh.lazySingleton<_i494.IPeerServerSessionRepository>(
        () => _i98.BlePeerServerSessionRepository(
              gh<_i286.TransportFacade>(),
              gh<_i286.TransportSessionServer>(),
              gh<_i494.IPlayerProfileRepository>(),
              gh<_i494.ILocalDeviceRepository>(),
            ));
    gh.lazySingleton<_i212.AuthSessionManager>(() => _i212.AuthSessionManager(
          secureDataProvider: gh<_i412.SecureDataProvider>(),
          authApiProvider: gh<_i151.AuthApiProvider>(),
        ));
    gh.lazySingleton<_i494.AuthRepository>(() => _i876.AuthRepositoryImpl(
          authSessionManager: gh<_i212.AuthSessionManager>(),
          authApiProvider: gh<_i868.AuthApiProvider>(),
          apiCallWrapper: gh<_i267.ApiCallWrapper>(),
        ));
    gh.factory<_i357.ApiProvider>(() => apiModule.apiProvider(
          gh<String>(instanceName: 'BaseUrl'),
          gh<Map<String, dynamic>>(instanceName: 'Headers'),
          gh<_i212.AuthSessionManager>(),
          gh<_i494.LocaleController>(),
          gh<_i494.CurrencyController>(),
        ));
    gh.singleton<_i361.Dio>(() => apiModule.dio(gh<_i357.ApiProvider>()));
    gh.factory<_i1014.AirportsApiProvider>(
        () => _i1014.AirportsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i366.ArticleApiProvider>(
        () => _i366.ArticleApiProvider(gh<_i361.Dio>()));
    gh.factory<_i584.ConditionsApiProvider>(
        () => _i584.ConditionsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i669.ContactsApiProvider>(
        () => _i669.ContactsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i951.DocumentsApiProvider>(
        () => _i951.DocumentsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i952.FlightsApiProvider>(
        () => _i952.FlightsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i673.LoyaltyApiProvider>(
        () => _i673.LoyaltyApiProvider(gh<_i361.Dio>()));
    gh.factory<_i310.NotificationsApiProvider>(
        () => _i310.NotificationsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i742.OrderingApiProvider>(
        () => _i742.OrderingApiProvider(gh<_i361.Dio>()));
    gh.factory<_i343.ReferenceDataApiProvider>(
        () => _i343.ReferenceDataApiProvider(gh<_i361.Dio>()));
    gh.factory<_i710.ServicesApiProvider>(
        () => _i710.ServicesApiProvider(gh<_i361.Dio>()));
    gh.factory<_i1013.SupportApiProvider>(
        () => _i1013.SupportApiProvider(gh<_i361.Dio>()));
    gh.factory<_i915.TransactionsApiProvider>(
        () => _i915.TransactionsApiProvider(gh<_i361.Dio>()));
    gh.factory<_i605.TravelersApiProvider>(
        () => _i605.TravelersApiProvider(gh<_i361.Dio>()));
    gh.factory<_i485.UserProfileApiProvider>(
        () => _i485.UserProfileApiProvider(gh<_i361.Dio>()));
    gh.lazySingleton<_i494.ConditionsRepository>(
        () => _i876.ConditionsRepositoryImpl(
              gh<_i868.ConditionsApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.ProfileRepository>(() => _i876.ProfileRepositoryImpl(
          gh<_i868.UserProfileApiProvider>(),
          gh<_i267.ApiCallWrapper>(),
        ));
    gh.lazySingleton<_i494.TransactionsRepository>(
        () => _i876.TransactionsRepositoryImpl(
              gh<_i868.TransactionsApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.TransfersOrderingRepository>(
        () => _i876.TransfersOrderingRepositoryImpl(
              gh<_i868.OrderingApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.PrivateJetsRepository>(
        () => _i876.PrivateJetsRepositoryImpl(
              gh<_i868.ServicesApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.AirportsRepository>(
        () => _i876.AirportsRepositoryImpl(
              gh<_i868.AirportsApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.AirportDetailRepository>(
        () => _i876.AirportDetailRepositoryImpl(
              gh<_i868.AirportsApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.TravelersRepository>(
        () => _i876.TravelersRepositoryImpl(
              gh<_i868.TravelersApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.CurrenciesRepository>(
        () => _i876.CurrenciesRepositoryImpl(
              gh<_i868.ReferenceDataApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.CountriesRepository>(
        () => _i876.CountriesRepositoryImpl(
              gh<_i868.ReferenceDataApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.DocumentsRepository>(
        () => _i876.DocumentsRepositoryImpl(
              gh<_i868.DocumentsApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.LanguagesRepository>(
        () => _i876.LanguagesRepositoryImpl(
              gh<_i868.ReferenceDataApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.ArticleRepository>(() => _i876.ArticleRepositoryImpl(
          gh<_i366.ArticleApiProvider>(),
          gh<_i267.ApiCallWrapper>(),
        ));
    gh.lazySingleton<_i494.OrdersRepository>(() => _i876.OrdersRepositoryImpl(
          gh<_i868.OrderingApiProvider>(),
          gh<_i267.ApiCallWrapper>(),
        ));
    gh.lazySingleton<_i494.NotificationsRepository>(
        () => _i876.NotificationsRepositoryImpl(
              gh<_i868.NotificationsApiProvider>(),
              gh<_i868.LocalDataProvider>(),
              gh<_i267.ApiCallWrapper>(),
              gh<_i892.FirebaseMessaging>(),
            ));
    gh.lazySingleton<_i494.ServicesOrderingRepository>(
        () => _i876.ServicesOrderingRepositoryImpl(
              gh<_i868.OrderingApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.TransfersTypesRepository>(
        () => _i876.TransfersTypesRepositoryImpl(
              gh<_i868.ServicesApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.LoyaltyRepository>(() => _i876.LoyaltyRepositoryImpl(
          apiProvider: gh<_i868.LoyaltyApiProvider>(),
          apiCallWrapper: gh<_i267.ApiCallWrapper>(),
        ));
    gh.lazySingleton<_i494.FlightsRepository>(() => _i876.FlightsRepositoryImpl(
          gh<_i868.FlightsApiProvider>(),
          gh<_i267.ApiCallWrapper>(),
        ));
    gh.lazySingleton<_i494.ServicesRepository>(
        () => _i876.ServicesRepositoryImpl(
              gh<_i868.ServicesApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.PrivateJetsOrderingRepository>(
        () => _i876.PrivateJetsOrderingRepositoryImpl(
              gh<_i868.OrderingApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.CancellationRepository>(
        () => _i876.CancellationRepositoryImpl(
              gh<_i868.OrderingApiProvider>(),
              gh<_i267.ApiCallWrapper>(),
            ));
    gh.lazySingleton<_i494.SupportRepository>(() => _i876.SupportRepositoryImpl(
          supportApiProvider: gh<_i868.SupportApiProvider>(),
          apiCallWrapper: gh<_i267.ApiCallWrapper>(),
        ));
  }
}

class _$LocaleModule extends _i993.LocaleModule {}

class _$FirebasePackageModule extends _i650.FirebasePackageModule {}

class _$BlePeerModule extends _i68.BlePeerModule {}

class _$ApiModule extends _i737.ApiModule {}

import 'package:injectable/injectable.dart';
import 'package:navigation/src/app_router/app_router.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter appRouter() => AppRouter();
}

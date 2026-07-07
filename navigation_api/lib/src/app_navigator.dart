/// Navigation port — features depend on this, not on concrete AppRouter.
abstract interface class AppNavigator {
  Future<void> navigateBack([Object? result]);

  Future<void> navigateRoot();

  Future<void> navigateHome();
}

/// Navigation port — features depend on this, not on concrete [AppRouter].
abstract interface class AppNavigator {
  Future<void> navigateBack([Object? result]);

  Future<void> navigateRoot();

  Future<void> navigateHome();

  /// Stubs for shared [MainAppBar] until dedicated modules are connected.
  Future<void> navigateSupport();

  Future<void> navigatePersonalData();

  Future<void> navigateNotifications();
}

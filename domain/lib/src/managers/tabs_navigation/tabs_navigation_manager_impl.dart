part of '../managers.dart';

/// Implementation of [TabsNavigationManager].
@LazySingleton(as: TabsNavigationManager)
final class TabsNavigationManagerImpl implements TabsNavigationManager {
  /// Callback for navigating to a specific tab.
  TabNavigationCallback? _onNavigate;

  /// Callback for getting the active tab index.
  GetActiveTabIndexCallback? _getActiveIndex;

  /// Stream controller for broadcasting active tab index changes.
  late final StreamController<int> _activeTabIndexController;

  TabsNavigationManagerImpl() {
    _activeTabIndexController = StreamController<int>.broadcast();
  }

  @override
  int? get activeTabIndex => _getActiveIndex?.call();

  @override
  Stream<int> get activeTabIndexStream => _activeTabIndexController.stream;

  @override
  void setTabNavigationCallback({
    required TabNavigationCallback onNavigate,
    required GetActiveTabIndexCallback getActiveIndex,
  }) {
    _onNavigate = onNavigate;

    _getActiveIndex = getActiveIndex;
  }

  @override
  void setActiveTab(int index) {
    _onNavigate?.call(index);

    if (_activeTabIndexController.isClosed) return;

    _activeTabIndexController.add(index);
  }

  @override
  void close() {
    _onNavigate = null;

    _getActiveIndex = null;

    _activeTabIndexController.close();
  }
}

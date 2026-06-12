part of '../managers.dart';

enum AppBottomNavigationBarTab { main, ordering, myTrips, profile, contacts }

/// Callback type for tab navigation.
typedef TabNavigationCallback = void Function(int index);

/// Callback type for getting active tab index.
typedef GetActiveTabIndexCallback = int? Function();

/// Interface for managing tab navigation.
abstract interface class TabsNavigationManager {
  /// Returns the current active tab index, or null if not set.
  int? get activeTabIndex;

  /// Stream that emits the active tab index whenever it changes.
  Stream<int> get activeTabIndexStream;

  /// Sets the tab navigation callbacks from the widget layer.
  ///
  /// [onNavigate] - Callback to navigate to a specific tab index.
  /// [getActiveIndex] - Callback to get the current active tab index.
  void setTabNavigationCallback({
    required TabNavigationCallback onNavigate,
    required GetActiveTabIndexCallback getActiveIndex,
  });

  /// Switches to the specified tab index.
  void setActiveTab(int index);

  /// Disposes of the manager and releases resources.
  void close();
}

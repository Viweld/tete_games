import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class ScreenService {
  // Keeps track of the currently applied overlay "mode".
  static bool? _currentIsDark;

  // Simple stack so that nested screens can override and then restore
  // the previous status bar style when they are popped.
  static final List<bool> _overlayStyleStack = <bool>[];

  static Future<void> setPreferredOrientation() async {
    await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
  }

  static Future<void> setSystemUIOverlayStyle({required bool isDark}) async {
    _currentIsDark = isDark;

    await _applyOverlayStyle(isDark: isDark);
  }

  /// Pushes a new status bar style on top of the current one and remembers
  /// the previous value so it can be restored with [popSystemUIOverlayStyle].
  static Future<void> pushSystemUIOverlayStyle({required bool isDark}) async {
    if (_currentIsDark != null) {
      _overlayStyleStack.add(_currentIsDark!);
    }

    _currentIsDark = isDark;

    await _applyOverlayStyle(isDark: isDark);
  }

  /// Restores the previous status bar style, if any.
  static Future<void> popSystemUIOverlayStyle() async {
    if (_overlayStyleStack.isEmpty) {
      return;
    }

    final bool previousIsDark = _overlayStyleStack.removeLast();

    _currentIsDark = previousIsDark;

    await _applyOverlayStyle(isDark: previousIsDark);
  }

  static Future<void> _applyOverlayStyle({required bool isDark}) async {
    if (!isDark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );
    }
  }
}

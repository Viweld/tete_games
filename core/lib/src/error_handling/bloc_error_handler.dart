import 'package:core/src/error_handling/error_handling_policy.dart';
import 'package:core/src/events/app_toast_bus.dart';
import 'package:core/src/events/app_toast_events.dart';
import 'package:core/src/exceptions/api_exception.dart';

/// Centralized handler for non-business errors in BLoCs.
///
/// Responsibilities:
/// - Show toast via [AppToastBus] using a unified mapping
/// - Decide whether the error should be rethrown (so it can reach the app-level error zone)
///
/// Reporting is handled at the app-level (runZonedGuarded / BlocObserver).
///
/// Registered manually in app DI setup (not injectable).
final class BlocErrorHandler {
  BlocErrorHandler(this._toastBus, this._policy);

  final AppToastBus _toastBus;
  final ErrorHandlingPolicy _policy;

  /// Handles [error] and returns whether the caller should `rethrow`.
  ///
  /// - [isSilent] suppresses toasts (default: false)
  /// - [forceRethrow] overrides policy-driven rethrow decision (use sparingly)
  bool handle(Object error, {StackTrace? stackTrace, bool isSilent = false, bool? forceRethrow}) {
    if (!isSilent) {
      _fireToast(error);
    }

    return forceRethrow ?? _policy.shouldRethrow(error);
  }

  void _fireToast(Object error) {
    if (error is OtherException) {
      _toastBus.fire(AppToastEvent.error(error.userMessage));
      return;
    }

    if (!_policy.shouldShowToast(error)) return;

    // All non-OtherException errors are represented as a generic toast.
    _toastBus.fire(const AppToastEvent.error());
  }
}

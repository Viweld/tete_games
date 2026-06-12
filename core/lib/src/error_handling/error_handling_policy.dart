import 'package:core/src/exceptions/api_exception.dart';

/// Defines how infrastructure/API errors should be surfaced in UI and whether they should be
/// rethrown to reach the app-level error zone (runZonedGuarded / BlocObserver).
///
/// UI text localization is intentionally out of scope:
/// - `OtherException.userMessage` may be null (UI shows a default localized message)
/// - Generic errors are represented by a toast without message (`AppToastEvent.error()`)
///
/// Registered manually in app DI setup (not injectable — const defaults).
final class ErrorHandlingPolicy {
  const ErrorHandlingPolicy({
    this.showToastForNetwork = true,
    this.showToastForServer = true,
    this.showToastForUnexpected = true,
    this.rethrowForNetwork = false,
    this.rethrowForServer = false,
    this.rethrowForUnexpected = true,
  });

  final bool showToastForNetwork;
  final bool showToastForServer;
  final bool showToastForUnexpected;

  final bool rethrowForNetwork;
  final bool rethrowForServer;
  final bool rethrowForUnexpected;

  bool shouldShowToast(Object error) => switch (error) {
    NetworkException() => showToastForNetwork,
    ServerException() => showToastForServer,
    _ => showToastForUnexpected,
  };

  bool shouldRethrow(Object error) => switch (error) {
    NetworkException() => rethrowForNetwork,
    ServerException() => rethrowForServer,
    _ => rethrowForUnexpected,
  };
}

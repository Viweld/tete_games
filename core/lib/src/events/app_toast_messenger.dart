import 'package:core/src/events/app_toast_bus.dart';
import 'package:core/src/events/app_toast_events.dart';

/// Facade for publishing global toast messages through [AppToastBus].
final class AppToastMessenger {
  AppToastMessenger(this._bus);

  final AppToastBus _bus;

  void show(AppToastEvent event) => _bus.fire(event);

  void showError([String? message]) => _bus.fire(AppToastEvent.error(message));

  void showSuccess([String? message]) => _bus.fire(AppToastEvent.success(message));

  void showWarning([String? message]) => _bus.fire(AppToastEvent.warning(message));

  void showInfo([String? message]) => _bus.fire(AppToastEvent.info(message));
}

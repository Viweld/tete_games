import 'package:infrastructure/src/push/models/push_navigation_event.dart';
import 'package:infrastructure/src/push/models/user_notification.dart';

abstract interface class PushEventsRepository {
  Stream<UserNotification> get notificationsStream;

  Stream<PushNavigationEvent> get navigationStream;

  void emitNotification(UserNotification notification);

  void emitNavigation(PushNavigationEvent event);
}

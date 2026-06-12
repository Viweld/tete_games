part of 'repositories.dart';

abstract interface class PushEventsRepository {
  Stream<UserNotification> get notificationsStream;

  Stream<PushNavigationEvent> get navigationStream;

  void emitNotification(UserNotification notification);

  void emitNavigation(PushNavigationEvent event);
}

part of '../repositories.dart';

@LazySingleton(as: PushEventsRepository)
class PushEventsRepositoryImpl implements PushEventsRepository {
  final StreamController<UserNotification> _notificationsController =
      StreamController<UserNotification>.broadcast();
  final StreamController<PushNavigationEvent> _navigationController =
      StreamController<PushNavigationEvent>.broadcast();

  @override
  Stream<UserNotification> get notificationsStream => _notificationsController.stream;

  @override
  Stream<PushNavigationEvent> get navigationStream => _navigationController.stream;

  @override
  void emitNotification(UserNotification notification) =>
      _notificationsController.add(notification);

  @override
  void emitNavigation(PushNavigationEvent event) => _navigationController.add(event);
}

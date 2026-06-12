part of '../repositories.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsApiProvider _provider;
  final LocalDataProvider _localDataProvider;
  final ApiCallWrapper _apiCallWrapper;
  final FirebaseMessaging? _messaging;

  late final StreamController<UserNotification> _notificationsStreamController;

  static const String _isPushNotificationsEnabledKey = 'is_push_notifications_enabled';
  static const String _topic = 'general';

  NotificationsRepositoryImpl(
    this._provider,
    this._localDataProvider,
    this._apiCallWrapper,
    this._messaging,
  ) {
    _notificationsStreamController = StreamController<UserNotification>.broadcast();
  }

  @override
  Stream<UserNotification> get notificationsStream => _notificationsStreamController.stream;

  @override
  Future<void> addNotification(UserNotification notification) async {
    _notificationsStreamController.add(notification);
  }

  @override
  Future<List<UserNotification>> getNotifications({
    NotificationCategoryType? category,
    bool? isRead,
    NotificationKindType? kind,
    String? lang,
  }) async {
    final List<UserNotificationDto> response = await _apiCallWrapper.call(
      () => _provider.getNotifications(
        category: category?.toApi(),
        isRead: isRead,
        kind: kind?.toApi(),
        lang: lang,
      ),
    );

    return response.map((UserNotificationDto dto) => dto.toModel).toList(growable: false);
  }

  @override
  Future<FirebaseTokenUpdateResult> upsertFirebaseToken({
    required String token,
    String? lang,
  }) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final NotificationPlatformType platform = _deviceNotificationPlatform();

    final FirebaseTokenUpdateRequestDto body = FirebaseTokenUpdateRequestDto(
      token: token,
      platform: platform.toApi(),
      appVersion: packageInfo.version,
    );

    final FirebaseTokenUpdateResponseDto response = await _provider.upsertFirebaseToken(
      lang: lang,
      body: body,
    );

    return response.toModel;
  }

  @override
  Future<int> markAsRead({List<int>? ids, String? lang}) async {
    assert(ids != null && ids.isNotEmpty, 'ids must be provided');

    final MarkNotificationReadRequestDto body = MarkNotificationReadRequestDto(ids: ids);

    final MarkReadResponseDto response = await _apiCallWrapper.call(
      () => _provider.markNotificationsRead(lang: lang, body: body),
    );

    return response.updated;
  }

  @override
  Future<int> markAllAsRead({bool markAll = false, String? lang}) async {
    assert(markAll, 'markAll = true must be provided');

    const MarkNotificationReadAllRequestDto body = MarkNotificationReadAllRequestDto(markAll: true);

    final MarkReadResponseDto response = await _apiCallWrapper.call(
      () => _provider.markNotificationsReadAll(lang: lang, body: body),
    );

    return response.updated;
  }

  @override
  Future<UnreadIndicator> getUnreadIndicator({String? lang}) async {
    final UnreadIndicatorDto response = await _apiCallWrapper.call(
      () => _provider.getUnreadIndicator(lang: lang),
    );
    return response.toModel;
  }

  @override
  Future<bool> isPushNotificationsEnabled() async {
    final Object? result = await _localDataProvider.getValue(key: _isPushNotificationsEnabledKey);

    if (result is bool) {
      return result;
    }
    return true;
  }

  @override
  Future<void> setPushNotificationsEnabled({required bool isEnabled}) async {
    if (_messaging == null) return;

    if (isEnabled) {
      await _messaging.requestPermission();
      await _messaging.subscribeToTopic(_topic);
    } else {
      await _messaging.unsubscribeFromTopic(_topic);
    }

    await _localDataProvider.setValue(key: _isPushNotificationsEnabledKey, value: isEnabled);
  }

  NotificationPlatformType _deviceNotificationPlatform() {
    if (Platform.isAndroid) return NotificationPlatformType.android;
    if (Platform.isIOS) return NotificationPlatformType.ios;
    return NotificationPlatformType.unknown;
  }
}

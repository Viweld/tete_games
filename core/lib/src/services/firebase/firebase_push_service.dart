import 'dart:developer' as developer;

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@lazySingleton
class FirebasePushService {
  static const Duration _apnsPollInterval = Duration(milliseconds: 500);
  static const Duration _apnsWaitTimeout = Duration(seconds: 10);

  final PushEventsRepository _eventsRepository;
  final NotificationsRepository _notificationsRepository;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final StreamController<String> _tokenController = StreamController<String>.broadcast();

  Stream<String> get onTokenRefresh => _tokenController.stream;

  bool _initialized = false;
  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onOpenedAppSub;
  StreamSubscription<String>? _onTokenRefreshSub;

  FirebasePushService({
    required PushEventsRepository eventsRepository,
    required NotificationsRepository notificationsRepository,
  }) : _eventsRepository = eventsRepository,
       _notificationsRepository = notificationsRepository;

  Future<void> initialize() async {
    if (_initialized) return;

    try {
      await _messaging.requestPermission();

      _onMessageSub = FirebaseMessaging.onMessage.listen(_onMessage);
      _onOpenedAppSub = FirebaseMessaging.onMessageOpenedApp.listen(_handleNavigation);

      final RemoteMessage? initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        _handleNavigation(initialMessage);
      }

      _onTokenRefreshSub = _messaging.onTokenRefresh.listen(_tokenController.add);

      _initialized = true;
    } catch (e, st) {
      await _onMessageSub?.cancel();
      await _onOpenedAppSub?.cancel();
      await _onTokenRefreshSub?.cancel();
      _onMessageSub = null;
      _onOpenedAppSub = null;
      _onTokenRefreshSub = null;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<String?> getToken() async {
    if (Platform.isIOS) {
      final String? apnsToken = await _waitForApnsToken();
      if (apnsToken == null) {
        developer.log(
          'APNS token is not available; skipping FCM token fetch',
          name: 'FirebasePushService',
        );
        return null;
      }
    }

    try {
      return await _messaging.getToken();
    } on Object catch (error, stackTrace) {
      developer.log(
        'Failed to fetch FCM token',
        name: 'FirebasePushService',
        error: error,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<String?> _waitForApnsToken({
    Duration timeout = _apnsWaitTimeout,
    Duration pollInterval = _apnsPollInterval,
  }) async {
    final Stopwatch stopwatch = Stopwatch()..start();
    while (stopwatch.elapsed < timeout) {
      try {
        final String? token = await _messaging.getAPNSToken();
        if (token != null) return token;
      } on Object catch (error, stackTrace) {
        developer.log(
          'Failed to read APNS token',
          name: 'FirebasePushService',
          error: error,
          stackTrace: stackTrace,
        );
        return null;
      }
      await Future<void>.delayed(pollInterval);
    }
    return null;
  }

  @disposeMethod
  void dispose() {
    _onMessageSub?.cancel();
    _onOpenedAppSub?.cancel();
    _onTokenRefreshSub?.cancel();
    _onMessageSub = null;
    _onOpenedAppSub = null;
    _onTokenRefreshSub = null;
    _initialized = false;
    _tokenController.close();
  }

  Future<void> _onMessage(RemoteMessage message) async {
    final bool isEnabled = await _notificationsRepository.isPushNotificationsEnabled();
    if (!isEnabled) return;

    final Map<String, dynamic> data = message.data;
    final RemoteNotification? notification = message.notification;

    final String title = notification?.title ?? data['title'] ?? '';
    final String body = notification?.body ?? data['body'] ?? '';

    if (title.isEmpty && body.isEmpty) return;

    final UserNotification incoming = UserNotification(
      id: int.tryParse(data['id']?.toString() ?? '') ?? DateTime.now().millisecondsSinceEpoch,
      title: title,
      body: body,
      payload: Map<String, dynamic>.from(data),
      createdAt: DateTime.now(),
    );

    await _notificationsRepository.addNotification(incoming);
  }

  void _handleNavigation(RemoteMessage message) {
    final String? orderId = message.data['order_id']?.toString();

    if (orderId != null) {
      _eventsRepository.emitNavigation(PushNavigationEvent(orderId: orderId));
    }
  }
}

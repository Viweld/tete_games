import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'main_app_bar_notification_bloc.freezed.dart';
part 'main_app_bar_notification_event.dart';
part 'main_app_bar_notification_state.dart';

@injectable
class MainAppBarNotificationBloc
    extends Bloc<MainAppBarNotificationEvent, MainAppBarNotificationState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<AuthenticationState> _authStateSubscription;
  final NotificationsRepository _notificationsRepository;

  MainAppBarNotificationBloc(this._authRepository, this._notificationsRepository)
    : super(MainAppBarNotificationState(authState: _authRepository.authState)) {
    on<MainAppBarNotificationEvent>(
      (MainAppBarNotificationEvent event, Emitter<MainAppBarNotificationState> emit) => event.map(
        loadIndicator: (_) => _onLoadIndicator(emit),
        authStateChanged: (_SupportEventAuthStateChanged e) => _onAuthStateChanged(e, emit),
      ),
    );
    _authStateSubscription = _authRepository.authStateStream.listen(_authStateStreamListener);

    add(const MainAppBarNotificationEvent.loadIndicator());
  }

  Future<void> _onLoadIndicator(Emitter<MainAppBarNotificationState> emit) async {
    if (state.authState is NotAuthenticated) return;

    try {
      final UnreadIndicator unreadIndicator = await _notificationsRepository.getUnreadIndicator();

      emit(state.copyWith(unreadIndicator: unreadIndicator));
    } catch (_) {
      rethrow;
    }
  }

  void _authStateStreamListener(AuthenticationState authState) {
    if (isClosed) return;
    add(MainAppBarNotificationEvent.authStateChanged(authState));

    if (authState is Authenticated) {
      add(const MainAppBarNotificationEvent.loadIndicator());
    }
  }

  void _onAuthStateChanged(
    _SupportEventAuthStateChanged event,
    Emitter<MainAppBarNotificationState> emit,
  ) {
    emit(state.copyWith(authState: event.authState));
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }
}

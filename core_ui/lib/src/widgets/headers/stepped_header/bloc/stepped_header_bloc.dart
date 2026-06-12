import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'stepped_header_bloc.freezed.dart';
part 'stepped_header_event.dart';
part 'stepped_header_state.dart';

@injectable
class SteppedHeaderBloc extends Bloc<SteppedHeaderEvent, SteppedHeaderState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<AuthenticationState> _authStreamSubscription;

  SteppedHeaderBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(SteppedHeaderState(isAuthenticated: authRepository.authState is Authenticated)) {
    on<SteppedHeaderEvent>((SteppedHeaderEvent event, Emitter<SteppedHeaderState> emit) {
      event.map(authStatusChanged: (_AuthStatusChanged e) => _onAuthStatusChanged(e, emit));
    });

    _authStreamSubscription = _authRepository.authStateStream.listen(_authStatusListener);
  }

  void _authStatusListener(AuthenticationState authState) {
    if (isClosed) return;
    add(SteppedHeaderEvent.authStatusChanged(authState));
  }

  void _onAuthStatusChanged(_AuthStatusChanged event, Emitter<SteppedHeaderState> emit) {
    emit(state.copyWith(isAuthenticated: event.authState is Authenticated));
  }

  @override
  Future<void> close() {
    _authStreamSubscription.cancel();
    return super.close();
  }
}

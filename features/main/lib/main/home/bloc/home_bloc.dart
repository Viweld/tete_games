import 'package:core/core.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_effect.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(
      (HomeEvent event, Emitter<HomeState> emit) => event.map(
        init: (_) => _onInit(emit),
        refreshRequested: (_) => _onRefreshRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );
    add(const HomeEvent.init());
  }

  Future<void> _onInit(Emitter<HomeState> emit) async {
    // TODO: load initial data
  }

  Future<void> _onRefreshRequested(Emitter<HomeState> emit) async {
    // TODO: refresh
  }

  void _onEffectHandled(Emitter<HomeState> emit) {
    emit(state.copyWith(effect: null));
  }
}

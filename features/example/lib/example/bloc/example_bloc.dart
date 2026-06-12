import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

part 'example_event.dart';
part 'example_state.dart';
part 'example_effect.dart';
part 'example_bloc.freezed.dart';

@injectable
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(const ExampleState()) {
    on<ExampleEvent>(
      (ExampleEvent event, Emitter<ExampleState> emit) => event.map(
        initialize: (_) => _onInitialize(emit),
        refresh: (_) => _onRefresh(emit),
        navigateExample: (_) => _onNavigateExample(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );
  }

  Future<void> _onInitialize(Emitter<ExampleState> emit) async {
    // TODO(Vadim): Initialize state here
  }

  Future<void> _onRefresh(Emitter<ExampleState> emit) async {
    // TODO(Vadim): Implement refresh screen logic
  }

  void _onNavigateExample(Emitter<ExampleState> emit) {
    emit(state.copyWith(effect: const ExampleEffect.navigateExample()));
  }

  void _onEffectHandled(Emitter<ExampleState> emit) {
    emit(state.copyWith(effect: null));
  }
}

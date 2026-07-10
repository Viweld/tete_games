import 'package:core/core.dart';

part '{{screen_name.snakeCase()}}_event.dart';
part '{{screen_name.snakeCase()}}_state.dart';
part '{{screen_name.snakeCase()}}_effect.dart';
part '{{screen_name.snakeCase()}}_bloc.freezed.dart';

@injectable
class {{screen_name.pascalCase()}}Bloc extends Bloc<{{screen_name.pascalCase()}}Event, {{screen_name.pascalCase()}}State> {
  {{screen_name.pascalCase()}}Bloc() : super(const {{screen_name.pascalCase()}}State()) {
    on<{{screen_name.pascalCase()}}Event>(
      ({{screen_name.pascalCase()}}Event event, Emitter<{{screen_name.pascalCase()}}State> emit) => event.map(
        init: (_) => _onInit(emit),
        refreshRequested: (_) => _onRefreshRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );
    add(const {{screen_name.pascalCase()}}Event.init());
  }

  Future<void> _onInit(Emitter<{{screen_name.pascalCase()}}State> emit) async {
    // TODO: load initial data
  }

  Future<void> _onRefreshRequested(Emitter<{{screen_name.pascalCase()}}State> emit) async {
    // TODO: refresh
  }

  void _onEffectHandled(Emitter<{{screen_name.pascalCase()}}State> emit) {
    emit(state.copyWith(effect: null));
  }
}

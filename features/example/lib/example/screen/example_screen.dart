import 'package:core/core.dart';
import 'package:example/example/bloc/example_bloc.dart';
import 'package:example/example/screen/example_content.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = appLocator<AppRouter>();

    return BlocProvider<ExampleBloc>(
      create: (_) => appLocator<ExampleBloc>(),
      child: BlocConsumer<ExampleBloc, ExampleState>(
        listenWhen: (ExampleState previous, ExampleState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, ExampleState state) {
          final ExampleEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(navigateExample: router.navigateExample);

          context.read<ExampleBloc>().add(const ExampleEvent.effectHandled());
        },
        builder: (BuildContext context, ExampleState state) {
          return const ExampleContent();
        },
      ),
    );
  }
}

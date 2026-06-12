import 'package:core/core.dart';
import 'package:main/main/home/home_content.dart';
import 'package:main/main/home/bloc/home_bloc.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter router = appLocator<AppRouter>();

    return BlocProvider<HomeBloc>(
      create: (_) => appLocator<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (HomeState previous, HomeState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, HomeState state) {
          final HomeEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(navigateBack: router.navigateBack);

          context.read<HomeBloc>().add(const HomeEvent.effectHandled());
        },
        builder: (BuildContext context, HomeState state) => HomeContent(
          isLoading: state.isLoading,
          error: state.error,
        ),
      ),
    );
  }
}

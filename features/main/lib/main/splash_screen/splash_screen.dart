import 'package:core/core.dart';
import 'package:main/main/splash_screen/bloc/splash_bloc.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    final AppRouter router = appLocator<AppRouter>();

    return BlocProvider<SplashBloc>(
      lazy: false,
      create: (_) => appLocator<SplashBloc>(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listenWhen: (SplashState previous, SplashState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, SplashState state) {
          final SplashEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(navigateRoot: router.navigateRoot);

          context.read<SplashBloc>().add(const SplashEvent.effectHandled());
        },
        builder: (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}

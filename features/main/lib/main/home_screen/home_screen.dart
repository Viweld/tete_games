import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/home_content.dart';
import 'package:main/main/home_screen/widgets/client_session_dialog/client_session_dialog.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:main/main/home_screen/widgets/server_session_dialog/server_session_dialog.dart';
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
        listenWhen: (HomeState previous, HomeState current) => previous.effect != current.effect,
        listener: (BuildContext context, HomeState state) async {
          final HomeEffect? effect = state.effect;
          if (effect == null) return;

          await effect.when(
            showNicknameDialog: (PeerRole role) async {
              final bool? saved = await NicknameDialog.show(context);
              if (!context.mounted || saved != true) return;

              if (role == PeerRole.server) {
                await ServerSessionDialog.show(context);
              } else {
                await ClientSessionDialog.show(context);
              }
            },
            showServerSessionDialog: () => ServerSessionDialog.show(context),
            showClientSessionDialog: () => ClientSessionDialog.show(context),
            navigateToGamesList: router.navigateGamesList,
          );

          if (context.mounted) {
            context.read<HomeBloc>().add(const HomeEvent.effectHandled());
          }
        },
        builder: (BuildContext context, HomeState state) =>
            HomeContent(phase: state.phase, isLoading: state.isLoading, errorKind: state.errorKind),
      ),
    );
  }
}

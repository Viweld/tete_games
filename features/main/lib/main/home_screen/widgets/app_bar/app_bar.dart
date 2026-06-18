import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart';
import 'package:main/main/home_screen/widgets/app_bar/widgets/open_drawer_button.dart';
import 'package:main/main/home_screen/widgets/app_bar/widgets/users_container.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late final HomeAppBarBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = appLocator<HomeAppBarBloc>();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeAppBarBloc>.value(
      value: _bloc,
      child: BlocBuilder<HomeAppBarBloc, HomeAppBarState>(
        builder: (BuildContext context, HomeAppBarState state) {
          final AppColorsTheme colors = context.colors;
          final Color background = state.isConnected
              ? colors.background.successGreen
              : colors.background.secondaryCard;

          return AppBar(
            backgroundColor: background,
            title: UsersContainer(
              isConnected: state.isConnected,
              localUserName: state.localDisplayName,
              remoteUserName: state.remoteDisplayName,
            ),
            actions: const <Widget>[OpenDrawerButton()],
          );
        },
      ),
    );
  }
}

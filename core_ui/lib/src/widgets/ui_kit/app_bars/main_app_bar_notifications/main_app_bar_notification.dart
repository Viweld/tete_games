import 'package:core/core.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar_notifications/bloc/main_app_bar_notification_bloc.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar_notifications/widgets/app_bell_authenticated.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar_notifications/widgets/app_bell_not_authenticated.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

class AppBarBellButton extends StatelessWidget {
  const AppBarBellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainAppBarNotificationBloc>(
      create: (_) => appLocator<MainAppBarNotificationBloc>(),
      child: BlocBuilder<MainAppBarNotificationBloc, MainAppBarNotificationState>(
        builder: (BuildContext context, MainAppBarNotificationState state) {
          final AuthenticationState authState = state.authState;

          return switch (authState) {
            NotAuthenticated() => const AppBellNotAuthenticated(),
            Authenticated() => AppBellAuthenticated(unreadIndicator: state.unreadIndicator),
          };
        },
      ),
    );
  }
}

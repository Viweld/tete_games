import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class GamesListScreen extends StatelessWidget {
  const GamesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final AppRouter router = appLocator<AppRouter>();

    return AppScaffold(
      appBar: AppBar(
        title: Text(l10n.peer_games_list_title),
        leading: BackButton(onPressed: router.navigateBack),
      ),
      body: Center(child: Text(l10n.peer_games_list_stub)),
    );
  }
}

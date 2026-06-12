import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.phase,
    required this.isLoading,
    required this.errorKind,
  });

  final HomePhase phase;
  final bool isLoading;
  final HomeErrorKind? errorKind;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final HomeBloc bloc = context.read<HomeBloc>();

    if (phase == HomePhase.initializing || isLoading) {
      return AppScaffold(
        appBar: AppBar(title: Text(l10n.peer_home_title)),
        body: const Center(child: AppCircularLoadingIndicator()),
      );
    }

    if (errorKind == HomeErrorKind.initializationFailed) {
      return AppScaffold(
        appBar: AppBar(title: Text(l10n.peer_home_title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(l10n.something_went_wrong),
              const SizedBox(height: 16),
              AppElevatedButton(
                title: l10n.peer_home_retry_button,
                onTap: () => bloc.add(const HomeEvent.init()),
              ),
            ],
          ),
        ),
      );
    }

    return AppScaffold(
      appBar: AppBar(title: Text(l10n.peer_home_title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.bluetooth, size: 64, color: context.colors.text.accent),
            const SizedBox(height: 32),
            Text(l10n.peer_home_mode_prompt, textAlign: TextAlign.center),
            const SizedBox(height: 48),
            AppElevatedButton(
              title: l10n.peer_home_start_server_button,
              prefix: const Icon(Icons.visibility),
              onTap: () => bloc.add(const HomeEvent.startServerSessionTapped()),
            ),
            const SizedBox(height: 16),
            AppElevatedButton(
              title: l10n.peer_home_start_client_button,
              style: AppElevatedButtonStyle.accent,
              prefix: const Icon(Icons.search),
              onTap: () => bloc.add(const HomeEvent.startClientSessionTapped()),
            ),
          ],
        ),
      ),
    );
  }
}

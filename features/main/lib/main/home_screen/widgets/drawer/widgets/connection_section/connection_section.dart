import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/connection_section/bloc/connection_section_bloc.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/connection_section/widgets/bluetooth_status_indicators/bluetooth_status_indicators.dart';

class ConnectionSection extends StatefulWidget {
  const ConnectionSection({super.key, required this.onConnectTap, required this.onDisconnectTap});

  final VoidCallback onConnectTap;
  final VoidCallback onDisconnectTap;

  @override
  State<ConnectionSection> createState() => _ConnectionSectionState();
}

class _ConnectionSectionState extends State<ConnectionSection> with WidgetsBindingObserver {
  late final ConnectionSectionBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = appLocator<ConnectionSectionBloc>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _bloc.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _bloc.add(const ConnectionSectionEvent.appResumed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectionSectionBloc>.value(
      value: _bloc,
      child: BlocConsumer<ConnectionSectionBloc, ConnectionSectionState>(
        listenWhen: (ConnectionSectionState previous, ConnectionSectionState current) =>
            previous.effect != current.effect,
        listener: _handleEffect,
        builder: (BuildContext context, ConnectionSectionState state) {
          final AppLocalization localization = context.localization;
          final ConnectionSectionBloc bloc = context.read<ConnectionSectionBloc>();
          final bool isBluetoothReady = state.arePermissionsGranted && state.isAdapterEnabled;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Align(alignment: Alignment.centerLeft, child: BluetoothStatusIndicators()),
                const SizedBox(height: 16),
                if (state.isConnected)
                  AppElevatedButton(
                    title: localization.peer_home_menu_disconnect,
                    style: AppElevatedButtonStyle.red,
                    onTap: () => bloc.add(const ConnectionSectionEvent.disconnectTapped()),
                  )
                else
                  AppElevatedButton(
                    title: localization.peer_home_menu_connect,
                    state: isBluetoothReady ? ElementState.enabled : ElementState.disabled,
                    onTap: widget.onConnectTap,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleEffect(BuildContext context, ConnectionSectionState state) async {
    final ConnectionSectionEffect? effect = state.effect;
    if (effect == null) return;

    final ConnectionSectionBloc bloc = context.read<ConnectionSectionBloc>();

    await effect.when(
      showPermissionsGrantedInfo: () => _showPermissionsGrantedInfo(context),
      showPermissionsDeniedSettings: () => _showPermissionsDeniedSettings(context, bloc),
      showAdapterEnabledInfo: () => _showAdapterEnabledInfo(context),
      showAdapterDisabledInfo: () => _showAdapterDisabledInfo(context),
      showDisconnectConfirmation: () => _showDisconnectConfirmation(context),
    );

    bloc.add(const ConnectionSectionEvent.effectHandled());
  }

  Future<void> _showPermissionsGrantedInfo(BuildContext context) {
    final AppLocalization localization = context.localization;

    return AppProposalDialog.show(
      context,
      title: localization.peer_home_bluetooth_permissions_granted_dialog_title,
      message: '',
      buttonText: localization.peer_dialog_ok,
    );
  }

  Future<void> _showPermissionsDeniedSettings(
    BuildContext context,
    ConnectionSectionBloc bloc,
  ) async {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;

    final bool? openSettings = await AppAdviceDialog.show(
      context,
      title: localization.peer_home_bluetooth_permissions_denied_dialog_title,
      outlinedButtonText: localization.peer_dialog_cancel,
      accentButtonText: localization.peer_dialog_open_settings,
      content: Text(
        localization.peer_home_bluetooth_permissions_denied_dialog_message,
        style: AppFonts.b2.copyWith(color: colors.text.main),
      ),
    );

    if (!context.mounted && openSettings != true) return;
    bloc.add(const ConnectionSectionEvent.openAppSettingsRequested());
  }

  Future<void> _showAdapterEnabledInfo(BuildContext context) {
    final AppLocalization localization = context.localization;

    return AppProposalDialog.show(
      context,
      title: localization.peer_home_bluetooth_adapter_enabled_dialog_title,
      message: '',
      buttonText: localization.peer_dialog_ok,
    );
  }

  Future<void> _showAdapterDisabledInfo(BuildContext context) {
    final AppLocalization localization = context.localization;

    return AppProposalDialog.show(
      context,
      title: localization.peer_home_bluetooth_adapter_disabled_dialog_title,
      message: localization.peer_home_bluetooth_adapter_disabled_dialog_message,
      buttonText: localization.peer_dialog_ok,
    );
  }

  Future<void> _showDisconnectConfirmation(BuildContext context) async {
    final AppLocalization localization = context.localization;

    final bool? confirmed = await AppAdviceDialog.show(
      context,
      title: localization.peer_home_drawer_disconnect_confirm_title,
      outlinedButtonText: localization.peer_dialog_cancel,
      accentButtonText: localization.peer_dialog_yes,
      content: Text(
        localization.peer_home_drawer_disconnect_confirm_message,
        style: AppFonts.b2.copyWith(color: context.colors.text.main),
      ),
    );

    if (confirmed == true) {
      widget.onDisconnectTap();
    }
  }
}

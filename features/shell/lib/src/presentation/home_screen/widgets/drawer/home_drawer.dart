import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:shell/src/presentation/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart';
import 'package:shell/src/presentation/home_screen/widgets/drawer/widgets/download_dialog.dart';
import 'package:shell/src/presentation/home_screen/widgets/drawer/widgets/drawer_tile.dart';
import 'package:shell/src/presentation/home_screen/widgets/drawer/widgets/footer.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback onEditProfileTap;
  final VoidCallback onConnectTap;
  final VoidCallback onDisconnectTap;

  const HomeDrawer({
    super.key,
    required this.onEditProfileTap,
    required this.onConnectTap,
    required this.onDisconnectTap,
  });

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with WidgetsBindingObserver {
  late final HomeDrawerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeDrawerBloc>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _bloc.add(const HomeDrawerEvent.appResumed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeDrawerBloc>.value(
      value: _bloc,
      child: BlocConsumer<HomeDrawerBloc, HomeDrawerState>(
        listenWhen: (HomeDrawerState previous, HomeDrawerState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, HomeDrawerState state) async {
          final HomeDrawerEffect? effect = state.effect;
          if (effect == null) return;

          final HomeDrawerBloc bloc = context.read<HomeDrawerBloc>();

          await effect.when(
            showPermissionsGrantedInfo: () => _showPermissionsGrantedInfo(context),
            showPermissionsDeniedSettings: () => _showPermissionsDeniedSettings(context, bloc),
            showAdapterEnabledInfo: () => _showAdapterEnabledInfo(context),
            showAdapterDisabledInfo: () => _showAdapterDisabledInfo(context),
            showDisconnectConfirmation: () => _showDisconnectConfirmation(context),
            editProfileRequested: () async => widget.onEditProfileTap(),
          );

          bloc.add(const HomeDrawerEvent.effectHandled());
        },
        builder: (BuildContext context, HomeDrawerState state) {
          final AppColorsTheme colors = context.colors;
          final AppLocalization localization = context.localization;
          final HomeDrawerBloc bloc = context.read<HomeDrawerBloc>();
          final String resolvedName = state.profile?.displayName ?? '';
          final bool isBluetoothReady = state.arePermissionsGranted && state.isAdapterEnabled;
          final bool isConnectEnabled = resolvedName.isNotEmpty && isBluetoothReady;

          return Drawer(
            backgroundColor: colors.background.secondaryCard,
            width: MediaQuery.sizeOf(context).width * 0.85,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(top: 16, bottom: 12),
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Colors.white, blurRadius: 34, spreadRadius: 24),
                        ],
                      ),
                      child: AppImages.appLogo.call(),
                    ),
                  ),
                  DrawerTile(
                    leading: resolvedName.isEmpty
                        ? AppIcons.avatarPlug.call()
                        : UserLabel(label: resolvedName),
                    title: resolvedName.isNotEmpty ? resolvedName : '',
                    subtitle: resolvedName.isNotEmpty
                        ? localization.peer_home_drawer_nickname_subtitle_filled
                        : localization.peer_home_drawer_nickname_subtitle_empty,
                    isChecked: resolvedName.isNotEmpty,
                    onTap: () => bloc.add(const HomeDrawerEvent.editProfileTapped()),
                  ),
                  DrawerTile(
                    leading: AppIcons.btPermissionGranted.call(),
                    title: localization.peer_home_drawer_bluetooth_access_title,
                    subtitle: state.arePermissionsGranted
                        ? localization.peer_home_bluetooth_permissions_ok
                        : localization.peer_home_bluetooth_permissions_missing,
                    isChecked: state.arePermissionsGranted,
                    onTap: () => bloc.add(const HomeDrawerEvent.permissionIconTapped()),
                  ),
                  DrawerTile(
                    leading: AppIcons.btControllerEnabled.call(),
                    title: localization.peer_home_drawer_bluetooth_adapter_title,
                    subtitle: state.isAdapterEnabled
                        ? localization.peer_home_bluetooth_adapter_on
                        : localization.peer_home_bluetooth_adapter_off,
                    isChecked: state.isAdapterEnabled,
                    onTap: () => bloc.add(const HomeDrawerEvent.adapterIconTapped()),
                  ),
                  const SizedBox(height: 16),
                  if (state.isConnected)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppElevatedButton(
                        title: localization.peer_home_menu_disconnect,
                        style: AppElevatedButtonStyle.red,
                        onTap: () => bloc.add(const HomeDrawerEvent.disconnectTapped()),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppElevatedButton(
                        title: localization.peer_home_menu_connect,
                        state: isConnectEnabled ? ElementState.enabled : ElementState.disabled,
                        onTap: widget.onConnectTap,
                      ),
                    ),
                  const SizedBox(height: 16),
                  const AppDivider(),
                  const Spacer(),
                  const AppDivider(),
                  DrawerTile(
                    title: localization.peer_home_drawer_download,
                    leading: AppIcons.qrScan.call(),
                    onTap: () => DownloadDialog.show(context),
                  ),
                  const AppDivider(),
                  const SizedBox(height: 16),
                  const Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
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

  Future<void> _showPermissionsDeniedSettings(BuildContext context, HomeDrawerBloc bloc) async {
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
    bloc.add(const HomeDrawerEvent.openAppSettingsRequested());
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

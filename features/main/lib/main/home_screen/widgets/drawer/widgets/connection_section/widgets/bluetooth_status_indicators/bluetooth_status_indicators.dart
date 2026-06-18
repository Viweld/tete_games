import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/connection_section/bloc/connection_section_bloc.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/connection_section/widgets/bluetooth_status_indicators/bluetooth_status_indicator_icon.dart';

class BluetoothStatusIndicators extends StatelessWidget {
  const BluetoothStatusIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final ConnectionSectionBloc bloc = context.read<ConnectionSectionBloc>();

    return BlocBuilder<ConnectionSectionBloc, ConnectionSectionState>(
      builder: (BuildContext context, ConnectionSectionState state) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colors.background.main,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: <Widget>[
              BluetoothStatusIndicatorIcon(
                icon: state.arePermissionsGranted
                    ? AppIcons.btPermissionGranted
                    : AppIcons.btPermissionDenied,
                iconColor: state.arePermissionsGranted ? colors.text.success : colors.text.error,
                tooltip: state.arePermissionsGranted
                    ? localization.peer_home_bluetooth_permissions_ok
                    : localization.peer_home_bluetooth_permissions_missing,
                onTap: () => bloc.add(const ConnectionSectionEvent.permissionIconTapped()),
              ),
              BluetoothStatusIndicatorIcon(
                icon: state.isAdapterEnabled
                    ? AppIcons.btControllerEnabled
                    : AppIcons.btControllerDisabled,
                iconColor: state.isAdapterEnabled ? colors.text.success : colors.text.error,
                tooltip: state.isAdapterEnabled
                    ? localization.peer_home_bluetooth_adapter_on
                    : localization.peer_home_bluetooth_adapter_off,
                onTap: () => bloc.add(const ConnectionSectionEvent.adapterIconTapped()),
              ),
            ],
          ),
        );
      },
    );
  }
}

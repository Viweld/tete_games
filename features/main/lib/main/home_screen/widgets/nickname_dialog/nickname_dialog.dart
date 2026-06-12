import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart';

class NicknameDialog extends StatelessWidget {
  const NicknameDialog._();

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const NicknameDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;

    return BlocProvider<NicknameBloc>(
      create: (_) => appLocator<NicknameBloc>(),
      child: BlocConsumer<NicknameBloc, NicknameState>(
        listenWhen: (NicknameState previous, NicknameState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, NicknameState state) {
          final NicknameEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            saved: () => Navigator.of(context).pop(true),
            saveFailed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.peer_nickname_save_failed)));
            },
          );

          context.read<NicknameBloc>().add(const NicknameEvent.effectHandled());
        },
        builder: (BuildContext context, NicknameState state) {
          return AlertDialog(
            title: Text(l10n.peer_nickname_dialog_title),
            content: AppTextField(
              initialText: state.nickname,
              label: l10n.peer_nickname_field_label,
              hint: l10n.peer_nickname_field_hint,
              errorText: _validationMessage(l10n, state.validationKind),
              onChanged: (String value) =>
                  context.read<NicknameBloc>().add(NicknameEvent.nicknameChanged(nickname: value)),
            ),
            actions: <Widget>[
              AppElevatedButton(
                title: l10n.peer_nickname_save_button,
                state: state.isSaveEnabled ? ElementState.enabled : ElementState.disabled,
                onTap: () => context.read<NicknameBloc>().add(const NicknameEvent.saveTapped()),
              ),
            ],
          );
        },
      ),
    );
  }

  String? _validationMessage(AppLocalization l10n, NicknameValidationKind? kind) {
    return switch (kind) {
      NicknameValidationKind.empty => l10n.peer_nickname_validation_empty,
      NicknameValidationKind.tooLong => l10n.peer_nickname_validation_too_long,
      NicknameValidationKind.wrongFormat => l10n.peer_nickname_validation_wrong_format,
      null => null,
    };
  }
}

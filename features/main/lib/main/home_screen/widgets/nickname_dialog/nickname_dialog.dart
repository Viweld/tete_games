import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart';

class NicknameDialog extends StatelessWidget {
  const NicknameDialog._();

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(context: context, builder: (_) => const NicknameDialog._());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

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
            saveFailed: () => context.showErrorToast(localization.peer_nickname_save_failed),
          );

          context.read<NicknameBloc>().add(const NicknameEvent.effectHandled());
        },
        builder: (BuildContext context, NicknameState state) {
          final AppColorsTheme colors = context.colors;

          return AlertDialog(
            title: Text(
              localization.peer_nickname_dialog_title,
              style: AppFonts.h6.copyWith(color: colors.text.main),
            ),
            content: AppTextField(
              initialText: state.nickname,
              label: localization.peer_nickname_field_label,
              hint: localization.peer_nickname_field_hint,
              errorText: _validationMessage(localization, state.validationKind),
              onChanged: (String value) =>
                  context.read<NicknameBloc>().add(NicknameEvent.nicknameChanged(nickname: value)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  localization.peer_dialog_cancel,
                  style: AppFonts.button.copyWith(color: colors.text.main),
                ),
              ),
              AppElevatedButton(
                title: localization.peer_nickname_save_button,
                state: state.isSaveEnabled ? ElementState.enabled : ElementState.disabled,
                onTap: () => context.read<NicknameBloc>().add(const NicknameEvent.saveTapped()),
              ),
            ],
          );
        },
      ),
    );
  }

  String? _validationMessage(AppLocalization localization, NicknameValidationKind? kind) {
    return switch (kind) {
      NicknameValidationKind.empty => localization.peer_nickname_validation_empty,
      NicknameValidationKind.tooLong => localization.peer_nickname_validation_too_long,
      NicknameValidationKind.wrongFormat => localization.peer_nickname_validation_wrong_format,
      null => null,
    };
  }
}

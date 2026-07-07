import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:shell/src/presentation/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart';

class NicknameDialog extends StatelessWidget {
  const NicknameDialog._();

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierColor: context.colors.barrierColor,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: context.colors.barrierBlurSigma,
            sigmaY: context.colors.barrierBlurSigma,
          ),
          child: const NicknameDialog._(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NicknameBloc>(
      create: (_) => appLocator<NicknameBloc>(),
      child: BlocConsumer<NicknameBloc, NicknameState>(
        listenWhen: (NicknameState previous, NicknameState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, NicknameState state) {
          final NicknameEffect? effect = state.effect;
          if (effect == null) return;

          final AppLocalization localization = context.localization;

          effect.when(
            saved: () => Navigator.of(context).pop(true),
            saveFailed: () => context.showErrorToast(localization.peer_nickname_save_failed),
          );

          context.read<NicknameBloc>().add(const NicknameEvent.effectHandled());
        },
        builder: (BuildContext context, NicknameState state) {
          final AppLocalization localization = context.localization;
          final AppColorsTheme colors = context.colors;
          final NicknameBloc bloc = context.read<NicknameBloc>();

          return PopScope(
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 340),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colors.background.secondaryCard,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: colors.dialogShadows,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              localization.peer_nickname_dialog_title,
                              style: AppFonts.h3.copyWith(color: colors.text.main),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () => Navigator.of(context).pop(false),
                            child: AppIcons.cross(color: colors.text.secondary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      AppTextField(
                        initialText: state.nickname,
                        label: localization.peer_nickname_field_label,
                        hint: localization.peer_nickname_field_hint,
                        errorText: _validationMessage(localization, state.validationKind),
                        onChanged: (String value) =>
                            bloc.add(NicknameEvent.nicknameChanged(nickname: value)),
                      ),
                      const SizedBox(height: 24),
                      AppOutlinedButton(
                        title: localization.peer_dialog_cancel,
                        onTap: () => Navigator.of(context).pop(false),
                      ),
                      const SizedBox(height: 12),
                      AppElevatedButton(
                        title: localization.peer_nickname_save_button,
                        state: state.isSaveEnabled ? ElementState.enabled : ElementState.disabled,
                        onTap: () => bloc.add(const NicknameEvent.saveTapped()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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

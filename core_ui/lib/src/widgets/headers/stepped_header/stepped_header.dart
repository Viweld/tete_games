part of '../headers.dart';

class SteppedHeader extends StatelessWidget {
  final String title;
  final ({int authed, int unauthed}) step;
  final ({int authed, int unauthed}) allSteps;
  final String? subtitle;

  const SteppedHeader({
    super.key,
    required this.title,
    required this.step,
    required this.allSteps,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SteppedHeaderBloc>(
      create: (_) => appLocator<SteppedHeaderBloc>(),
      child: BlocBuilder<SteppedHeaderBloc, SteppedHeaderState>(
        builder: (BuildContext context, SteppedHeaderState state) {
          final int currentStep = state.isAuthenticated ? step.authed : step.unauthed;
          final int totalSteps = state.isAuthenticated ? allSteps.authed : allSteps.unauthed;

          return Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: AppFonts.h4.copyWith(color: context.colors.text.main),
                      ),
                    ),
                    Text(
                      context.localization.stepped_header_step_label(currentStep, totalSteps),
                      style: AppFonts.label.copyWith(color: context.colors.text.secondary),
                    ),
                  ],
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppFonts.caption.copyWith(color: context.colors.text.main),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

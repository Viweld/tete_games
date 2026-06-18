import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/profile_section/bloc/profile_section_bloc.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key, required this.onEditProfileTap});

  final VoidCallback onEditProfileTap;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late final ProfileSectionBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = appLocator<ProfileSectionBloc>();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileSectionBloc>.value(
      value: _bloc,
      child: BlocConsumer<ProfileSectionBloc, ProfileSectionState>(
        listenWhen: (ProfileSectionState previous, ProfileSectionState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, ProfileSectionState state) {
          final ProfileSectionEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(editProfileRequested: widget.onEditProfileTap);

          context.read<ProfileSectionBloc>().add(const ProfileSectionEvent.effectHandled());
        },
        builder: (BuildContext context, ProfileSectionState state) {
          final AppLocalization localization = context.localization;
          final AppColorsTheme colors = context.colors;
          final ProfileSectionBloc bloc = context.read<ProfileSectionBloc>();
          final String resolvedName = state.profile?.displayName ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    UserLabel(label: resolvedName.isEmpty ? '?' : resolvedName),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        resolvedName.isEmpty ? '—' : resolvedName,
                        style: AppFonts.h4.copyWith(color: colors.text.main),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (state.isConnected)
                  AppTextButton(
                    title: localization.peer_home_drawer_edit_name,
                    prefix: AppIcons.edit.call(),
                    state: ElementState.disabled,
                    onTap: () => bloc.add(const ProfileSectionEvent.editProfileTapped()),
                  )
                else
                  AppTextButton(
                    title: localization.peer_home_drawer_edit_name,
                    prefix: AppIcons.edit.call(),
                    onTap: () => bloc.add(const ProfileSectionEvent.editProfileTapped()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

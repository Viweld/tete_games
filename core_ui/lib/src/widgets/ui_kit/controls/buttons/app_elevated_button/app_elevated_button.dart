import 'package:core_ui/core_ui.dart';

enum AppElevatedButtonStyle { primary, red, accent }

enum AppElevatedButtonSize { normal }

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final AppElevatedButtonStyle style;
  final AppElevatedButtonSize size;
  final ElementState state;
  final bool isExpanded;
  final Widget? prefix;
  final Widget? postfix;
  final MainAxisAlignment mainAxisAlignment;

  const AppElevatedButton({
    required this.title,
    required this.onTap,
    this.style = AppElevatedButtonStyle.primary,
    this.state = ElementState.enabled,
    this.size = AppElevatedButtonSize.normal,
    this.isExpanded = true,
    this.prefix,
    this.postfix,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Color contentColor = AppElevatedButtonMapper.getContentColor(
      colors: colors,
      style: style,
      state: state,
    );

    final Color backgroundColor = AppElevatedButtonMapper.getBackgroundColor(
      colors: colors,
      style: style,
      state: state,
    );

    final TextStyle textStyle = AppElevatedButtonMapper.getTextStyle(
      size: size,
    ).copyWith(color: contentColor);
    final double height = AppElevatedButtonMapper.getHeight(size: size);
    final double radius = AppElevatedButtonMapper.getRadius(size: size);
    final double horizontalPadding = AppElevatedButtonMapper.getHorizontalPadding(size: size);

    return AbsorbPointer(
      absorbing: state == ElementState.loading,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: FilledButton(
          style: FilledButton.styleFrom(
            foregroundColor: contentColor,
            backgroundColor: backgroundColor,
            disabledForegroundColor: contentColor,
            disabledBackgroundColor: backgroundColor,
            elevation: 0,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            fixedSize: Size.fromHeight(height),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
          onPressed: state == ElementState.enabled ? onTap : null,
          child: Row(
            mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: state == ElementState.loading
                ? <Widget>[AppLoadingIndicator(color: contentColor)]
                : <Widget>[
                    ?prefix,
                    isExpanded
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              title,
                              style: textStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Text(
                            title,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                    ?postfix,
                  ],
          ),
        ),
      ),
    );
  }
}

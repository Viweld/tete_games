import 'package:core_ui/core_ui.dart';

enum AppOutlinedButtonStyle { primary, error }

enum AppOutlinedButtonSize { normal }

class AppOutlinedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final AppOutlinedButtonStyle style;
  final AppOutlinedButtonSize size;
  final ElementState state;
  final bool isExpanded;
  final Widget? prefix;
  final Widget? postfix;
  final double borderRadius;

  const AppOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.style = AppOutlinedButtonStyle.primary,
    this.size = AppOutlinedButtonSize.normal,
    this.state = ElementState.enabled,
    this.isExpanded = true,
    this.prefix,
    this.postfix,
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Color contentColor = AppOutlinedButtonMapper.getContentColor(
      colors: colors,
      style: style,
      state: state,
    );

    final Color borderColor = AppOutlinedButtonMapper.getBorderColor(colors: colors, style: style);

    final TextStyle textStyle = AppOutlinedButtonMapper.getTextStyle(
      size: size,
    ).copyWith(color: contentColor);
    final double height = AppOutlinedButtonMapper.getHeight(size: size);
    final double radius = AppOutlinedButtonMapper.getRadius(size: size);
    final double horizontalPadding = AppOutlinedButtonMapper.getHorizontalPadding(size: size);

    return AbsorbPointer(
      absorbing: state == ElementState.loading,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: contentColor,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: contentColor,
          side: BorderSide(color: borderColor),
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
              ? <Widget>[AppDotsLoadingIndicator(color: contentColor)]
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
    );
  }
}

import 'package:core_ui/core_ui.dart';

enum AppTextButtonStyle { primary, red }

enum AppTextButtonSize { normal }

class AppTextButton extends StatelessWidget {
  final AppTextButtonStyle style;
  final AppTextButtonSize size;
  final ElementState state;
  final String title;
  final Widget? prefix;
  final Widget? postfix;
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback onTap;
  final TextDecoration textDecoration;
  final double expandedSize;
  final AppTextButtonSize textStyle;

  const AppTextButton({
    required this.title,
    required this.onTap,
    this.expandedSize = 48,
    this.style = AppTextButtonStyle.primary,
    this.size = AppTextButtonSize.normal,
    this.state = ElementState.enabled,
    this.textDecoration = TextDecoration.none,
    this.isEnabled = true,
    this.isExpanded = true,
    this.prefix,
    this.postfix,
    this.textStyle = AppTextButtonSize.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Color contentColor = AppTextButtonMapper.getContentColor(
      colors: colors,
      style: style,
      state: state,
    );

    final TextStyle textStyle = AppTextButtonMapper.getTextStyle(
      size: size,
    ).copyWith(color: contentColor);
    final double height = AppTextButtonMapper.getHeight(size: size);
    final double radius = AppTextButtonMapper.getRadius(size: size);
    final double horizontalPadding = AppTextButtonMapper.getHorizontalPadding(size: size);

    return AbsorbPointer(
      absorbing: state == ElementState.loading,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: contentColor,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: contentColor,
          side: const BorderSide(color: Colors.transparent),
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

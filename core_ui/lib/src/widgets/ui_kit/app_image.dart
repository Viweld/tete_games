import 'package:core_ui/core_ui.dart';

class AppImage {
  static const String _pngFileRegex = r'.png$';
  static const double _defaultIconPadding = 0;

  final String iconKey;

  bool get isPNG => iconKey.contains(RegExp(_pngFileRegex));

  const AppImage(this.iconKey);

  Widget call({
    Color? color,
    double? size,
    BoxFit? fit,
    Function()? onTap,
    double padding = _defaultIconPadding,
  }) {
    assert(isPNG, 'Implemented only for png');

    return ClipRRect(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Image.asset(
            iconKey,
            package: kPackageName,
            fit: fit ?? BoxFit.contain,
            height: size,
            width: size,
          ),
        ),
      ),
    );
  }
}

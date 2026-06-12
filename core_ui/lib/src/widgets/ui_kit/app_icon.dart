import 'package:core_ui/core_ui.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon {
  final String? _svgAsset;

  String get asset => _svgAsset ?? '';

  const AppIcon._({String? svgAsset}) : _svgAsset = svgAsset;

  const AppIcon.asset(String assetKey) : this._(svgAsset: assetKey);

  Widget call({
    Color? color,
    double size = AppDimens.defaultIconSize,
    BoxFit? fit,
    Function()? onTap,
    double padding = 0,
  }) {
    final double splashRadius = (size / 2) + padding + 8;
    final double splashDiameter = splashRadius * 2;

    return Builder(
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(padding),
              child: _svgAsset == null
                  ? const SizedBox.shrink()
                  : SvgPicture.asset(
                      _svgAsset,
                      package: kPackageName,
                      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
                      fit: fit ?? BoxFit.scaleDown,
                      height: size,
                      width: size,
                    ),
            ),
            Positioned(
              width: splashDiameter,
              height: splashDiameter,
              child: Theme(
                data: onTap != null
                    ? context.theme
                    : context.theme.copyWith(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                      ),
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.all(Radius.circular(splashRadius)),
                  clipBehavior: Clip.hardEdge,
                  child: InkResponse(
                    borderRadius: BorderRadius.all(Radius.circular(splashRadius)),
                    radius: splashRadius,
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

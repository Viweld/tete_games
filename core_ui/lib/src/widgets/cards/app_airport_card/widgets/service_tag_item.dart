import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

class ServiceTagItem extends StatelessWidget {
  final AirportServiceTag tag;
  final double dotSize;
  final AppColorsTheme colors;

  const ServiceTagItem({super.key, required this.tag, required this.dotSize, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox.square(
          dimension: dotSize,
          child: DecoratedBox(
            decoration: ShapeDecoration(color: tag.color, shape: const CircleBorder()),
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            tag.label,
            style: AppFonts.caption.copyWith(color: colors.text.secondary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

part of 'image_boxes.dart';

class AppCircleFlag extends StatelessWidget {
  final String countryCode;
  final double size;

  const AppCircleFlag({super.key, required this.countryCode, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return countryCode.toLowerCase() == 'tw'
        ? AppIcons.twNeutralFlag.call(size: size)
        : CountryFlag.fromCountryCode(
            countryCode,
            theme: ImageTheme(height: size, width: size, shape: const Circle()),
          );
  }
}

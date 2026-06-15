part of 'image_boxes.dart';

class AppUserAvatar extends StatelessWidget {
  final String email;
  final String? avatarUrl;
  final String? name;
  final VoidCallback? onTap;
  final double _diameter;
  final double _borderWidth;
  final Widget? _customPlaceholder;

  const AppUserAvatar.normal({
    super.key,
    required this.email,
    required this.avatarUrl,
    required this.name,
    this.onTap,
    Widget? customPlaceholder,
  }) : _diameter = 62,
       _borderWidth = 2,
       _customPlaceholder = customPlaceholder;

  const AppUserAvatar.mini({
    super.key,
    required this.email,
    required this.avatarUrl,
    required this.name,
    this.onTap,
  }) : _diameter = 32,
       _borderWidth = 1.6,
       _customPlaceholder = null;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final double contentDiameter = _diameter - _borderWidth * 2;

    final Widget initials = name == null || (name?.isEmpty ?? false)
        ? const SizedBox.shrink()
        : LettersPlaceholder(diameter: contentDiameter, name: name, email: email);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox.square(
        dimension: _diameter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.background.main,
            shape: BoxShape.circle,
            border: Border.all(color: colors.borders.accentOrange, width: _borderWidth),
          ),
          child: Center(
            child: SizedBox.square(
              dimension: contentDiameter,
              child: ClipOval(
                child: AppNetworkImage(
                  imageUrl: avatarUrl,
                  placeholderWidget: _customPlaceholder ?? initials,
                  errorWidget: _customPlaceholder ?? initials,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A widget that displays the initials of a user's name or the first letter of their email if the name is not provided.
class LettersPlaceholder extends StatelessWidget {
  /// The email from which the first letter will be extracted if the name is not provided.
  final String email;

  /// The name from which initials will be extracted.
  final String? name;

  /// The diameter of the placeholder circle.
  final double diameter;

  const LettersPlaceholder({
    super.key,
    required this.diameter,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    // Determine the letters to display: if the name is null or empty, use the first letter of the email;
    // otherwise, extract initials from the name.
    final String letters = (name?.isEmpty ?? true)
        ? email.substring(0, 1).toUpperCase()
        : _getInitials(name!);

    final TextStyle initialsStyle = diameter <= 36
        ? AppFonts.caption.copyWith(color: colors.text.main, fontWeight: FontWeight.w700, height: 1)
        : AppFonts.b4.copyWith(color: colors.text.main, height: 1);

    return SizedBox.square(
      dimension: diameter,
      child: ColoredBox(
        color: colors.background.main,
        child: Center(child: Text(letters, style: initialsStyle)),
      ),
    );
  }

  /// Cleans the input string by removing non-letter characters and extra spaces.
  String _cleanString(String input) {
    final String result = input
        .trim()
        .replaceAll(RegExp(r'[^\p{L}\s]+', unicode: true), '')
        .replaceAll(RegExp(r'\s+'), ' ');

    return result;
  }

  /// Extracts initials from a given name.
  String _getInitials(String name) {
    final List<String> words = _cleanString(name).split(' ');

    if (words.isEmpty || words.first.isEmpty) return '';

    if (words.length == 1) return words.first[0].toUpperCase();

    return (words.first[0] + words.last[0]).toUpperCase();
  }
}

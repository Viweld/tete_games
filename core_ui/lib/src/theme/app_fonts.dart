part of 'theme.dart';

abstract final class AppFonts {
  static const String _manropeFamily = 'Manrope';

  /// Base style
  static const TextStyle base = TextStyle(fontFamily: _manropeFamily, fontWeight: FontWeight.w400);

  /// H1 — 28 / 120% / 1%
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    height: 1.2,
    letterSpacing: 28 * 0.01,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w800,
    color: AppColors.txtMain,
  );

  /// H2 — 26 / 120% / 0px
  static const TextStyle h2 = TextStyle(
    fontSize: 26,
    height: 1.2,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w800,
    color: AppColors.txtMain,
  );

  /// H3 — 22 / 120% / 0%
  static const TextStyle h3 = TextStyle(
    fontSize: 22,
    height: 1.2,
    letterSpacing: 22 * 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.txtMain,
  );

  /// H4 — 20 / 130%
  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.txtMain,
  );

  /// H5 — 18 / 130%
  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.txtMain,
  );

  /// H6 — 16 / 130%
  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.txtMain,
  );

  /// B1 — 15 / 150%
  static const TextStyle b1 = TextStyle(
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.txtMain,
  );

  /// B2 — 14 / 140%
  static const TextStyle b2 = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.txtMain,
  );

  /// B3 — 15 / 150% / Bold
  static const TextStyle b3 = TextStyle(
    fontSize: 15,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.txtMain,
  );

  /// B4 — 14 / 140% / Bold
  static const TextStyle b4 = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.txtMain,
  );

  /// Button — 15 / 120% / 0%
  static const TextStyle button = TextStyle(
    fontSize: 15,
    height: 1.2,
    letterSpacing: 15 * 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.txtMain,
  );

  /// Caption — 12 / 130%
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.txtMain,
  );

  /// Label — 12 / 120%
  static const TextStyle label = TextStyle(
    fontSize: 12,
    height: 1.2,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.txtMain,
  );

  /// Link — 14 / 140% / underline
  static const TextStyle link = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
    fontFamily: _manropeFamily,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    color: AppColors.txtMain,
  );
}

import 'dart:ui';

import 'package:core_ui/core_ui.dart';

/// A time picker widget that displays Material Design time picker dialog.
///
/// Use [AppTimePickerDialog.show] to display the time picker.
///
/// Example:
/// ```dart
/// final TimeOfDay? selectedTime = await AppTimePickerDialog.show(
///   context,
///   title: 'Select departure time',
///   initialTime: TimeOfDay.now(),
/// );
/// ```
abstract final class AppTimePickerDialog {
  /// Shows a time picker dialog and returns the selected time.
  ///
  /// Returns `null` if the user cancels the picker.
  static Future<TimeOfDay?> show(
    BuildContext context, {
    String? title,
    TimeOfDay? initialTime,
  }) async {
    final AppColorsTheme colors = context.colors;

    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      helpText: title,
      barrierColor: colors.barrierColor,
      builder: (BuildContext context, Widget? child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: colors.barrierBlurSigma,
            sigmaY: colors.barrierBlurSigma,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: colors.background.main,
                hourMinuteColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.icons.accent;
                  }
                  return colors.background.secondaryCard;
                }),
                hourMinuteTextColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return colors.text.main;
                }),
                dialHandColor: colors.icons.accent,
                dialBackgroundColor: colors.background.secondaryCard,
                dialTextColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return colors.text.main;
                }),
                entryModeIconColor: colors.icons.main,
                dayPeriodColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.icons.accent;
                  }
                  return colors.background.secondaryCard;
                }),
                dayPeriodTextColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return colors.text.main;
                }),
                hourMinuteTextStyle: AppFonts.h1,
                dayPeriodTextStyle: AppFonts.b3,
                dialTextStyle: AppFonts.b2,
                helpTextStyle: AppFonts.h3.copyWith(color: colors.text.main),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: colors.icons.accent,
                  textStyle: AppFonts.b4,
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
  }
}

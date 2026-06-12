import 'dart:ui';

import 'package:core_ui/core_ui.dart';

/// A date picker widget that displays Material Design date picker dialog.
abstract final class AppDatePickerDialog {
  static Future<DateTime?> show(
    BuildContext context, {
    required String title,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final AppColorsTheme colors = context.colors;
    final DateTime now = DateTime.now();

    return showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(now.year - 100),
      lastDate: lastDate ?? DateTime(now.year + 100),
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
              datePickerTheme: DatePickerThemeData(
                backgroundColor: colors.datePicker.backgroundColor,
                headerBackgroundColor: colors.icons.accent,
                headerForegroundColor: colors.datePicker.selectedDayTextColor,
                dayForegroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayTextColor;
                  }
                  if (states.contains(WidgetState.disabled)) {
                    return colors.datePicker.disabledDayTextColor;
                  }
                  return colors.datePicker.dayTextColor;
                }),
                dayBackgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayBackgroundColor;
                  }
                  return Colors.transparent;
                }),
                todayForegroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayTextColor;
                  }
                  return colors.datePicker.selectedDayBackgroundColor;
                }),
                todayBackgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayBackgroundColor;
                  }
                  return Colors.transparent;
                }),
                todayBorder: BorderSide(color: colors.datePicker.selectedDayBackgroundColor),
                yearForegroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayTextColor;
                  }
                  return colors.datePicker.dayTextColor;
                }),
                yearBackgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return colors.datePicker.selectedDayBackgroundColor;
                  }
                  return Colors.transparent;
                }),
                headerHeadlineStyle: AppFonts.h2.copyWith(
                  color: colors.datePicker.selectedDayTextColor,
                ),
                headerHelpStyle: AppFonts.b3.copyWith(
                  color: colors.datePicker.selectedDayTextColor,
                ),
                weekdayStyle: AppFonts.b4.copyWith(color: colors.text.secondary),
                dayStyle: AppFonts.b2.copyWith(color: colors.datePicker.dayTextColor),
                yearStyle: AppFonts.b2.copyWith(color: colors.datePicker.dayTextColor),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: colors.datePicker.selectedDayBackgroundColor,
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

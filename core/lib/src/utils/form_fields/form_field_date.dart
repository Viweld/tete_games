part of 'form_fields.dart';

/// Field for date input.
///
/// Validates that the input string matches the format 'dd.MM.yyyy'
/// and represents a valid date (e.g. existing day/month/year).
@immutable
final class FormFieldDate extends FormField<String> {
  FormFieldDate({
    super.value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.customErrorText,
    super.validators,
  });

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) {
    if (value == null || value.isEmpty) {
      return !requiredField;
    }

    try {
      final DateFormat format = DateFormat('dd.MM.yyyy');
      // strict: true ensures parsing is strict (e.g. 32.01.2023 will fail)
      final DateTime date = format.parseStrict(value);

      // Additional check to ensure string length matches format (parseStrict might be loose on year length)
      if (value.length != 10) return false;

      // Validate date is within 100 years of current date
      final DateTime now = DateTime.now();
      final DateTime minDate = DateTime(now.year - 100, now.month, now.day);
      final DateTime maxDate = DateTime(now.year + 100, now.month, now.day);

      if (date.isBefore(minDate) || date.isAfter(maxDate)) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  @override
  FormFieldDate copyWithValue(String? value) => FormFieldDate(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: customErrorText,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldDate copyWithCustomError(String? errorText) => FormFieldDate(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: errorText,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldDate copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldDate(
    value: value,
    requiredField: requiredField ?? this.requiredField,
    hideErrorState: hideErrorState ?? this.hideErrorState,
    visible: visible ?? this.visible,
    enabled: enabled ?? this.enabled,
    customErrorText: customErrorText,
    validators: validators,
  );
}

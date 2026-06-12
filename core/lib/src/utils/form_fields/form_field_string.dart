part of 'form_fields.dart';

/// Simple text input field
/// Difference from [FormFieldValue] is in the way empty value is checked
@immutable
final class FormFieldString extends FormField<String> {
  FormFieldString({
    super.value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    super.customErrorText,
    super.validators,
  });

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => true;

  // ---------------------------------------------------------------------------
  @override
  FormFieldString copyWithValue(String? value) => FormFieldString(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: customErrorText,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldString copyWithCustomError(String? errorText) => FormFieldString(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: errorText,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldString copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldString(
    value: value,
    requiredField: requiredField ?? this.requiredField,
    hideErrorState: hideErrorState ?? this.hideErrorState,
    visible: visible ?? this.visible,
    enabled: enabled ?? this.enabled,
    customErrorText: customErrorText,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );
}

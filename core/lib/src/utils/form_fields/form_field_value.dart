part of 'form_fields.dart';

/// Simple universal input field with a generic type
/// Typically suitable for a ComboBox
@immutable
final class FormFieldValue<T> extends FormField<T> {
  FormFieldValue({
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
  bool _specificValidator(T? value) => true;

  // ---------------------------------------------------------------------------
  @override
  FormFieldValue<T> copyWithValue(T? value) => FormFieldValue<T>(
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
  FormFieldValue<T> copyWithCustomError(String? errorText) => FormFieldValue<T>(
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
  FormFieldValue<T> copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldValue<T>(
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

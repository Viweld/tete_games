part of 'form_fields.dart';

/// Email input field
@immutable
final class FormFieldEmail extends FormField<String?> {
  FormFieldEmail({
    super.value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    super.customErrorText,
    super.validators,
  }) : _errorOnEmailFormat = !_validatorEmailFormat(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)+$',
  );

  // ---------------------------------------------------------------------------
  // specific properties and getters
  late final bool _errorOnEmailFormat;

  bool get errorOnEmailFormat => _errorOnEmailFormat;

  static bool _validatorEmailFormat(String? value) => _emailRegExp.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => !errorOnEmailFormat;

  // ---------------------------------------------------------------------------
  @override
  FormFieldEmail copyWithValue(String? value) => FormFieldEmail(
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
  FormFieldEmail copyWithCustomError(String? errorText) => FormFieldEmail(
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
  FormFieldEmail copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldEmail(
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

part of 'form_fields.dart';

/// Phone input field
@immutable
final class FormFieldPhone extends FormField<String?> {
  FormFieldPhone({
    super.value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    super.customErrorText,
    super.validators,
  }) : _errorOnPhoneFormat = _validatorPhoneFormat(value);

  static final RegExp _phoneRegExp = RegExp(r'^\+\d{7,15}$');

  // ---------------------------------------------------------------------------
  // specific properties and getters
  late final bool _errorOnPhoneFormat;

  bool get errorOnPhoneFormat => _errorOnPhoneFormat;

  // ---------------------------------------------------------------------------
  static bool _validatorPhoneFormat(String? value) => !_phoneRegExp.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => !_errorOnPhoneFormat;

  // ---------------------------------------------------------------------------
  @override
  FormFieldPhone copyWithValue(String? value) => FormFieldPhone(
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
  FormFieldPhone copyWithCustomError(String? errorText) => FormFieldPhone(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    customErrorText: errorText,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldPhone copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldPhone(
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

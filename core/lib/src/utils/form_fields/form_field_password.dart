part of 'form_fields.dart';

/// Password input field
@immutable
final class FormFieldPassword extends FormField<String?> {
  FormFieldPassword({
    super.value,
    super.requiredField = true,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    bool isObscured = true,
    super.customErrorText,
    super.validators,
  }) : _errorOnWrongLength = _validatorWrongLength(value),
       _errorOnContainNonEnglishLetters = _validatorContainNonEnglish(value),
       _errorOnMissingLowercaseLetters = !_validatorHasLowercaseLetters(value),
       _errorOnMissingUppercaseLetters = !_validatorHasUppercaseLetters(value),
       _errorOnMissingDigits = !_validatorContainDigits(value),
       _isObscured = isObscured;

  static final RegExp hasNonEnglishLetters = RegExp(r'[^\x00-\x7F]');
  static final RegExp lowercaseRegex = RegExp('[a-z]');
  static final RegExp uppercaseRegex = RegExp('[A-Z]');
  static final RegExp numbersRegex = RegExp('[0-9]');

  // ---------------------------------------------------------------------------
  // specific properties and getters
  late final bool _isObscured;
  late final bool _errorOnWrongLength;
  late final bool _errorOnContainNonEnglishLetters;
  late final bool _errorOnMissingLowercaseLetters;
  late final bool _errorOnMissingUppercaseLetters;
  late final bool _errorOnMissingDigits;

  bool get isObscured => _isObscured;

  bool get errorOnWrongLength => _errorOnWrongLength;

  bool get errorOnContainNonEnglishLetters => _errorOnContainNonEnglishLetters;

  bool get errorOnMissingLowercaseLetters => _errorOnMissingLowercaseLetters;

  bool get errorOnMissingUppercaseLetters => _errorOnMissingUppercaseLetters;

  bool get errorOnMissingDigits => _errorOnMissingDigits;

  // ---------------------------------------------------------------------------
  // If length is between 8 and 20 characters
  static bool _validatorWrongLength(String? value) =>
      value == null || value.length < 8 || value.length > 20;

  // ---------------------------------------------------------------------------
  // If non-English characters are entered
  static bool _validatorContainNonEnglish(String? value) =>
      hasNonEnglishLetters.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  // At least one lowercase letter
  static bool _validatorHasLowercaseLetters(String? value) => lowercaseRegex.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  // At least one uppercase letter
  static bool _validatorHasUppercaseLetters(String? value) => uppercaseRegex.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  // At least one digit
  static bool _validatorContainDigits(String? value) => numbersRegex.hasMatch(value ?? '');

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => true;

  // ---------------------------------------------------------------------------
  @override
  bool get valid =>
      super.valid &&
      !_errorOnWrongLength &&
      !_errorOnContainNonEnglishLetters &&
      !_errorOnMissingLowercaseLetters &&
      !_errorOnMissingUppercaseLetters &&
      !_errorOnMissingDigits;

  // ---------------------------------------------------------------------------
  // @override
  // bool get valid => super.valid && !_errorOnNumberFormat;

  // ---------------------------------------------------------------------------
  @override
  FormFieldPassword copyWithValue(String? value) => FormFieldPassword(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: customErrorText,
    isObscured: _isObscured,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldPassword copyWithCustomError(String? errorText) => FormFieldPassword(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: errorText,
    isObscured: _isObscured,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldPassword copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
    bool? isObscured,
  }) => FormFieldPassword(
    value: value,
    requiredField: requiredField ?? this.requiredField,
    hideErrorState: hideErrorState ?? this.hideErrorState,
    visible: visible ?? this.visible,
    enabled: enabled ?? this.enabled,
    customErrorText: customErrorText,
    isObscured: isObscured ?? this.isObscured,
    minLength: minLength,
    maxLength: maxLength,
    validators: validators,
  );
}

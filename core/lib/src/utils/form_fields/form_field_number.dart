part of 'form_fields.dart';

/// Number input field
/// Validates the entered number
@immutable
final class FormFieldNumber extends FormField<String> {
  FormFieldNumber({
    String? value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    super.customErrorText,
    bool isDecimal = true,
    bool notNegative = false,
    super.validators,
  }) : _isDecimal = isDecimal,
       _notNegative = notNegative,
       super(value: value) {
    _errorOnNumberFormat = !_specificValidator(value);
    _errorOnNotNegative = !_validateNegativeNumbers(value);
  }

  // ---------------------------------------------------------------------------
  // specific properties and getters
  final bool _isDecimal;
  final bool _notNegative;

  late final bool _errorOnNumberFormat;
  late final bool _errorOnNotNegative;

  bool get isDecimal => _isDecimal;

  bool get notNegative => _notNegative;

  bool get errorOnNumberFormat => _errorOnNumberFormat;

  bool get errorOnNotNegative => _errorOnNotNegative;

  // ---------------------------------------------------------------------------
  @override
  bool get valid => super.valid && !_errorOnNumberFormat && !_errorOnNotNegative;

  // ---------------------------------------------------------------------------
  int? toInt() => double.tryParse(value?.replaceAll(',', '.').trim() ?? '')?.toInt();

  // ---------------------------------------------------------------------------
  double? toDouble() => double.tryParse(value?.replaceAll(',', '.').trim() ?? '');

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => isDecimal
      ? (double.tryParse(value?.replaceAll(',', '.').trim() ?? '') != null)
      : (int.tryParse(value?.trim() ?? '') != null);

  // ---------------------------------------------------------------------------
  bool _validateNegativeNumbers(String? value) {
    final num? number = isDecimal
        ? (double.tryParse(value?.replaceAll(',', '.').trim() ?? ''))
        : (int.tryParse(value?.trim() ?? ''));
    return number == null || !_notNegative || (_notNegative && number >= 0);
  }

  // ---------------------------------------------------------------------------
  @override
  FormFieldNumber copyWithValue(String? value) => FormFieldNumber(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: customErrorText,
    isDecimal: _isDecimal,
    minLength: minLength,
    maxLength: maxLength,
    notNegative: notNegative,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  FormFieldNumber copyWithCustomError(String? errorText) => FormFieldNumber(
    value: value,
    requiredField: requiredField,
    hideErrorState: hideErrorState,
    visible: visible,
    enabled: enabled,
    customErrorText: errorText,
    isDecimal: _isDecimal,
    minLength: minLength,
    maxLength: maxLength,
    notNegative: notNegative,
    validators: validators,
  );

  // ---------------------------------------------------------------------------
  @override
  // ignore: number_of_parameters
  FormFieldNumber copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
    bool? isDecimal,
    bool? notNegative,
  }) => FormFieldNumber(
    value: value,
    requiredField: requiredField ?? this.requiredField,
    hideErrorState: hideErrorState ?? this.hideErrorState,
    visible: visible ?? this.visible,
    enabled: enabled ?? this.enabled,
    isDecimal: isDecimal ?? this.isDecimal,
    customErrorText: customErrorText,
    minLength: minLength,
    maxLength: maxLength,
    notNegative: notNegative ?? this.notNegative,
    validators: validators,
  );
}

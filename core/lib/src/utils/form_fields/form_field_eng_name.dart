part of 'form_fields.dart';

@immutable
final class FormFieldEngName extends FormField<String?> {
  FormFieldEngName({
    super.value,
    super.requiredField,
    super.hideErrorState,
    super.visible,
    super.enabled,
    super.minLength,
    super.maxLength,
    super.customErrorText,
    super.validators,
  }) : _errorOnNameFormat = !_validatorNameFormat(value);

  /// Allowed:
  /// - Latin letters
  /// - spaces
  /// - hyphens
  /// - apostrophes
  ///
  /// Restrictions:
  /// - must not start or end with a special character
  /// - no consecutive special characters
  /// - each word segment must be at least 2 characters long
  static final RegExp _baseRegExp = RegExp(r"^[A-Za-z]+(?:[ '\-][A-Za-z]+)*$");

  // ---------------------------------------------------------------------------
  late final bool _errorOnNameFormat;

  bool get errorOnNameFormat => _errorOnNameFormat;

  static bool _validatorNameFormat(String? value) {
    if (value == null || value.trim().isEmpty) return false;

    final String input = value.trim();

    // 1. Basic structural validation
    if (!_baseRegExp.hasMatch(input)) return false;

    // 2. Disallow repeated special characters
    if (RegExp(r"[ '\-]{2,}").hasMatch(input)) return false;

    // 3. Disallow mixed consecutive special characters (e.g. -' or ' -)
    if (RegExp(r"[ '\-]{1}[ '\-]{1}").hasMatch(input)) return false;

    // 4. Validate segments
    final List<String> parts = input.split(RegExp(r"[ '\-]"));

    // Each segment must have at least 2 characters (avoid cases like "A B")
    if (parts.any((String p) => p.length < 2)) return false;

    // 5. Prevent repeated identical segments (e.g. "Ivan Ivan Ivan")
    final Set<String> uniqueParts = parts.map((String e) => e.toLowerCase()).toSet();
    if (uniqueParts.length == 1 && parts.length > 1) return false;

    // 6. Limit number of segments (basic protection against garbage input)
    if (parts.length > 5) return false;

    return true;
  }

  // ---------------------------------------------------------------------------
  @override
  bool _specificValidator(String? value) => !errorOnNameFormat;

  // ---------------------------------------------------------------------------
  @override
  FormFieldEngName copyWithValue(String? value) => FormFieldEngName(
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
  FormFieldEngName copyWithCustomError(String? errorText) => FormFieldEngName(
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
  FormFieldEngName copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) => FormFieldEngName(
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

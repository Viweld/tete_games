part of 'form_fields.dart';

@immutable
base class FormField<T> {
  FormField({
    // field value
    T? value,
    // is required for completion
    bool requiredField = false,
    // hide error state
    bool hideErrorState = true,
    // Field is available for interaction / active
    bool enabled = true,
    // field is displayed on the form
    bool visible = true,
    // minimum length limit of entered value
    int? minLength,
    // maximum length limit of entered value
    int? maxLength,
    // forced error text specification
    String? customErrorText,
    // custom set of validators
    Iterable<FormFieldValidator<dynamic>>? validators,
  }) : _value = value,
       _requiredField = requiredField,
       _hideErrorState = hideErrorState,
       _minLength = minLength,
       _maxLength = maxLength,
       _visible = visible,
       _enabled = enabled,
       _validators = validators ?? const <FormFieldValidator<dynamic>>[],
       assert((minLength ?? 0) >= 0, 'minLength is not negative value'),
       assert(
         minLength == null || maxLength == null || minLength <= maxLength,
         'minLength is not bigger than maxLength',
       ) {
    _customErrorText = customErrorText;
    _errorOnValidator = !_specificValidator(_value);
    _errorOnEmptyRequiredValue = requiredField && validatorIsEmpty(value);
  }

  // ---------------------------------------------------------------------------
  /// Main field value
  final T? _value;

  // ---------------------------------------------------------------------------
  /// Additional form field settings

  /// Indicates if the field is required.
  /// Does not participate in validation and just serves as additional information
  /// for display on the form.
  /// Default is false
  final bool _requiredField;

  /// If there is a validation error, then with [_hideErrorState] = true you can
  /// hide this error in the interface. Default is true, so as not to
  /// show errors on new forms
  final bool _hideErrorState;

  /// Field indicating whether to display this field on the form.
  /// There are cases when some form fields need to be hidden in some situations.
  /// Default is always visible
  final bool _visible;

  /// Field is available for interaction / active
  final bool _enabled;

  /// minimum length limit of entered value
  final int? _minLength;

  /// maximum length limit of entered value
  final int? _maxLength;

  /// stores error text for this field, which is assigned "from outside", for example
  /// when checking this field on the backend
  late final String? _customErrorText;

  /// error by result of main validator work
  late final bool _errorOnValidator;

  /// error if field is empty but marked as required
  late final bool _errorOnEmptyRequiredValue;

  final Iterable<FormFieldValidator<dynamic>> _validators;

  // ---------------------------------------------------------------------------
  /// getters
  T? get value => _value;

  bool get requiredField => _requiredField;

  bool get hideErrorState => _hideErrorState;

  bool get enabled => _enabled;

  bool get visible => _visible;

  int? get minLength => _minLength;

  int? get maxLength => _maxLength;

  String? get customErrorText => _customErrorText;

  Iterable<FormFieldValidator<dynamic>> get validators => _validators;

  // if custom validators were used, this getter returns those
  // for which the value failed validation
  Iterable<FormFieldValidator<dynamic>> get validatorsWithErrors => _validatorsWithError();

  @mustCallSuper
  bool get valid =>
      !_errorOnValidator &&
      !_errorOnEmptyRequiredValue &&
      (_customErrorText?.isEmpty ?? true) &&
      !_errorOnLengthValidator() &&
      _validatorsWithError().isEmpty;

  bool get invalid => !valid;

  bool get errorOnEmpty => _errorOnEmptyRequiredValue;

  bool get errorOnValidator => _errorOnValidator;

  bool get errorOnLengthValidator => _errorOnLengthValidator();

  // ---------------------------------------------------------------------------
  // returns those validators for which the value failed validation
  Iterable<FormFieldValidator<dynamic>> _validatorsWithError() =>
      _validators.where((FormFieldValidator<dynamic> validator) => !validator.isValid(value));

  // ---------------------------------------------------------------------------
  /// Length validator
  bool _errorOnLengthValidator() {
    // if condition for minimum value length is set
    if (_minLength != null) {
      if (_value == null || _value.toString().length < _minLength) {
        return true;
      }
    }
    if (_maxLength != null) {
      if (_value != null && _value.toString().length > _maxLength) {
        return true;
      }
    }
    return false;
  }

  // ---------------------------------------------------------------------------
  /// Data validator for field value
  bool _specificValidator(T? value) {
    throw UnimplementedError('Method validator is not implemented');
  }

  // ---------------------------------------------------------------------------
  /// Validator for empty field values
  bool validatorIsEmpty(T? value) => value == null || '$value'.isEmpty;

  // ---------------------------------------------------------------------------
  FormField<T> copyWithCustomError(String? errorText) {
    throw UnimplementedError('Method copyWithError is not implemented');
  }

  // ---------------------------------------------------------------------------
  FormField<T> copyWithValue(T? value) {
    throw UnimplementedError('Method copyWithValue is not implemented');
  }

  // ---------------------------------------------------------------------------
  FormField<T> copyWithParameters({
    bool? requiredField,
    bool? hideErrorState,
    bool? visible,
    bool? enabled,
  }) {
    throw UnimplementedError('Method copyWithParameters is not implemented');
  }

  // ---------------------------------------------------------------------------
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormField &&
          runtimeType == other.runtimeType &&
          _requiredField == other._requiredField &&
          _hideErrorState == other._hideErrorState &&
          _visible == other._visible &&
          _value == other._value &&
          _enabled == other._enabled &&
          _customErrorText == other._customErrorText;

  @override
  int get hashCode => value.hashCode;
}

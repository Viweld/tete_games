part of 'validators.dart';

enum NameValidationError {
  empty,
  invalid,
  overflow;

  String getMessage(AppLocalization localization) {
    switch (this) {
      case NameValidationError.empty:
        return localization.name_validator_empty_message;
      case NameValidationError.invalid:
        return localization.name_validator_invalid_message;
      case NameValidationError.overflow:
        return localization.name_validator_overflow_message;
    }
  }
}

abstract class NameValidator {
  static final RegExp _regExp = RegExp(
    r'^[a-zA-Z\u0400-\u04FF_]+(?:[ -][a-zA-Z\u0400-\u04FF_]+)*$',
  );

  static NameValidationError? check(String value) {
    if (value.isEmpty) return NameValidationError.empty;

    if (value.length > 30) return NameValidationError.overflow;

    if (!_regExp.hasMatch(value)) return NameValidationError.invalid;

    return null;
  }
}

part of 'validators.dart';

enum EmailValidationError {
  invalid,
  overflow;

  String getMessage(AppLocalization localization) {
    switch (this) {
      case EmailValidationError.invalid:
        return localization.email_validator_invalid_message;
      case EmailValidationError.overflow:
        return localization.email_validator_overflow_message;
    }
  }
}

abstract class EmailValidator {
  static final RegExp _regExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static EmailValidationError? check(String value) {
    if (value.isEmpty) return null;

    if (!_regExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    } else if (value.length > 50) {
      return EmailValidationError.overflow;
    }

    return null;
  }
}

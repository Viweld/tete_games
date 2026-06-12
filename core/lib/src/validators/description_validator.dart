part of 'validators.dart';

enum DescriptionValidationError {
  overflow;

  String getMessage(AppLocalization localization) {
    switch (this) {
      case DescriptionValidationError.overflow:
        return localization.description_validator_overflow_message;
    }
  }
}

abstract class DescriptionValidator {
  static DescriptionValidationError? check(String value) {
    if (value.isEmpty) return null;

    if (value.length > 300) return DescriptionValidationError.overflow;

    return null;
  }
}

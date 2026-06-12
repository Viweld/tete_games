part of 'form_fields.dart';

/// Custom field validator
abstract class FormFieldValidator<T> {
  bool isValid(T value);
}

part of 'form_fields.dart';

@immutable
class FormButton {
  const FormButton({this.enabled = true, this.visible = true, this.isPending = false});

  // button is active / clickable
  final bool enabled;

  // button is visible
  final bool visible;

  // button displays a loading indicator
  final bool isPending;

  bool get clickable => enabled && visible && !isPending;

  FormButton copyWith({bool? enabled, bool? visible, bool? isPending}) => FormButton(
    enabled: enabled ?? this.enabled,
    visible: visible ?? this.visible,
    isPending: isPending ?? this.isPending,
  );
}

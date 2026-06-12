import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextFormatters {
  static MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: <String, RegExp>{'#': RegExp('[0-9]')},
  );

  static MaskTextInputFormatter maskDateFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: <String, RegExp>{'#': RegExp('[0-9]')},
  );
}

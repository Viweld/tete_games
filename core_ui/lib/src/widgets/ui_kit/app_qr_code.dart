import 'package:core_ui/core_ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AppQrCode extends StatelessWidget {
  final String data;
  final double size;
  final Color? color;
  final int errorCorrectionLevel;

  const AppQrCode({
    required this.data,
    this.size = 200,
    this.color,
    this.errorCorrectionLevel = QrErrorCorrectLevel.M,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return QrImageView(
      data: data,
      size: size,
      padding: EdgeInsets.zero,
      eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square, color: color ?? colors.text.main),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: color ?? colors.text.main,
      ),
      errorCorrectionLevel: errorCorrectionLevel,
    );
  }
}

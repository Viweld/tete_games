import 'package:core_ui/src/widgets/receipts/themes/receipt_colors.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReceiptTextStyles {
  final pw.TextStyle h2;
  final pw.TextStyle h4;
  final pw.TextStyle h5;
  final pw.TextStyle h6;
  final pw.TextStyle b1;
  final pw.TextStyle b2;
  final pw.TextStyle b3;
  final pw.TextStyle b4;

  const ReceiptTextStyles({
    required this.h2,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.b1,
    required this.b2,
    required this.b3,
    required this.b4,
  });

  static Future<ReceiptTextStyles> initialize() async {
    final pw.Font regular = await PdfGoogleFonts.manropeRegular();
    final pw.Font bold = await PdfGoogleFonts.manropeBold();
    final pw.Font extraBold = await PdfGoogleFonts.manropeExtraBold();
    const double s = ReceiptConstants.scale;

    return ReceiptTextStyles(
      h2: pw.TextStyle(
        font: extraBold,
        fontSize: 26 * s,
        color: ReceiptColors.textMain,
        height: 1.2,
      ),
      h4: pw.TextStyle(font: bold, fontSize: 20 * s, color: ReceiptColors.textMain, height: 1.3),
      h5: pw.TextStyle(font: bold, fontSize: 18 * s, color: ReceiptColors.textMain, height: 1.3),
      h6: pw.TextStyle(font: bold, fontSize: 16 * s, color: ReceiptColors.textMain, height: 1.3),
      b1: pw.TextStyle(font: regular, fontSize: 15 * s, color: ReceiptColors.textMain, height: 1.5),
      b2: pw.TextStyle(font: regular, fontSize: 14 * s, height: 1.4, color: ReceiptColors.textMain),
      b3: pw.TextStyle(font: bold, fontSize: 15 * s, color: ReceiptColors.textMain, height: 1.5),
      b4: pw.TextStyle(font: bold, fontSize: 14 * s, color: ReceiptColors.textMain, height: 1.4),
    );
  }
}

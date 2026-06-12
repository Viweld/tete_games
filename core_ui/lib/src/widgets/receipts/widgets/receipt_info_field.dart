import 'package:core_ui/src/widgets/receipts/themes/receipt_colors.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptInfoField extends pw.StatelessWidget {
  final String label;
  final String value;
  final ReceiptTextStyles styles;

  ReceiptInfoField({required this.label, required this.value, required this.styles});

  @override
  pw.Widget build(pw.Context context) {
    const double s = ReceiptConstants.scale;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: <pw.Widget>[
        pw.Text(label, style: styles.h6),
        pw.SizedBox(height: 12 * s),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(horizontal: 12 * s, vertical: 8 * s),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: ReceiptColors.borderMain, width: 1 * s),
            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6 * s)),
            color: PdfColors.white,
          ),
          child: pw.Text(value, style: styles.b1),
        ),
      ],
    );
  }
}

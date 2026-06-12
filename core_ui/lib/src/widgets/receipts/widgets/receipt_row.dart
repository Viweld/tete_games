import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptRow extends pw.StatelessWidget {
  final String label;
  final String value;
  final ReceiptTextStyles styles;

  ReceiptRow({required this.label, required this.value, required this.styles});

  @override
  pw.Widget build(pw.Context context) {
    const double s = ReceiptConstants.scale;
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8 * s),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <pw.Widget>[
          pw.Text(label, style: styles.b2.copyWith(color: PdfColors.grey700)),
          pw.Text(value, style: styles.b4),
        ],
      ),
    );
  }
}

import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptKeyValueRow extends pw.StatelessWidget {
  final String label;
  final String value;
  final ReceiptTextStyles styles;

  ReceiptKeyValueRow({required this.label, required this.value, required this.styles});

  @override
  pw.Widget build(pw.Context context) {
    const double s = ReceiptConstants.scale;
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10 * s),
      child: pw.Row(
        children: <pw.Widget>[
          pw.SizedBox(
            width: 63 * s,
            child: pw.Text(label, style: styles.b4),
          ),
          pw.SizedBox(width: 10 * s),
          pw.Text(value, style: styles.b2),
        ],
      ),
    );
  }
}

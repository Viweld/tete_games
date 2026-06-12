import 'package:core_ui/src/widgets/receipts/themes/receipt_colors.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptSectionCard extends pw.StatelessWidget {
  final String title;
  final ReceiptTextStyles styles;
  final pw.Widget? child;

  ReceiptSectionCard({required this.title, required this.styles, this.child});

  @override
  pw.Widget build(pw.Context context) {
    const double s = ReceiptConstants.scale;
    return pw.Container(
      padding: const pw.EdgeInsets.all(20 * s),
      width: double.maxFinite,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: ReceiptColors.borderMain, width: 2 * s),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6 * s)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: <pw.Widget>[
          pw.Text(title, style: styles.h4),
          pw.SizedBox(height: 24 * s),
          child ?? pw.SizedBox(),
        ],
      ),
    );
  }
}

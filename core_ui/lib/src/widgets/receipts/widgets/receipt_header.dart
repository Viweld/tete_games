import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptHeader extends pw.StatelessWidget {
  final String title;
  final String idLine;
  final ReceiptTextStyles styles;

  ReceiptHeader({required this.title, required this.idLine, required this.styles});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Header(
      level: 0,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <pw.Widget>[
          pw.Text(title.toUpperCase(), style: styles.h5.copyWith(color: PdfColors.blue900)),
          pw.Text(idLine, style: styles.b2.copyWith(color: PdfColors.grey700)),
        ],
      ),
    );
  }
}

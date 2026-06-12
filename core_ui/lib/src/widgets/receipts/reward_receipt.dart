import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_colors.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:core_ui/src/widgets/receipts/widgets/receipt_section_card.dart';
import 'package:domain/domain.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class RewardReceipt {
  final TransactionDetails transaction;
  final UserProfile profile;
  final ReceiptTextStyles styles;
  final String logoSvg;

  RewardReceipt._({
    required this.transaction,
    required this.profile,
    required this.styles,
    required this.logoSvg,
  });

  static Future<Uint8List> generate(
    BuildContext extContext,
    TransactionDetails transaction,
    UserProfile profile,
  ) async {
    final pw.Document pdf = pw.Document();
    final ReceiptTextStyles styles = await ReceiptTextStyles.initialize();
    final String logoSvg = await rootBundle.loadString(
      'packages/core_ui/resources/icons/receipt_logo.svg',
    );

    final RewardReceipt widget = RewardReceipt._(
      transaction: transaction,
      profile: profile,
      styles: styles,
      logoSvg: logoSvg,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context pwContext) => widget.build(pwContext, extContext),
      ),
    );

    return pdf.save();
  }

  pw.Widget build(pw.Context pwContext, BuildContext extContext) {
    const double s = ReceiptConstants.scale;
    final AppLocalization localization = extContext.localization;
    final String localeName = localization.localeName;
    final OrderDraft? order = transaction.order;
    final String receiptDate = DateFormat('d MMMM yyyy', localeName).format(transaction.createdAt);
    final int? bonusAmount = transaction.paymentReceipt?.amount != null
        ? transaction.paymentReceipt!.amount.round()
        : null;
    final int? balancePoints = transaction.bonusReceipt?.currentUserBonusBalance.round();
    final String cashbackPercent =
        (profile.loyaltyInfo?.currentLevel?.cashbackPercent)?.toString() ?? '';

    return pw.Padding(
      padding: const pw.EdgeInsets.all(70 * s),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          // Header
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(localization.receipt_pdf_bonus_title, style: styles.h2),
                  pw.SizedBox(height: 8 * s),
                  pw.Text(
                    localization.receipt_pdf_date_external(
                      receiptDate,
                      transaction.externalId ?? '',
                    ),
                    style: styles.b2,
                  ),
                  pw.SizedBox(height: 8 * s),
                  pw.Text(
                    localization.receipt_pdf_order_number(transaction.orderRef ?? ''),
                    style: styles.b2,
                  ),
                ],
              ),
              pw.SizedBox(
                width: 220 * s,
                height: 35 * s,
                child: pw.SvgImage(svg: logoSvg),
              ),
            ],
          ),
          pw.SizedBox(height: 70 * s),

          // Main content in two columns
          pw.Expanded(
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                // Left Column
                if (order != null)
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        ReceiptSectionCard(
                          title: localization.receipt_bonus_breakdown_title,
                          styles: styles,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisSize: pw.MainAxisSize.min,
                            children: <pw.Widget>[
                              pw.Text(
                                localization.receipt_bonus_paid_service_label,
                                style: styles.h5,
                              ),
                              pw.SizedBox(height: 24 * s),
                              pw.Text(
                                ' • ${_formattedMoneyText(transaction.order?.summary?.totalAmount ?? 0, transaction.order?.summary?.currency ?? 'USD')}',
                                style: styles.b1,
                              ),
                              pw.Divider(
                                height: 48 * s,
                                color: ReceiptColors.borderMain,
                                thickness: 2 * s,
                              ),
                              pw.Text(
                                localization.receipt_bonus_user_level_label,
                                style: styles.h5,
                              ),
                              pw.SizedBox(height: 24 * s),
                              pw.Text(
                                ' • ${profile.loyaltyInfo?.currentLevel?.name}',
                                style: styles.b1,
                              ),
                              pw.Divider(
                                height: 48 * s,
                                color: ReceiptColors.borderMain,
                                thickness: 2 * s,
                              ),
                              pw.Text(
                                localization.receipt_bonus_coefficient_label,
                                style: styles.h5,
                              ),
                              pw.SizedBox(height: 24 * s),
                              pw.Text(
                                ' • ${localization.receipt_bonus_percent_of_order(cashbackPercent)}',
                                style: styles.b1,
                              ),
                              pw.Divider(
                                height: 48 * s,
                                color: ReceiptColors.borderMain,
                                thickness: 2 * s,
                              ),
                              pw.Text(localization.receipt_bonus_accrued_label, style: styles.h5),
                              pw.SizedBox(height: 24 * s),
                              pw.Text(
                                bonusAmount != null
                                    ? ' • ${localization.receipt_bonus_points_short(bonusAmount)}'
                                    : ' • ',
                                style: styles.b1,
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 40 * s),
                        ReceiptSectionCard(
                          title: localization.receipt_bonus_section_status,
                          styles: styles,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisSize: pw.MainAxisSize.min,
                            children: <pw.Widget>[
                              pw.Text(
                                localization.receipt_bonus_points_status_label,
                                style: styles.h5,
                              ),
                              pw.SizedBox(height: 24 * s),
                              pw.Text(
                                ' • ${transaction.paymentReceipt?.description}',
                                style: styles.b1,
                              ),
                              pw.Divider(
                                height: 48 * s,
                                color: ReceiptColors.borderMain,
                                thickness: 2 * s,
                              ),
                              if (transaction.paymentReceipt?.issuedAt != null) ...<pw.Widget>[
                                pw.Text(
                                  localization.receipt_bonus_accrual_date_label,
                                  style: styles.h5,
                                ),
                                pw.SizedBox(height: 24 * s),
                                pw.Text(
                                  ' • ${DateFormat('d MMMM yyyy', localeName).format(transaction.paymentReceipt!.issuedAt)}',
                                  style: styles.b1,
                                ),
                                pw.Divider(
                                  height: 48 * s,
                                  color: ReceiptColors.borderMain,
                                  thickness: 2 * s,
                                ),
                              ],
                              if (transaction.paymentReceipt?.issuedAt != null) ...<pw.Widget>[
                                pw.Text(localization.receipt_bonus_expiry_title, style: styles.h5),
                                pw.SizedBox(height: 24 * s),
                                pw.Text(
                                  ' • ${localization.receipt_bonus_valid_until(DateFormat('d MMMM yyyy', localeName).format(transaction.paymentReceipt!.issuedAt.add(const Duration(days: 365))))}',
                                  style: styles.b1,
                                ),
                                pw.SizedBox(height: 24 * s),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 20 * s,
                                    vertical: 14 * s,
                                  ),
                                  child: pw.Text(
                                    localization.receipt_bonus_twelve_months_note,
                                    style: styles.b3,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                pw.SizedBox(width: 70 * s),
                // Right Column
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      ReceiptSectionCard(
                        title: localization.receipt_bonus_balance_title,
                        styles: styles,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisSize: pw.MainAxisSize.min,
                          children: <pw.Widget>[
                            pw.Text(localization.receipt_bonus_balance_current, style: styles.h5),
                            pw.SizedBox(height: 24 * s),
                            pw.Text(
                              balancePoints != null
                                  ? ' • ${localization.receipt_bonus_points_short(balancePoints)}'
                                  : ' • ',
                              style: styles.b1,
                            ),
                            pw.Divider(
                              height: 48 * s,
                              color: ReceiptColors.borderMain,
                              thickness: 2 * s,
                            ),
                            pw.Text(localization.receipt_bonus_balance_spendable, style: styles.h5),
                            pw.SizedBox(height: 24 * s),
                            pw.Text(
                              balancePoints != null
                                  ? ' • ${localization.receipt_bonus_points_short(balancePoints)}'
                                  : ' • ',
                              style: styles.b1,
                            ),
                            pw.Divider(
                              height: 48 * s,
                              color: ReceiptColors.borderMain,
                              thickness: 2 * s,
                            ),
                            pw.Text(localization.receipt_bonus_program_line_1, style: styles.b1),
                            pw.Text(localization.receipt_bonus_program_line_2, style: styles.b1),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 40 * s),
                      ReceiptSectionCard(
                        title: localization.order_details_cancellation_rules_title,
                        styles: styles,
                        child: pw.Text(localization.receipt_bonus_rules_body, style: styles.b2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Footer
          pw.SizedBox(height: 40 * s),
          pw.Text(localization.receipt_pdf_company_footer, style: styles.b2),
        ],
      ),
    );
  }

  String _formattedMoneyText(num amount, String currencyCode) =>
      MoneyTextFormatter.format(amount: amount, currencyCode: currencyCode);
}

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_colors.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_constants.dart';
import 'package:core_ui/src/widgets/receipts/themes/receipt_text_styles.dart';
import 'package:core_ui/src/widgets/receipts/widgets/receipt_info_field.dart';
import 'package:core_ui/src/widgets/receipts/widgets/receipt_key_value_row.dart';
import 'package:core_ui/src/widgets/receipts/widgets/receipt_section_card.dart';
import 'package:domain/domain.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TransactionReceipt {
  final TransactionDetails transaction;
  final ReceiptTextStyles styles;
  final String logoSvg;

  TransactionReceipt._({required this.transaction, required this.styles, required this.logoSvg});

  static Future<Uint8List> generate(BuildContext extContext, TransactionDetails transaction) async {
    final pw.Document pdf = pw.Document();
    final ReceiptTextStyles styles = await ReceiptTextStyles.initialize();
    final String logoSvg = await rootBundle.loadString(
      'packages/core_ui/resources/icons/receipt_logo.svg',
    );

    final TransactionReceipt widget = TransactionReceipt._(
      transaction: transaction,
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
                  pw.Text(localization.receipt_pdf_transaction_title, style: styles.h2),
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
                          title: localization.order_details_price_details,
                          styles: styles,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisSize: pw.MainAxisSize.min,
                            children: <pw.Widget>[
                              pw.ListView.separated(
                                itemCount: order.generatedSummary.endpoints.length,
                                separatorBuilder: (_, _) => pw.Divider(
                                  height: 48 * s,
                                  color: ReceiptColors.borderMain,
                                  thickness: 2 * s,
                                ),
                                itemBuilder: (_, int i) {
                                  final EndpointSummary item = order.generatedSummary.endpoints[i];
                                  final List<SummaryItem> services = item.servicesBreakdown;
                                  final SummaryItem? transfer = services.firstWhereOrNull(
                                    (SummaryItem s) => s.transferId != null,
                                  );

                                  return pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                                    children: <pw.Widget>[
                                      pw.Text(
                                        _endpointTitle(item.type, localization),
                                        style: styles.h5,
                                      ),
                                      pw.SizedBox(height: 24 * s),
                                      pw.Text(
                                        '${item.airportName}(${item.airportIataCode}), '
                                        '${item.terminalName}, ${item.city}, ${item.country}',
                                        style: styles.h6,
                                      ),

                                      // SERVICES:
                                      if (services.isNotEmpty)
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.only(top: 24 * s),
                                          child: pw.Column(
                                            children: services
                                                .map(
                                                  (SummaryItem s) => pw.Row(
                                                    children: <pw.Widget>[
                                                      pw.Text(' • ', style: styles.b1),
                                                      pw.Expanded(
                                                        child: pw.Text(
                                                          '${s.name}: '
                                                          '${_formattedMoneyText(s.total, s.currency)}',
                                                          style: styles.b1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),

                                      // TRANSFER:
                                      if (transfer != null)
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.only(top: 24 * s),
                                          child: ReceiptSectionCard(
                                            title: localization.receipt_transfer_data_title,
                                            styles: styles,
                                            child: pw.Column(
                                              mainAxisSize: pw.MainAxisSize.min,
                                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                                              children: <pw.Widget>[
                                                ReceiptInfoField(
                                                  label:
                                                      localization.transfer_departure_address_label,
                                                  value: transfer.pickupAddress ?? '',
                                                  styles: styles,
                                                ),
                                                if (transfer.stopsList.isNotEmpty)
                                                  ...transfer.stopsList.map(
                                                    (OrderTransferStop sl) => pw.Padding(
                                                      padding: const pw.EdgeInsets.only(
                                                        top: 20 * s,
                                                      ),
                                                      child: ReceiptInfoField(
                                                        label: localization
                                                            .receipt_transfer_stop_point,
                                                        value: sl.address ?? '',
                                                        styles: styles,
                                                      ),
                                                    ),
                                                  ),
                                                pw.SizedBox(height: 20 * s),
                                                ReceiptInfoField(
                                                  label:
                                                      localization.transfer_arrival_address_label,
                                                  value: transfer.dropoffAddress ?? '',
                                                  styles: styles,
                                                ),
                                                pw.SizedBox(height: 24 * s),
                                                ReceiptInfoField(
                                                  label: localization.transfer_car_category_label,
                                                  value: transfer.name,
                                                  styles: styles,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),

                              pw.Divider(
                                height: 48 * s,
                                color: ReceiptColors.borderMain,
                                thickness: 2 * s,
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                  horizontal: 20 * s,
                                  vertical: 14 * s,
                                ),
                                child: pw.Text(
                                  localization.receipt_total_label(
                                    _formattedMoneyText(
                                      order.generatedSummary.totalAmount,
                                      order.generatedSummary.currency,
                                    ),
                                  ),
                                  style: styles.b3,
                                ),
                              ),
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
                      if ((order?.flights ?? <OrderFlight>[]).isNotEmpty)
                        ReceiptSectionCard(
                          title: localization.order_details_flight_info,
                          styles: styles,
                          child: pw.Column(
                            children: List<pw.Widget>.generate(order!.flights.length, (int i) {
                              final OrderFlight flight = order.flights[i];
                              final DateTime flightDateTime =
                                  flight.departureTime ?? DateTime.now();
                              final String formattedFlightDateTime = DateFormat(
                                'd MMMM, HH:mm',
                                localeName,
                              ).format(flightDateTime);

                              return pw.Text(
                                localization.receipt_flight_entry(
                                  i + 1,
                                  flight.flightNumber ?? '',
                                  formattedFlightDateTime,
                                ),
                                style: styles.h6,
                              );
                            }),
                          ),
                        ),
                      pw.SizedBox(height: 40 * s),
                      if ((order?.conditions ?? <OrderCondition>[]).isNotEmpty) ...<pw.Widget>[
                        ReceiptSectionCard(
                          title: localization.order_details_additional_conditions,
                          styles: styles,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: List<pw.Widget>.generate(
                              order!.conditions.length,
                              (int i) =>
                                  pw.Text(' • ${order.conditions[i].value}', style: styles.b2),
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 40 * s),
                      ],
                      ReceiptSectionCard(
                        title: localization.order_details_travelers_title,
                        styles: styles,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: <pw.Widget>[
                            ...List<pw.Widget>.generate(order!.passengers.length, (int i) {
                              final OrderPassenger passenger = order.passengers[i];
                              return pw.Text(
                                ' • ${passenger.fullName}, ${passenger.dateOfBirth}',
                                style: styles.b2,
                              );
                            }),

                            if (order.accompanyingPersons.isNotEmpty)
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 24 * s),
                                child: pw.Column(
                                  children: <pw.Widget>[
                                    pw.Text(
                                      localization.order_details_companions_title,
                                      style: styles.h5,
                                    ),
                                    pw.SizedBox(height: 12 * s),
                                    ...List<pw.Widget>.generate(
                                      order.accompanyingPersons.length,
                                      (int i) => pw.Text(
                                        ' • ${order.accompanyingPersons[i].fullName}',
                                        style: styles.b2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 40 * s),
                      ReceiptSectionCard(
                        title: localization.receipt_payment_method,
                        styles: styles,
                        child: pw.Row(
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                ReceiptKeyValueRow(
                                  label: localization.receipt_label_status_colon,
                                  value: _paymentStatusText(transaction.status, localization),
                                  styles: styles,
                                ),
                                ReceiptKeyValueRow(
                                  label: localization.receipt_label_date_colon,
                                  value: DateFormat(
                                    'dd.MM.yyyy',
                                    localeName,
                                  ).format(transaction.createdAt),
                                  styles: styles,
                                ),
                                ReceiptKeyValueRow(
                                  label: localization.receipt_label_currency_colon,
                                  value: transaction.currency,
                                  styles: styles,
                                ),
                                if ((transaction.bonusReceipt?.orderCashbackToEarn ?? 0) > 0)
                                  ReceiptKeyValueRow(
                                    label: localization.receipt_label_points_colon,
                                    value: localization.receipt_points_accrued_line(
                                      '${transaction.bonusReceipt?.orderCashbackToEarn}',
                                      localization.transaction_card_parameter_accrued_bonuses,
                                    ),
                                    styles: styles,
                                  ),
                              ],
                            ),
                            // TODO: Add card details when available in transaction data
                            // pw.Spacer(),
                            // pw.Container(
                            //   padding: const pw.EdgeInsets.all(20 * s),
                            //   decoration: const pw.BoxDecoration(
                            //     color: ReceiptColors.backgroundMain,
                            //     borderRadius: pw.BorderRadius.all(pw.Radius.circular(6 * s)),
                            //   ),
                            //   child: pw.Column(
                            //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                            //     children: <pw.Widget>[
                            //       pw.Row(
                            //         children: <pw.Widget>[
                            //           pw.Text(
                            //             'VISA',
                            //             style: styles.b3.copyWith(color: ReceiptColors.accent),
                            //           ),
                            //           pw.SizedBox(width: 10 * s),
                            //           pw.Text(
                            //             '**** **** **** 7502',
                            //             style: styles.h5.copyWith(
                            //               color: ReceiptColors.cardTextMain,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       pw.SizedBox(height: 24 * s),
                            //       pw.Row(
                            //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            //         children: <pw.Widget>[
                            //           pw.Text(
                            //             'Alena Son',
                            //             style: styles.b1.copyWith(
                            //               color: ReceiptColors.textSecondary,
                            //             ),
                            //           ),
                            //           pw.SizedBox(width: 20 * s),
                            //           pw.Text(
                            //             '01/29',
                            //             style: styles.b1.copyWith(
                            //               color: ReceiptColors.textSecondary,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 40 * s),
                      ReceiptSectionCard(
                        title: localization.order_details_cancellation_rules_title,
                        styles: styles,
                        child: pw.Text(
                          ' • ${localization.order_details_cancellation_rule_1}\n'
                          ' • ${localization.order_details_cancellation_rule_2}\n'
                          ' • ${localization.order_details_cancellation_rule_3}',
                          style: styles.b2,
                        ),
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

  String _endpointTitle(EndpointType type, AppLocalization localization) => switch (type) {
    EndpointType.departure => localization.order_details_endpoint_departure,
    EndpointType.transit => localization.order_details_endpoint_transit,
    EndpointType.transitArrival => localization.order_details_endpoint_transit_arrival,
    EndpointType.transitDeparture => localization.order_details_endpoint_transit_departure,
    EndpointType.arrival => localization.order_details_endpoint_arrival,
  };

  String _formattedMoneyText(num amount, String currencyCode) =>
      MoneyTextFormatter.format(amount: amount, currencyCode: currencyCode);

  String _paymentStatusText(TransactionStatus status, AppLocalization localization) =>
      switch (status) {
        TransactionStatus.pending => localization.receipt_payment_status_awaiting,
        TransactionStatus.success => localization.receipt_payment_status_paid,
        TransactionStatus.failed => localization.receipt_payment_status_declined,
        TransactionStatus.unknown => localization.receipt_payment_status_unknown_long,
      };
}

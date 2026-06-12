import 'package:core_ui/core_ui.dart';

final class AppOrderStatusLabelTheme {
  final Color draft;

  final Color waitingPayment;
  final Color paymentError;
  final Color cancelRequested;

  final Color waitingProcessing;
  final Color processing;
  final Color waitingPartner;
  final Color partnerConfirmed;
  final Color inProgress;

  final Color preFlight;
  final Color inFlight;
  final Color postFlight;

  final Color paid;
  final Color completed;

  final Color partnerRejected;
  final Color cancelled;
  final Color refundError;

  final Color refundProcessing;
  final Color refunded;

  final Color fallback;

  const AppOrderStatusLabelTheme({
    required this.draft,
    required this.waitingPayment,
    required this.paymentError,
    required this.cancelRequested,
    required this.waitingProcessing,
    required this.processing,
    required this.waitingPartner,
    required this.partnerConfirmed,
    required this.inProgress,
    required this.preFlight,
    required this.inFlight,
    required this.postFlight,
    required this.paid,
    required this.completed,
    required this.partnerRejected,
    required this.cancelled,
    required this.refundError,
    required this.refundProcessing,
    required this.refunded,
    required this.fallback,
  });
}

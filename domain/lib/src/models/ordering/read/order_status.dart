part of 'ordering_read_models.dart';

enum OrderStatus {
  /// --- Draft ---
  draft, // Order created but not completed

  /// --- Requires user action (orange) ---
  waiting_payment, // Waiting for payment
  payment_error, // Payment failed
  cancel_requested, // Cancellation requested

  /// --- Processing (blue) ---
  waiting_processing, // Waiting to start processing
  processing, // Being processed by system
  waiting_partner, // Waiting for partner confirmation
  partner_confirmed, // Confirmed by partner
  in_progress, // In progress

  /// --- Flight stage (blue) ---
  pending_pre_flight, // Waiting before flight
  in_flight, // Service during flight
  pending_post_flight, // Waiting after flight

  /// --- Success (green) ---
  paid, // Paid
  completed, // Completed

  /// --- Errors / cancellations (red) ---
  partner_rejected, // Rejected by partner
  cancelled, // Cancelled
  refund_error, // Refund failed

  /// --- Refund (yellow) ---
  refund_processing, // Refund in progress
  refunded, // Refunded

  /// --- Unknown ---
  unknown; // Unknown status

  static OrderStatus fromString(String? value) {
    return OrderStatus.values.firstWhere(
      (OrderStatus e) => e.name == value,
      orElse: () => OrderStatus.unknown,
    );
  }

  bool get isCancelled =>
      this == OrderStatus.cancelled ||
      this == OrderStatus.cancel_requested ||
      this == OrderStatus.refund_processing ||
      this == OrderStatus.refunded ||
      this == OrderStatus.refund_error;

  bool get isActive =>
      this == OrderStatus.processing ||
      this == OrderStatus.waiting_processing ||
      this == OrderStatus.waiting_partner ||
      this == OrderStatus.partner_confirmed ||
      this == OrderStatus.in_progress;

  bool get isFinished =>
      this == OrderStatus.completed ||
      this == OrderStatus.cancelled ||
      this == OrderStatus.refunded;
}

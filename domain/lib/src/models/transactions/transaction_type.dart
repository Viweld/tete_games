import 'package:meta/meta.dart';

@immutable
enum TransactionType { payment, refund, deposit, adjustment, unknown }

import 'package:data/src/dtos/dtos.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';

part 'update_order_request_mapper.dart';
part 'update_order_transfer_mapper.dart';
part 'update_order_condition_mapper.dart';
part 'update_flight_mapper.dart';
part 'update_order_passenger_mapper.dart';
part 'update_order_accompanying_person_mapper.dart';
part 'update_order_endpoint_services_mapper.dart';
part 'private_jet_booking_request_mapper.dart';

int? effectiveTerminalIdForApi(int? terminalId) {
  if (terminalId == null || terminalId < 0) {
    return null;
  }
  return terminalId;
}

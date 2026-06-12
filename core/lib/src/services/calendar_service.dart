import 'package:add_2_calendar/add_2_calendar.dart' as add_2_calendar;
import 'package:domain/domain.dart';

abstract class CalendarService {
  static Future<void> addOrderFlightEvent(
    OrderFlight flight, {
    required String title,
    required String description,
  }) async {
    final DateTime? startTime = flight.departureTime;
    if (startTime == null) return;

    final add_2_calendar.Event event = add_2_calendar.Event(
      title: title,
      description: description,
      location: '${flight.departureAirportName ?? ''}, ${flight.departureCity ?? ''}',
      startDate: startTime,
      endDate: flight.arrivalTime ?? startTime.add(const Duration(hours: 2)),
    );

    await add_2_calendar.Add2Calendar.addEvent2Cal(event);
  }
}

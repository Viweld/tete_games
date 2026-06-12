import 'package:domain/src/models/ordering/read/ordering_read_models.dart';
import 'package:domain/src/models/ordering/write/ordering_write_models.dart';

/// Maps [OrderDraft] (read model) to [UpdateOrderRequest] (write model).
///
/// Produces a fully populated [UpdateOrderRequest] from the current draft state,
/// preserving all existing data. Callers can override specific fields as needed.
extension OrderDraftToUpdateRequest on OrderDraft {
  UpdateOrderRequest toUpdateRequest() {
    return UpdateOrderRequest(
      contactName: contactName,
      contactDateOfBirth: contactDateOfBirth != null
          ? DateTime.tryParse(contactDateOfBirth!)
          : null,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      comment: comment,
      hasReducedMobility: hasReducedMobility,
      adultsCount: adultsCount,
      childrenCount: childrenCount,
      infantsCount: infantsCount,
      serviceIds: serviceIds.isNotEmpty ? serviceIds : null,
      transfersData: transfers.isNotEmpty
          ? transfers.map((OrderTransfer t) => t.toUpdateTransfer()).toList()
          : null,
      conditionsData: conditions.isNotEmpty
          ? conditions.map((OrderCondition c) => c.toUpdateCondition()).toList()
          : null,
      flights: flights.isNotEmpty
          ? flights.map((OrderFlight f) => f.toUpdateFlight()).toList()
          : null,
      passengers: passengers.isNotEmpty
          ? passengers.map((OrderPassenger p) => p.toUpdatePassenger()).toList()
          : null,
      accompanyingPersons: accompanyingPersons.isNotEmpty
          ? accompanyingPersons
                .map((OrderAccompanyingPerson a) => a.toUpdateAccompanyingPerson())
                .toList()
          : null,
    );
  }
}

/// Maps [OrderTransfer] (read model) to [UpdateOrderTransfer] (write model).
extension OrderTransferToUpdate on OrderTransfer {
  UpdateOrderTransfer toUpdateTransfer() {
    return UpdateOrderTransfer(
      serviceId: serviceId,
      flightNumber: flightNumber,
      date: date != null ? DateTime.tryParse(date!) : null,
      time: time,
      pickupAddress: pickupAddress,
      dropoffAddress: dropoffAddress,
      stops: stopsList.isNotEmpty
          ? stopsList.map((OrderTransferStop s) => s.address ?? '').toList()
          : null,
    );
  }
}

/// Maps [OrderCondition] (read model) to [UpdateOrderCondition] (write model).
extension OrderConditionToUpdate on OrderCondition {
  UpdateOrderCondition toUpdateCondition() {
    return UpdateOrderCondition(id: id, text: title);
  }
}

/// Maps [OrderFlight] (read model) to [UpdateFlight] (write model).
extension OrderFlightToUpdate on OrderFlight {
  UpdateFlight toUpdateFlight() {
    return UpdateFlight(
      flightNumber: flightNumber,
      flightDate: flightDate != null ? DateTime.tryParse(flightDate!) : null,
      departureAirportCode: departureAirportCode,
      arrivalAirportCode: arrivalAirportCode,
      departureTerminalId: departureTerminalId,
      departureTerminalName: departureTerminalName,
      arrivalTerminalId: arrivalTerminalId,
      arrivalTerminalName: arrivalTerminalName,
      airlineName: airlineName,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
    );
  }
}

/// Maps [OrderPassenger] (read model) to [UpdateOrderPassenger] (write model).
extension OrderPassengerToUpdate on OrderPassenger {
  UpdateOrderPassenger toUpdatePassenger() {
    return UpdateOrderPassenger(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth != null ? DateTime.tryParse(dateOfBirth!) : null,
      gender: gender,
      citizenshipIso: citizenshipIso,
    );
  }
}

/// Maps [OrderEndpointServices] (read model) to [UpdateOrderEndpointServices] (write model).
extension OrderEndpointServicesToUpdate on OrderEndpointServices {
  UpdateOrderEndpointServices toUpdateOrderEndpointServices() {
    return UpdateOrderEndpointServices(
      iataCode: iataCode,
      terminalId: terminalId,
      terminalName: terminalName,
      endpointType: endpointType,
      serviceIds: serviceIds,
    );
  }
}

/// Maps [OrderAccompanyingPerson] (read) to [UpdateOrderAccompanyingPerson] (write).
extension OrderAccompanyingPersonToUpdate on OrderAccompanyingPerson {
  UpdateOrderAccompanyingPerson toUpdateAccompanyingPerson() {
    return UpdateOrderAccompanyingPerson(firstName: firstName, lastName: lastName);
  }
}

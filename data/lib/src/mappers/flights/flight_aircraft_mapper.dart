import 'package:data/src/dtos/flights/flights_dtos.dart';
import 'package:domain/domain.dart';

extension FlightAircraftMapper on FlightAircraftDto {
  FlightAircraft get toModel {
    return FlightAircraft(model: model, registration: registration);
  }
}

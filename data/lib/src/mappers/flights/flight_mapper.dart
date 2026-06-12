import 'package:data/src/dtos/flights/flights_dtos.dart';
import 'package:data/src/mappers/flights/flight_aircraft_mapper.dart';
import 'package:data/src/mappers/flights/flight_endpoint_mapper.dart';
import 'package:domain/domain.dart';

extension FlightMapper on FlightDto {
  Flight get toModel {
    return Flight(
      flightNumber: flightNumber,
      airlineIata: airlineIata,
      airlineName: airlineName,
      status: status,
      durationMinutes: durationMinutes,
      aircraft: aircraft?.toModel,
      departure: departure?.toModel,
      arrival: arrival?.toModel,
    );
  }
}

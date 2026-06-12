import 'package:data/src/dtos/airports/airports_dtos.dart';
import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:data/src/dtos/flights/flights_dtos.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:domain/domain.dart';

extension FlightEndpointMapper on FlightEndpointDto {
  FlightEndpoint get toModel {
    return FlightEndpoint(
      iataCode: iataCode,
      airportName: airportName,
      city: city,
      country: country,
      description: description,
      photos: photos?.map((PhotoDto e) => e.toModel).whereType<Photo>().toList() ?? <Photo>[],
      serviceGroups:
          serviceGroups?.map((ServiceGroupDto e) => e.toModel).toList() ?? <ServiceGroup>[],
      importantInfo: importantInfo,
      status: status,
      airportCode: airportCode,
      terminal: terminal,
      gate: gate,
      scheduledTime: scheduledTime,
      estimatedTime: estimatedTime,
      timezone: timezone,
      terminals:
          terminals?.map((TerminalDto e) => e.toModel).whereType<Terminal>().toList() ??
          <Terminal>[],
    );
  }
}

part of 'ordering_write_models.dart';

@immutable
class UpdateOrderTransfer {
  final int? serviceId;
  final String? flightNumber;
  final DateTime? date;
  final String? time;
  final String? pickupAddress;
  final String? dropoffAddress;
  final List<String>? stops;

  const UpdateOrderTransfer({
    this.serviceId,
    this.flightNumber,
    this.date,
    this.time,
    this.pickupAddress,
    this.dropoffAddress,
    this.stops,
  });

  bool get isValid {
    final bool isServiceIdValid = serviceId != null;
    final bool isPickupAddressValid = pickupAddress != null && pickupAddress!.isNotEmpty;
    final bool isDropoffAddressValid = dropoffAddress != null && dropoffAddress!.isNotEmpty;

    return isServiceIdValid && isPickupAddressValid && isDropoffAddressValid;
  }

  // ignore: number_of_parameters
  UpdateOrderTransfer copyWith({
    Object? serviceId = const Object(),
    Object? flightNumber = const Object(),
    Object? date = const Object(),
    Object? time = const Object(),
    Object? pickupAddress = const Object(),
    Object? dropoffAddress = const Object(),
    Object? stops = const Object(),
  }) {
    return UpdateOrderTransfer(
      serviceId: serviceId == const Object() ? this.serviceId : serviceId as int?,
      flightNumber: flightNumber == const Object() ? this.flightNumber : flightNumber as String?,
      date: date == const Object() ? this.date : date as DateTime?,
      time: time == const Object() ? this.time : time as String?,
      pickupAddress: pickupAddress == const Object()
          ? this.pickupAddress
          : pickupAddress as String?,
      dropoffAddress: dropoffAddress == const Object()
          ? this.dropoffAddress
          : dropoffAddress as String?,
      stops: stops == const Object() ? this.stops : stops as List<String>?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOrderTransfer &&
          runtimeType == other.runtimeType &&
          serviceId == other.serviceId &&
          flightNumber == other.flightNumber &&
          date == other.date &&
          time == other.time &&
          pickupAddress == other.pickupAddress &&
          dropoffAddress == other.dropoffAddress &&
          _listEquals(stops, other.stops);

  @override
  int get hashCode =>
      serviceId.hashCode ^
      flightNumber.hashCode ^
      date.hashCode ^
      time.hashCode ^
      pickupAddress.hashCode ^
      dropoffAddress.hashCode ^
      _listHashCode(stops);

  bool _listEquals(List<String>? a, List<String>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  int _listHashCode(List<String>? list) {
    if (list == null) return null.hashCode;
    return list.fold(0, (int hash, String element) => hash ^ element.hashCode);
  }
}

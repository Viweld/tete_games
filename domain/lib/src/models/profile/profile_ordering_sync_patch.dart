part of 'profile.dart';

@immutable
class ProfileOrderingSyncPatch {
  const ProfileOrderingSyncPatch._({
    this.citizenshipId,
    this.phone,
    this.formattedDateOfBirth,
    this.firstName,
    this.lastName,
  });

  final int? citizenshipId;
  final String? phone;
  final String? formattedDateOfBirth;
  final String? firstName;
  final String? lastName;

  bool get isEmpty =>
      citizenshipId == null &&
      phone == null &&
      formattedDateOfBirth == null &&
      firstName == null &&
      lastName == null;

  Map<String, dynamic> toUpdateProfileBody() {
    final Map<String, dynamic> body = <String, dynamic>{};
    if (citizenshipId != null) {
      body['citizenship_id'] = citizenshipId;
    }
    if (phone != null) {
      body['phone'] = phone;
    }
    if (formattedDateOfBirth != null) {
      body['date_of_birth'] = formattedDateOfBirth;
    }
    if (firstName != null && lastName != null) {
      body['first_name'] = firstName;
      body['last_name'] = lastName;
    }
    return body;
  }

  factory ProfileOrderingSyncPatch.fromMainTravelerVsProfile({
    required UserProfile profile,
    required String? travelerPhone,
    required DateTime? travelerDateOfBirth,
    required String? travelerFirstName,
    required String? travelerLastName,
    Country? travelerCitizenship,
    bool includeCitizenshipDiff = true,
  }) {
    int? citizenshipId;
    if (includeCitizenshipDiff && travelerCitizenship?.id != profile.citizenshipInfo?.id) {
      citizenshipId = travelerCitizenship?.id ?? 0;
    }

    String? phone;
    if (travelerPhone != profile.phone) {
      phone = travelerPhone ?? '';
    }

    String? formattedDateOfBirth;
    if (travelerDateOfBirth != null &&
        !_isSameCalendarDate(travelerDateOfBirth, profile.dateOfBirth)) {
      formattedDateOfBirth = _formatApiDate(travelerDateOfBirth);
    }

    String? firstName;
    String? lastName;
    if (travelerFirstName != profile.firstName || travelerLastName != profile.lastName) {
      firstName = travelerFirstName ?? '';
      lastName = travelerLastName ?? '';
    }

    return ProfileOrderingSyncPatch._(
      citizenshipId: citizenshipId,
      phone: phone,
      formattedDateOfBirth: formattedDateOfBirth,
      firstName: firstName,
      lastName: lastName,
    );
  }
}

bool _isSameCalendarDate(DateTime? a, DateTime? b) {
  if (a == null && b == null) {
    return true;
  }
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

String _formatApiDate(DateTime date) {
  final String y = date.year.toString().padLeft(4, '0');
  final String m = date.month.toString().padLeft(2, '0');
  final String d = date.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

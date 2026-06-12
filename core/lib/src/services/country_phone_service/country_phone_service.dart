import 'dart:ui' show Locale;

import 'package:flutter/foundation.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' as libphone;
import 'package:sealed_countries/sealed_countries.dart';

/// Phone region data for a country.
@immutable
class CountryPhoneData {
  final String isoCode;
  final String name;
  final String dialCode;
  final String flagEmoji;
  final String phoneMask;

  const CountryPhoneData({
    required this.isoCode,
    required this.name,
    required this.dialCode,
    required this.flagEmoji,
    required this.phoneMask,
  });
}

@immutable
class _PhoneRegionTemplate {
  const _PhoneRegionTemplate({
    required this.isoCode,
    required this.dialCode,
    required this.phoneMask,
  });

  final String isoCode;
  final String dialCode;
  final String phoneMask;
}

/// Wrapper service for country dial codes and flag assets.
/// Country names are localized by sealed_countries (CLDR-like translations).
class CountryPhoneService {
  CountryPhoneService._();

  static final CountryPhoneService _instance = CountryPhoneService._();

  factory CountryPhoneService() => _instance;

  Future<void>? _initFuture;
  List<_PhoneRegionTemplate>? _runtimeTemplates;

  /// Initializes phone mask/region metadata from libphonenumber.
  /// Without this call the service falls back to a partial static list.
  Future<void> ensureInitialized() => _initFuture ??= _init();

  Future<void> _init() async {
    await libphone.init();

    final List<_PhoneRegionTemplate> templates = <_PhoneRegionTemplate>[];

    for (final libphone.CountryWithPhoneCode c in libphone.CountryManager().countries) {
      final String iso = c.countryCode.toUpperCase();
      final String dial = '+${c.phoneCode}';

      final String rawMask = c.getPhoneMask(
        format: libphone.PhoneNumberFormat.international,
        type: libphone.PhoneNumberType.mobile,
        removeCountryCodeFromMask: true,
      );

      final String mask = _toHashMask(rawMask);
      if (mask.isEmpty) continue;

      templates.add(_PhoneRegionTemplate(isoCode: iso, dialCode: dial, phoneMask: mask));
    }

    _runtimeTemplates = templates;
  }

  List<_PhoneRegionTemplate> get _effectiveTemplates => _runtimeTemplates ?? _fallbackTemplates;

  /// All available phone regions with names in [locale].
  List<CountryPhoneData> countries(Locale locale) =>
      _effectiveTemplates.map((_PhoneRegionTemplate t) => _toCountryPhoneData(t, locale)).toList();

  /// Returns data for a country ISO code (e.g. 'RU', 'US').
  CountryPhoneData? findByIsoCode(String isoCode, Locale locale) {
    final String code = isoCode.toUpperCase();
    final List<_PhoneRegionTemplate> templates = _effectiveTemplates;
    final int index = templates.indexWhere((_PhoneRegionTemplate t) => t.isoCode == code);
    return index >= 0 ? _toCountryPhoneData(templates[index], locale) : null;
  }

  /// Returns data for a dial code (e.g. '+7', '+1').
  CountryPhoneData? findByDialCode(String dialCode, Locale locale) {
    final String code = dialCode.startsWith('+') ? dialCode : '+$dialCode';
    final List<_PhoneRegionTemplate> templates = _effectiveTemplates;
    final int index = templates.indexWhere((_PhoneRegionTemplate t) => t.dialCode == code);
    return index >= 0 ? _toCountryPhoneData(templates[index], locale) : null;
  }

  /// Tries to resolve a region from a full phone number.
  /// Returns the longest matching dial code.
  CountryPhoneData? findByPhoneNumber(String phoneNumber, Locale locale) {
    final String digits = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final String normalized = digits.startsWith('+') ? digits : '+$digits';

    _PhoneRegionTemplate? bestTemplate;
    int bestLength = 0;

    for (final _PhoneRegionTemplate t in _effectiveTemplates) {
      if (normalized.startsWith(t.dialCode) && t.dialCode.length > bestLength) {
        bestTemplate = t;
        bestLength = t.dialCode.length;
      }
    }

    return bestTemplate == null ? null : _toCountryPhoneData(bestTemplate, locale);
  }

  /// Filters countries by the given ISO codes.
  List<CountryPhoneData> filterByIsoCodes(List<String> isoCodes, Locale locale) {
    final Set<String> codes = isoCodes.map((String c) => c.toUpperCase()).toSet();
    return _effectiveTemplates
        .where((_PhoneRegionTemplate t) => codes.contains(t.isoCode))
        .map((_PhoneRegionTemplate t) => _toCountryPhoneData(t, locale))
        .toList();
  }

  static CountryPhoneData _toCountryPhoneData(_PhoneRegionTemplate template, Locale locale) {
    final WorldCountry? worldCountry = WorldCountry.maybeFromCodeShort(template.isoCode);
    final String name;
    final String flagEmoji;
    if (worldCountry == null) {
      name = template.isoCode;
      flagEmoji = '';
    } else {
      name = worldCountry.commonNameFor(
        _typedLocaleFromFlutter(locale),
        orElse: worldCountry.name.common,
      );
      flagEmoji = worldCountry.emoji;
    }

    return CountryPhoneData(
      isoCode: template.isoCode,
      name: name,
      dialCode: template.dialCode,
      flagEmoji: flagEmoji,
      phoneMask: template.phoneMask,
    );
  }

  static BasicTypedLocale _typedLocaleFromFlutter(Locale locale) {
    final NaturalLanguage language =
        NaturalLanguage.maybeFromCodeShort(locale.languageCode) ?? const LangEng();
    final String? country = locale.countryCode;
    final String? regionalCode =
        country != null && country.length >= IsoStandardized.codeShortLength
        ? country.toUpperCase()
        : null;
    return BasicTypedLocale(language, regionalCode: regionalCode);
  }

  static String _toHashMask(String mask) {
    if (mask.isEmpty) return '';
    final String trimmed = mask.trim();
    final String normalized = trimmed.replaceAll(RegExp(r'\s+'), ' ');
    return normalized.replaceAll('0', '#');
  }

  static const List<_PhoneRegionTemplate> _fallbackTemplates = <_PhoneRegionTemplate>[
    _PhoneRegionTemplate(isoCode: 'RU', dialCode: '+7', phoneMask: '(###) ###-##-##'),
    _PhoneRegionTemplate(isoCode: 'US', dialCode: '+1', phoneMask: '(###) ###-####'),
    _PhoneRegionTemplate(isoCode: 'GB', dialCode: '+44', phoneMask: '#### ######'),
    _PhoneRegionTemplate(isoCode: 'DE', dialCode: '+49', phoneMask: '#### #######'),
    _PhoneRegionTemplate(isoCode: 'FR', dialCode: '+33', phoneMask: '# ## ## ## ##'),
    _PhoneRegionTemplate(isoCode: 'IT', dialCode: '+39', phoneMask: '### ### ####'),
    _PhoneRegionTemplate(isoCode: 'ES', dialCode: '+34', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'UA', dialCode: '+380', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'KZ', dialCode: '+7', phoneMask: '(###) ###-##-##'),
    _PhoneRegionTemplate(isoCode: 'BY', dialCode: '+375', phoneMask: '## ###-##-##'),
    _PhoneRegionTemplate(isoCode: 'UZ', dialCode: '+998', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'TR', dialCode: '+90', phoneMask: '### ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'AE', dialCode: '+971', phoneMask: '## ### ####'),
    _PhoneRegionTemplate(isoCode: 'CN', dialCode: '+86', phoneMask: '### #### ####'),
    _PhoneRegionTemplate(isoCode: 'JP', dialCode: '+81', phoneMask: '## #### ####'),
    _PhoneRegionTemplate(isoCode: 'KR', dialCode: '+82', phoneMask: '## #### ####'),
    _PhoneRegionTemplate(isoCode: 'IN', dialCode: '+91', phoneMask: '##### #####'),
    _PhoneRegionTemplate(isoCode: 'BR', dialCode: '+55', phoneMask: '## #####-####'),
    _PhoneRegionTemplate(isoCode: 'CA', dialCode: '+1', phoneMask: '(###) ###-####'),
    _PhoneRegionTemplate(isoCode: 'AU', dialCode: '+61', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'PL', dialCode: '+48', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'CZ', dialCode: '+420', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'AT', dialCode: '+43', phoneMask: '#### ######'),
    _PhoneRegionTemplate(isoCode: 'CH', dialCode: '+41', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'NL', dialCode: '+31', phoneMask: '# ########'),
    _PhoneRegionTemplate(isoCode: 'SE', dialCode: '+46', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'NO', dialCode: '+47', phoneMask: '### ## ###'),
    _PhoneRegionTemplate(isoCode: 'FI', dialCode: '+358', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'DK', dialCode: '+45', phoneMask: '## ## ## ##'),
    _PhoneRegionTemplate(isoCode: 'GR', dialCode: '+30', phoneMask: '### ### ####'),
    _PhoneRegionTemplate(isoCode: 'PT', dialCode: '+351', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'IL', dialCode: '+972', phoneMask: '## ### ####'),
    _PhoneRegionTemplate(isoCode: 'TH', dialCode: '+66', phoneMask: '## ### ####'),
    _PhoneRegionTemplate(isoCode: 'GE', dialCode: '+995', phoneMask: '### ## ## ##'),
    _PhoneRegionTemplate(isoCode: 'AM', dialCode: '+374', phoneMask: '## ######'),
    _PhoneRegionTemplate(isoCode: 'AZ', dialCode: '+994', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'MD', dialCode: '+373', phoneMask: '#### ####'),
    _PhoneRegionTemplate(isoCode: 'KG', dialCode: '+996', phoneMask: '### ### ###'),
    _PhoneRegionTemplate(isoCode: 'TJ', dialCode: '+992', phoneMask: '## ### ####'),
    _PhoneRegionTemplate(isoCode: 'TM', dialCode: '+993', phoneMask: '## ######'),
    _PhoneRegionTemplate(isoCode: 'MX', dialCode: '+52', phoneMask: '## #### ####'),
    _PhoneRegionTemplate(isoCode: 'AR', dialCode: '+54', phoneMask: '## ####-####'),
    _PhoneRegionTemplate(isoCode: 'EG', dialCode: '+20', phoneMask: '### ### ####'),
    _PhoneRegionTemplate(isoCode: 'SA', dialCode: '+966', phoneMask: '## ### ####'),
    _PhoneRegionTemplate(isoCode: 'SG', dialCode: '+65', phoneMask: '#### ####'),
    _PhoneRegionTemplate(isoCode: 'MY', dialCode: '+60', phoneMask: '##-### ####'),
    _PhoneRegionTemplate(isoCode: 'ID', dialCode: '+62', phoneMask: '### ### ####'),
    _PhoneRegionTemplate(isoCode: 'VN', dialCode: '+84', phoneMask: '## ### ## ##'),
    _PhoneRegionTemplate(isoCode: 'PH', dialCode: '+63', phoneMask: '### ### ####'),
    _PhoneRegionTemplate(isoCode: 'NZ', dialCode: '+64', phoneMask: '## ### ####'),
  ];
}

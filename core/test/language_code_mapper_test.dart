import 'package:core/src/localization/language_code_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LanguageCodeMapper', () {
    test('supportedCodes contains en and ru', () {
      expect(LanguageCodeMapper.supportedCodes, <String>{'en', 'ru'});
    });

    test('toLocale resolves backend codes case-insensitively', () {
      expect(LanguageCodeMapper.toLocale('en'), const Locale('en'));
      expect(LanguageCodeMapper.toLocale('RU'), const Locale('ru'));
      expect(LanguageCodeMapper.toLocale('de'), isNull);
    });

    test('toLanguageCode maps system locale to backend code', () {
      expect(LanguageCodeMapper.toLanguageCode(const Locale('ru')), 'ru');
      expect(LanguageCodeMapper.toLanguageCode(const Locale('en', 'US')), 'en');
      expect(LanguageCodeMapper.toLanguageCode(const Locale('de')), isNull);
    });
  });
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

bool hasCyrillic(String text) => RegExp('[А-Яа-яЁё]').hasMatch(text);

Future<void> main() async {
  final Directory dir = Directory('.');
  final Iterable<File> files = dir.listSync().whereType<File>().where(
    (File f) => f.path.endsWith('.arb') && !f.path.contains('app_ru.arb'),
  );

  for (final File file in files) {
    final String content = await file.readAsString();
    final Map<String, dynamic> json = jsonDecode(content) as Map<String, dynamic>;
    final List<String> ruKeys = <String>[];

    json.forEach((String key, dynamic value) {
      if (value is String && hasCyrillic(value)) {
        ruKeys.add(key);
      }
    });

    if (ruKeys.isNotEmpty) {
      log('File: ${file.path}');
      for (final String key in ruKeys) {
        log('  $key: ${json[key]}');
      }
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

// ─── Config ───────────────────────────────────────────────────────────────────

final String openAiApiKey = Platform.environment['OPENAI_API_KEY'] ?? 'YOUR_API_KEY_HERE';

/// Maximum number of keys sent to OpenAI in a single request.
const int batchSize = 20;

/// Maximum translation retry attempts per batch.
const int maxRetries = 3;

/// Supported target languages: display name → locale code.
final Map<String, String> languages = <String, String>{'English': 'en'};

// ─── Entry point ──────────────────────────────────────────────────────────────

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    log('Usage: dart translate_arb.dart <input_file.arb>');
    exit(1);
  }

  final String inputFilePath = args[0];
  final File inputFile = File(inputFilePath);
  if (!inputFile.existsSync()) {
    log('File $inputFilePath not found');
    exit(1);
  }

  final Map<String, dynamic> arbContent =
      jsonDecode(await inputFile.readAsString()) as Map<String, dynamic>;

  final List<_ArbEntry> entries = _parseArbEntries(arbContent);
  final int totalBatches = (entries.length / batchSize).ceil();

  for (final MapEntry<String, String> lang in languages.entries) {
    final String langName = lang.key;
    final String langCode = lang.value;

    log('\n🌐 Translating to $langName ($langCode)...');

    final Map<String, dynamic> translated = <String, dynamic>{};

    for (int i = 0; i < entries.length; i += batchSize) {
      final List<_ArbEntry> batch = entries.sublist(i, (i + batchSize).clamp(0, entries.length));
      log('Translating batch ${i ~/ batchSize + 1} / $totalBatches...');

      final Map<String, dynamic> batchResult = await _translateBatchWithRetry(batch, langCode);
      translated.addAll(batchResult);
    }

    translated['@@locale'] = langCode;

    final String outputFilePath = _buildOutputPath(inputFilePath, langCode);
    await File(
      outputFilePath,
    ).writeAsString(const JsonEncoder.withIndent('  ').convert(translated));

    log('✅ $langName ($langCode) → $outputFilePath');
  }

  log('\n🎉 All translations completed!');
}

// ─── Data model ───────────────────────────────────────────────────────────────

/// A single translatable ARB entry with its optional metadata.
class _ArbEntry {
  const _ArbEntry({required this.key, required this.text, this.meta});

  final String key;
  final String text;
  final Map<String, dynamic>? meta;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

/// Parse an ARB map into a list of [_ArbEntry] objects, skipping metadata keys.
List<_ArbEntry> _parseArbEntries(Map<String, dynamic> arb) {
  final List<_ArbEntry> entries = <_ArbEntry>[];
  for (final String key in arb.keys) {
    if (key.startsWith('@')) continue;
    final dynamic raw = arb[key];
    if (raw is! String) continue;
    entries.add(_ArbEntry(key: key, text: raw, meta: arb['@$key'] as Map<String, dynamic>?));
  }
  return entries;
}

/// Replace the locale suffix in [inputPath] with [langCode].
/// Supports both simple codes (ru, th) and region codes (pt-PT).
String _buildOutputPath(String inputPath, String langCode) {
  return inputPath.replaceAll(RegExp(r'_[a-zA-Z]{2,3}(-[a-zA-Z]{2,4})?\.arb$'), '_$langCode.arb');
}

/// Returns true if [text] contains any Cyrillic characters.
bool _hasCyrillic(String text) => RegExp('[А-Яа-яЁё]').hasMatch(text);

/// Returns true if the number of `{` and `}` in [translated] matches [original].
/// Used to detect broken ICU plural / placeholder syntax.
bool _icuIntact(String original, String translated) {
  int count(String s, String ch) => RegExp(RegExp.escape(ch)).allMatches(s).length;
  return count(original, '{') == count(translated, '{') &&
      count(original, '}') == count(translated, '}');
}

// ─── Translation ──────────────────────────────────────────────────────────────

/// Translates [batch] to [targetLanguage], retrying entries that still contain
/// Cyrillic text up to [maxRetries] times.
Future<Map<String, dynamic>> _translateBatchWithRetry(
  List<_ArbEntry> batch,
  String targetLanguage,
) async {
  // Map key → entry for fast lookup during retry cycle.
  Map<String, _ArbEntry> pending = <String, _ArbEntry>{for (final _ArbEntry e in batch) e.key: e};
  final Map<String, dynamic> result = <String, dynamic>{};

  for (int attempt = 1; attempt <= maxRetries && pending.isNotEmpty; attempt++) {
    log('🔁 Attempt $attempt for ${pending.length} keys...');

    final Map<String, String> translations = await _callOpenAI(
      pending.values.toList(),
      targetLanguage,
    );

    final Map<String, _ArbEntry> stillPending = <String, _ArbEntry>{};

    for (final MapEntry<String, String> t in translations.entries) {
      final String key = t.key;
      final String text = t.value;
      final _ArbEntry? entry = pending[key];
      if (entry == null) continue;

      if (_hasCyrillic(text)) {
        // Translation still in Russian — schedule for retry.
        stillPending[key] = entry;
      } else {
        result[key] = text;
        if (entry.meta != null) result['@$key'] = entry.meta;
      }
    }

    // Keys missing from the API response also go back for retry.
    for (final String key in pending.keys) {
      if (!translations.containsKey(key)) {
        stillPending[key] = pending[key]!;
      }
    }

    pending = stillPending;
    if (pending.isNotEmpty) {
      log('⚠️ ${pending.length} keys still untranslated, retrying...');
    }
  }

  // Fallback: preserve original text for any persistently untranslated entries.
  for (final _ArbEntry entry in pending.values) {
    log('❌ Failed to translate "${entry.key}", keeping original text');
    result[entry.key] = entry.text;
    if (entry.meta != null) result['@${entry.key}'] = entry.meta;
  }

  return result;
}

/// Sends [batch] to the OpenAI Chat API and returns key → translated text.
/// On any error falls back to the original text for each key.
Future<Map<String, String>> _callOpenAI(List<_ArbEntry> batch, String targetLanguage) async {
  Map<String, String> fallback() => <String, String>{
    for (final _ArbEntry e in batch) e.key: e.text,
  };

  final Map<String, String> inputMap = <String, String>{
    for (final _ArbEntry e in batch) e.key: e.text,
  };

  final String prompt =
      '''
You are a professional translator. Translate the texts into $targetLanguage.

⚠️ Critical rules:
- Do not add or change curly braces `{}`, ICU plural constructs, or placeholders.
- Do not escape braces.
- Return strictly **valid JSON** with the same keys as the input.
- Example:
  Source: "receipt_bonus_points_short": "{count, plural, one{{count} балл} few{{count} балла} many{{count} баллов} other{{count} балла}}"
  Target: "receipt_bonus_points_short": "{count, plural, one{{count} point} few{{count} points} many{{count} points} other{{count} points}}"

Texts to translate (JSON):
${jsonEncode(inputMap)}
''';

  final http.Response response = await http.post(
    Uri.parse('https://api.openai.com/v1/chat/completions'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $openAiApiKey',
    },
    body: jsonEncode(<String, Object?>{
      'model': 'gpt-4o-mini',
      'messages': <Map<String, String>>[
        <String, String>{'role': 'user', 'content': prompt},
      ],
      'temperature': 0,
    }),
  );

  if (response.statusCode != 200) {
    log('⚠️ API error: ${response.statusCode} ${response.body}');
    return fallback();
  }

  try {
    final dynamic data = jsonDecode(response.body);
    final String content = (data['choices'][0]['message']['content'] as String).trim();

    // Strip Markdown code fences if the model wraps the JSON in them.
    final String jsonContent = content
        .replaceFirst(RegExp(r'^```json\s*'), '')
        .replaceFirst(RegExp(r'^```\s*'), '')
        .replaceFirst(RegExp(r'\s*```$'), '')
        .trim();

    final Map<String, dynamic> parsed = jsonDecode(jsonContent) as Map<String, dynamic>;

    final Map<String, String> result = <String, String>{};
    for (final _ArbEntry entry in batch) {
      final dynamic raw = parsed[entry.key];
      final String translation = raw is String ? raw : entry.text;

      if (!_icuIntact(entry.text, translation)) {
        log('⚠️ ICU mismatch for "${entry.key}", keeping original');
        result[entry.key] = entry.text;
      } else {
        result[entry.key] = translation;
      }
    }
    return result;
  } catch (e) {
    log('⚠️ Failed to parse OpenAI response: $e');
    return fallback();
  }
}

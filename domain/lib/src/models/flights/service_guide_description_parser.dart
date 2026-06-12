part of 'flight_models.dart';

class ServiceGuideDescriptionParser {
  const ServiceGuideDescriptionParser._();

  static List<String>? parse(String description) {
    if (description.isEmpty) {
      return null;
    }

    if (!_looksLikeHtml(description)) {
      return <String>[description];
    }

    final List<String> listItems = _extractTagItems(description, 'li');
    if (listItems.isNotEmpty) {
      return listItems;
    }

    final List<String> paragraphs = _extractTagItems(description, 'p');
    if (paragraphs.isNotEmpty) {
      return paragraphs;
    }

    final List<String> lineBreakItems = _extractByLineBreaks(description);
    if (lineBreakItems.length > 1) {
      return lineBreakItems;
    }

    final String plainText = _decodeHtmlEntities(_stripHtmlTags(description)).trim();
    if (plainText.isEmpty) {
      return null;
    }

    return <String>[plainText];
  }

  static bool _looksLikeHtml(String input) {
    return RegExp('<[a-zA-Z!/]').hasMatch(input);
  }

  static List<String> _extractTagItems(String html, String tag) {
    final List<String> items = <String>[];
    final RegExp pattern = RegExp('<$tag[^>]*>(.*?)</$tag>', caseSensitive: false, dotAll: true);

    for (final RegExpMatch match in pattern.allMatches(html)) {
      final String raw = match.group(1) ?? '';
      final String text = _decodeHtmlEntities(_stripHtmlTags(raw)).trim();
      if (text.isNotEmpty) {
        items.add(text);
      }
    }

    return items;
  }

  static List<String> _extractByLineBreaks(String html) {
    const String breakMarker = '|||BREAK|||';
    final String normalized = html.replaceAll(
      RegExp(r'<br\s*/?>', caseSensitive: false),
      breakMarker,
    );
    final String stripped = _decodeHtmlEntities(_stripHtmlTags(normalized)).trim();
    if (stripped.isEmpty) {
      return const <String>[];
    }

    return stripped
        .split(breakMarker)
        .map((String part) => part.trim())
        .where((String part) => part.isNotEmpty)
        .toList();
  }

  static String _stripHtmlTags(String input) {
    return input.replaceAll(RegExp('<[^>]*>'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  static String _decodeHtmlEntities(String input) {
    return input
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&apos;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAllMapped(RegExp(r'&#(\d+);'), (Match match) {
          final int? code = int.tryParse(match.group(1)!);
          return code != null ? String.fromCharCode(code) : match.group(0)!;
        });
  }
}

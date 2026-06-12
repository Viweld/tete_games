/// Extracts list item text from HTML guide bodies (`<ul>`, `<ol>`).
class GuideHtmlParser {
  const GuideHtmlParser._();

  static List<String> extractListItems(String html) {
    if (html.isEmpty) return const <String>[];

    final List<String> items = <String>[];
    final RegExp liPattern = RegExp('<li[^>]*>(.*?)</li>', caseSensitive: false, dotAll: true);

    for (final RegExpMatch match in liPattern.allMatches(html)) {
      final String raw = match.group(1) ?? '';
      final String text = _decodeHtmlEntities(_stripHtmlTags(raw)).trim();
      if (text.isNotEmpty) {
        items.add(text);
      }
    }

    return items;
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

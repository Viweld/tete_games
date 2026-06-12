part of 'extensions.dart';

String preprocessContentHtml(String html) {
  // Regex for URLs that are NOT inside an href attribute
  final RegExp urlRegex = RegExp(r"(?<!href=['\'])((https?:\/\/)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,})");

  // Process emails first (when not already wrapped in <a>)
  final RegExp emailRegex = RegExp(
    r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    multiLine: true,
  );

  String processed = html;

  // Emails not inside <a> tags
  processed = processed.replaceAllMapped(emailRegex, (Match match) {
    final String email = match.group(0)!;
    final int start = match.start;
    final int end = match.end;

    // Skip if email is already inside an existing <a> tag
    final String before = processed.substring(0, start);
    final String after = processed.substring(end);

    if (before.contains('<a') && after.contains('</a>')) {
      return email;
    }

    // Skip if email is part of an href attribute
    if (before.contains('href=') && !before.contains('>')) {
      return email;
    }

    return '<a href="mailto:$email">$email</a>';
  });

  // URLs not inside <a> tags
  processed = processed.replaceAllMapped(urlRegex, (Match match) {
    final String url = match.group(0)!;
    final int start = match.start;
    final int end = match.end;

    final String before = processed.substring(0, start);
    final String after = processed.substring(end);

    if (before.contains('<a') && after.contains('</a>')) {
      return url;
    }

    if (before.contains('href=') && !before.contains('>')) {
      return url;
    }

    // Plain text URL after <br> or another tag
    final String fullUrl = url.startsWith('http') ? url : 'https://$url';
    return '<a href="$fullUrl">$url</a>';
  });

  return processed;
}

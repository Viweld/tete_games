import 'package:core_ui/core_ui.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHtmlContent extends StatelessWidget {
  final String html;
  final TextStyle? style;

  const AppHtmlContent({super.key, required this.html, this.style});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final TextStyle defaultStyle = style ?? AppFonts.b2.copyWith(color: colors.text.main);
    final String normalizedHtml = _normalizeHtmlIfNeeded(html);

    return Html(
      data: normalizedHtml,
      style: <String, Style>{
        'body': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(defaultStyle.fontSize ?? 14),
          fontWeight: defaultStyle.fontWeight ?? FontWeight.normal,
          color: defaultStyle.color,
        ),
        'p': Style(margin: Margins.only(bottom: 0)),
        'ul': Style(margin: Margins.only(bottom: 0, left: -24)),
        'li': Style(margin: Margins.only(bottom: 0)),
        'strong': Style.fromTextStyle(AppFonts.b4.copyWith(color: colors.text.main)),
        'a': Style(
          color: colors.link.main,
          textDecoration: TextDecoration.underline,
          fontWeight: defaultStyle.fontWeight ?? FontWeight.normal,
        ),
      },
      onLinkTap: (String? url, _, _) async {
        if (url == null) return;

        final Uri uri = Uri.parse(url);

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }

  static String _normalizeHtmlIfNeeded(String html) {
    // Backend sometimes returns tags escaped as text inside HTML (e.g. "<p>&lt;p&gt;...&lt;/p&gt;</p>").
    // Decode only when it looks like encoded markup to avoid touching regular content.
    if (!html.contains('&lt;') && !html.contains('&gt;')) return html;
    return HtmlUnescape().convert(html);
  }
}

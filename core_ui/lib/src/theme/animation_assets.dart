/// Animation asset paths bundled in this package.
abstract final class AnimationAssets {
  static const String basePath = 'packages/core_ui/resources/animations/';

  static const String advertising = '${basePath}advertising.json';

  static const String seeking = '${basePath}seeking.json';

  static const List<String> all = <String>[advertising, seeking];
}

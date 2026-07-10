import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final String featureName = _snakeCase('${context.vars['feature_name']}');
  final String screenName = _snakeCase('${context.vars['screen_name']}');
  final String screenPascal = _pascalCase(screenName);

  final String featureBarrel = 'features/$featureName/lib/$featureName.dart';
  final String appRouter = 'navigation/lib/src/app_router/app_router.dart';

  _insertAfterMarker(
    file: File(featureBarrel),
    marker: '// fz:feature-routes',
    insert: '    AutoRoute(page: ${screenPascal}Route.page),',
    logger: context.logger,
  );

  _insertAfterMarker(
    file: File(appRouter),
    marker: '// fz:routes',
    insert: '    AutoRoute(page: ${screenPascal}Route.page),',
    logger: context.logger,
  );

  _insertAfterMarker(
    file: File(appRouter),
    marker: '// fz:navigate-methods',
    insert: '  Future<void> navigate$screenPascal() => push(${screenPascal}Route());',
    logger: context.logger,
  );

  final Progress buildRunner = context.logger.progress('build_runner');
  for (final String pkg in <String>['features/$featureName', 'navigation', '.']) {
    final ProcessResult result = await Process.run(
      'sh',
      <String>['-c', 'fvm dart run build_runner build --delete-conflicting-outputs'],
      workingDirectory: pkg,
    );
    if (result.exitCode != 0) {
      buildRunner.fail('build_runner failed in $pkg');
      stderr.write(result.stderr);
      return;
    }
  }
  buildRunner.complete('codegen');
}

void _insertAfterMarker({
  required File file,
  required String marker,
  required String insert,
  required Logger logger,
}) {
  if (!file.existsSync()) {
    throw StateError('Patch target not found: ${file.path}');
  }

  final List<String> lines = file.readAsLinesSync();
  final int markerIndex = lines.indexWhere((String line) => line.contains(marker));
  if (markerIndex == -1) {
    throw StateError('Marker not found in ${file.path}: $marker');
  }

  final List<String> insertLines = <String>[insert];
  if (_alreadyInserted(lines, insertLines, markerIndex)) {
    return;
  }

  lines.insertAll(markerIndex + 1, insertLines);
  file.writeAsStringSync('${lines.join('\n')}\n');
  logger.info('Patched ${file.path}');
}

bool _alreadyInserted(List<String> lines, List<String> insertLines, int markerIndex) {
  if (markerIndex + insertLines.length >= lines.length) {
    return false;
  }
  for (var i = 0; i < insertLines.length; i++) {
    if (lines[markerIndex + 1 + i].trim() != insertLines[i].trim()) {
      return false;
    }
  }
  return true;
}

String _snakeCase(String value) => value.trim().replaceAll('-', '_').toLowerCase();

String _pascalCase(String value) {
  return _snakeCase(value)
      .split('_')
      .where((String part) => part.isNotEmpty)
      .map((String part) => '${part[0].toUpperCase()}${part.substring(1)}')
      .join();
}

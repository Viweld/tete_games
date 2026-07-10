import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final String featureName = _snakeCase('${context.vars['feature_name']}');
  final String pascalName = _pascalCase(featureName);

  final List<({String file, String marker, String insert})> patches =
      <({String file, String marker, String insert})>[
        (
          file: 'pubspec.yaml',
          marker: '# fz:workspace-features',
          insert: '  - features/$featureName',
        ),
        (
          file: 'pubspec.yaml',
          marker: '# fz:feature-deps',
          insert: '  $featureName:\n    path: ./features/$featureName',
        ),
        (
          file: 'navigation/pubspec.yaml',
          marker: '# fz:navigation-features',
          insert: '  $featureName:\n    path: ../features/$featureName',
        ),
        (
          file: 'lib/di/app_di.dart',
          marker: '// fz:kit-imports',
          insert: "import 'package:$featureName/$featureName.dart';",
        ),
        (
          file: 'lib/di/app_di.dart',
          marker: '// fz:external-modules',
          insert: '    ExternalModule(${pascalName}PackageModule),',
        ),
      ];

  for (final ({String file, String marker, String insert}) patch in patches) {
    _insertAfterMarker(
      file: File(patch.file),
      marker: patch.marker,
      insert: patch.insert,
      logger: context.logger,
    );
  }

  final Progress pubGet = context.logger.progress('fvm flutter pub get');
  final ProcessResult pubGetResult = await Process.run('sh', <String>[
    '-c',
    'fvm flutter pub get',
  ], workingDirectory: Directory.current.path);
  if (pubGetResult.exitCode != 0) {
    pubGet.fail('pub get failed');
    stderr.write(pubGetResult.stderr);
    return;
  }
  pubGet.complete('pub get');

  final Progress buildRunner = context.logger.progress('build_runner (feature + app)');
  for (final String pkg in <String>['features/$featureName', '.']) {
    final ProcessResult result = await Process.run('sh', <String>[
      '-c',
      'fvm dart run build_runner build --delete-conflicting-outputs',
    ], workingDirectory: pkg);
    if (result.exitCode != 0) {
      buildRunner.fail('build_runner failed in $pkg');
      stdout.write(result.stdout);
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
    logger.warn('Skip patch — file not found: ${file.path}');
    return;
  }

  final List<String> lines = file.readAsLinesSync();
  final int markerIndex = lines.indexWhere((String line) => line.contains(marker));
  if (markerIndex == -1) {
    logger.warn('Skip patch — marker not found in ${file.path}: $marker');
    return;
  }

  final List<String> insertLines = insert
      .replaceAll('\r\n', '\n')
      .split('\n')
      .where((String line) => line.isNotEmpty)
      .toList();

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

String _snakeCase(String value) {
  return value.trim().replaceAll('-', '_').toLowerCase();
}

String _pascalCase(String value) {
  return _snakeCase(value)
      .split('_')
      .where((String part) => part.isNotEmpty)
      .map((String part) => '${part[0].toUpperCase()}${part.substring(1)}')
      .join();
}

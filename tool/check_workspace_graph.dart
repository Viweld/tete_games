// Workspace dependency graph validator for tete_games.
//
// Run from repository root:
//   fvm dart run tool/check_workspace_graph.dart
//
// See tool/workspace_graph_config.yaml and .cursor/rules/tete-package-dependencies.mdc.

import 'dart:io';

final class GraphIssue {
  const GraphIssue(this.message, {this.isWarning = false});

  final String message;
  final bool isWarning;
}

void main() {
  final Directory root = Directory.current;
  if (!File('${root.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('Run from repository root.');
    exit(2);
  }

  final _Config config = _Config.load('${root.path}/tool/workspace_graph_config.yaml');
  final _Workspace workspace = _Workspace.load(root);

  final List<GraphIssue> issues = <GraphIssue>[];

  issues.addAll(_checkPubspecGraph(workspace, config));
  issues.addAll(_checkImportGraph(workspace, config));
  issues.addAll(_checkCrossPackageSrcImports(workspace, config));
  issues.addAll(_checkBlePeerSessionScope(workspace, config));
  issues.addAll(_checkCycles(workspace));

  final List<GraphIssue> errors =
      issues.where((GraphIssue i) => !i.isWarning || config.strict).toList();
  final List<GraphIssue> warnings =
      issues.where((GraphIssue i) => i.isWarning && !config.strict).toList();

  for (final GraphIssue w in warnings) {
    stdout.writeln('WARN: ${w.message}');
  }
  for (final GraphIssue e in errors) {
    stderr.writeln('ERROR: ${e.message}');
  }

  if (errors.isNotEmpty) {
    stderr.writeln('\n${errors.length} dependency graph error(s).');
    exit(1);
  }

  stdout.writeln(
    'OK: workspace graph (${workspace.packages.length} packages, '
    '${warnings.length} warning(s)).',
  );
}

final class _Config {
  _Config({required this.strict, required this.extraPubspecEdges});

  final bool strict;
  final Set<(String, String)> extraPubspecEdges;

  static _Config load(String path) {
    bool strict = false;
    final Set<(String, String)> extra = <(String, String)>{};
    final File file = File(path);
    if (!file.existsSync()) {
      return _Config(strict: strict, extraPubspecEdges: extra);
    }

    String? pendingFrom;
    for (final String line in file.readAsLinesSync()) {
      final String trimmed = line.trim();
      if (trimmed.startsWith('strict:')) {
        strict = trimmed.replaceFirst('strict:', '').trim() == 'true';
      } else if (trimmed.startsWith('- from:')) {
        pendingFrom = trimmed.replaceFirst('- from:', '').trim();
      } else if (trimmed.startsWith('to:') && pendingFrom != null) {
        final String to = trimmed.replaceFirst('to:', '').trim();
        extra.add((pendingFrom, to));
        pendingFrom = null;
      }
    }
    return _Config(strict: strict, extraPubspecEdges: extra);
  }
}

final class _Package {
  _Package({
    required this.name,
    required this.root,
    required this.category,
    required this.pathDependencies,
  });

  final String name;
  final Directory root;
  final _PackageCategory category;
  final Set<String> pathDependencies;
}

enum _PackageCategory { app, kernel, infrastructure, platform, feature, navigation, legacy }

final class _Workspace {
  _Workspace(this.root, this.packages);

  final Directory root;
  final Map<String, _Package> packages;

  static _Workspace load(Directory root) {
    final Map<String, _Package> packages = <String, _Package>{};

    packages['app'] = _Package(
      name: 'app',
      root: root,
      category: _PackageCategory.app,
      pathDependencies: _readPathDeps('${root.path}/pubspec.yaml'),
    );

    final List<String> workspacePaths = _readWorkspaceList('${root.path}/pubspec.yaml');
    for (final String rel in workspacePaths) {
      final String pubspecPath = '${root.path}/$rel/pubspec.yaml';
      if (!File(pubspecPath).existsSync()) {
        continue;
      }
      final String name = _readPackageName(pubspecPath);
      packages[name] = _Package(
        name: name,
        root: Directory('${root.path}/$rel'),
        category: _categoryForPath(rel, name),
        pathDependencies: _readPathDeps(pubspecPath),
      );
    }

    return _Workspace(root, packages);
  }
}

_PackageCategory _categoryForPath(String rel, String name) {
  if (rel.startsWith('features/')) {
    return _PackageCategory.feature;
  }
  if (rel.startsWith('platform/')) {
    return _PackageCategory.platform;
  }
  if (rel == 'navigation') {
    return _PackageCategory.navigation;
  }
  if (rel == 'infrastructure') {
    return _PackageCategory.infrastructure;
  }
  if (rel == 'domain' || rel == 'data') {
    return _PackageCategory.legacy;
  }
  return _PackageCategory.kernel;
}

List<String> _readWorkspaceList(String pubspecPath) {
  final List<String> result = <String>[];
  bool inWorkspace = false;
  for (final String line in File(pubspecPath).readAsLinesSync()) {
    if (line.startsWith('workspace:')) {
      inWorkspace = true;
      continue;
    }
    if (inWorkspace) {
      if (line.startsWith('  - ')) {
        result.add(line.substring(4).trim());
      } else if (line.trim().isNotEmpty && !line.startsWith(' ')) {
        break;
      }
    }
  }
  return result;
}

String _readPackageName(String pubspecPath) {
  for (final String line in File(pubspecPath).readAsLinesSync()) {
    if (line.startsWith('name:')) {
      return line.replaceFirst('name:', '').trim();
    }
  }
  throw StateError('No name in $pubspecPath');
}

Set<String> _readPathDeps(String pubspecPath) {
  final Set<String> deps = <String>{};
  bool inDeps = false;
  String? pending;
  for (final String line in File(pubspecPath).readAsLinesSync()) {
    if (line == 'dependencies:') {
      inDeps = true;
      continue;
    }
    if (inDeps) {
      if (RegExp(r'^[a-z]').hasMatch(line)) {
        break;
      }
      final RegExpMatch? nameMatch = RegExp(r'^  ([a-z_][a-z0-9_]*)').firstMatch(line);
      if (nameMatch != null) {
        pending = nameMatch.group(1);
      }
      if (line.contains('path:') && pending != null && pending != 'flutter') {
        deps.add(pending);
        pending = null;
      }
    }
  }
  return deps;
}

bool _isPubspecEdgeAllowed({
  required _Package from,
  required String to,
  required _Config config,
}) {
  if (from.name == to) {
    return false;
  }

  if (config.extraPubspecEdges.contains((from.name, to))) {
    return true;
  }

  switch (from.category) {
    case _PackageCategory.app:
      return true;
    case _PackageCategory.kernel:
      if (from.name == 'core_ui') {
        return to == 'core' || to == 'navigation_api';
      }
      return false;
    case _PackageCategory.infrastructure:
      return to == 'core' || (to == 'domain' && !config.strict);
    case _PackageCategory.platform:
      return to == 'core';
    case _PackageCategory.feature:
      if (config.strict) {
        return to == 'core' ||
            to == 'core_ui' ||
            to == 'navigation_api' ||
            to == 'peer';
      }
      return to == 'core' ||
          to == 'core_ui' ||
          to == 'navigation_api' ||
          to == 'domain' ||
          to == 'peer';
    case _PackageCategory.navigation:
      if (to == 'navigation_api' || to == 'core') {
        return true;
      }
      final _Package? target = _globalWorkspace?.packages[to];
      return target?.category == _PackageCategory.feature;
    case _PackageCategory.legacy:
      if (from.name == 'data') {
        return to == 'core' || to == 'domain';
      }
      return false;
  }
}

_Workspace? _globalWorkspace;

List<GraphIssue> _checkPubspecGraph(_Workspace workspace, _Config config) {
  _globalWorkspace = workspace;
  final List<GraphIssue> issues = <GraphIssue>[];
  for (final _Package pkg in workspace.packages.values) {
    for (final String dep in pkg.pathDependencies) {
      if (!_isPubspecEdgeAllowed(from: pkg, to: dep, config: config)) {
        issues.add(
          GraphIssue(
            'pubspec: ${pkg.name} must not depend on $dep',
            isWarning: !config.strict && _isTransitionalPubspec(pkg.name, dep),
          ),
        );
      }
    }
  }
  return issues;
}

bool _isTransitionalPubspec(String from, String to) {
  return from == 'shell' && to == 'domain' ||
      from == 'data' && (to == 'core' || to == 'domain') ||
      from == 'infrastructure' && to == 'domain' ||
      from == 'navigation' && to == 'shell';
}

bool _isImportEdgeAllowed({
  required _Package from,
  required String to,
  required _Config config,
}) {
  if (from.name == to) {
    return true;
  }

  // Cross-package src/ is always forbidden (handled separately too).
  if (to == 'data' && from.category == _PackageCategory.feature) {
    return false;
  }
  if (to == 'infrastructure' && from.category != _PackageCategory.app) {
    return false;
  }
  if (from.category == _PackageCategory.platform &&
      _globalWorkspace!.packages[to]?.category == _PackageCategory.feature) {
    return false;
  }
  if (from.category == _PackageCategory.infrastructure &&
      (_globalWorkspace!.packages[to]?.category == _PackageCategory.feature ||
          _globalWorkspace!.packages[to]?.category == _PackageCategory.platform)) {
    return false;
  }

  return _isPubspecEdgeAllowed(from: from, to: to, config: config) ||
      (from.category == _PackageCategory.app);
}

List<GraphIssue> _checkImportGraph(_Workspace workspace, _Config config) {
  _globalWorkspace = workspace;
  final List<GraphIssue> issues = <GraphIssue>[];
  final RegExp importRe = RegExp(r"""^import 'package:([a-z_]+)/""");

  for (final _Package pkg in workspace.packages.values) {
    if (!pkg.root.existsSync()) {
      continue;
    }
    for (final File file in _dartFiles(pkg.root)) {
      if (_shouldSkipPath(file.path)) {
        continue;
      }
      for (final String line in file.readAsLinesSync()) {
        final RegExpMatch? match = importRe.firstMatch(line);
        if (match == null) {
          continue;
        }
        final String target = match.group(1)!;
        if (!workspace.packages.containsKey(target) && target != 'app') {
          continue;
        }
        if (target == 'app' && pkg.name != 'app') {
          issues.add(GraphIssue('import: ${pkg.name} must not import package:app (${file.path})'));
          continue;
        }
        if (target == pkg.name) {
          continue;
        }
        final _Package? targetPkg = workspace.packages[target];
        if (targetPkg == null) {
          continue;
        }
        if (!_isImportEdgeAllowed(from: pkg, to: target, config: config)) {
          issues.add(
            GraphIssue(
              'import: ${pkg.name} must not import package:$target/ (${file.path})',
              isWarning: !config.strict && target == 'domain' && pkg.category == _PackageCategory.feature,
            ),
          );
        }
      }
    }
  }
  return issues;
}

List<GraphIssue> _checkCrossPackageSrcImports(_Workspace workspace, _Config config) {
  final List<GraphIssue> issues = <GraphIssue>[];
  final RegExp srcImportRe = RegExp(r"""^import 'package:([a-z_]+)/src/""");

  for (final _Package pkg in workspace.packages.values) {
    for (final File file in _dartFiles(pkg.root)) {
      if (_shouldSkipPath(file.path)) {
        continue;
      }
      for (final String line in file.readAsLinesSync()) {
        final RegExpMatch? match = srcImportRe.firstMatch(line);
        if (match == null) {
          continue;
        }
        final String target = match.group(1)!;
        if (target == pkg.name) {
          continue;
        }
        // app composition root may import */src/di/*.module.dart
        if (pkg.name == 'app' && line.contains('/src/di/') && line.contains('.module.dart')) {
          continue;
        }
        issues.add(
          GraphIssue(
            'src import: ${pkg.name} must not import package:$target/src/ (${file.path})',
          ),
        );
      }
    }
  }
  return issues;
}

List<GraphIssue> _checkBlePeerSessionScope(_Workspace workspace, _Config config) {
  final List<GraphIssue> issues = <GraphIssue>[];
  final RegExp bleImport = RegExp(r"""^import 'package:ble_peer_session/""");

  for (final _Package pkg in workspace.packages.values) {
    if (pkg.name == 'infrastructure' || pkg.name == 'data') {
      continue;
    }
    for (final File file in _dartFiles(pkg.root)) {
      if (_shouldSkipPath(file.path)) {
        continue;
      }
      for (final String line in file.readAsLinesSync()) {
        if (bleImport.hasMatch(line)) {
          issues.add(
            GraphIssue(
              'ble_peer_session: only infrastructure/data may import it (${file.path})',
              isWarning: pkg.category == _PackageCategory.legacy && !config.strict,
            ),
          );
        }
      }
    }
  }

  if (!config.strict) {
    for (final _Package pkg in workspace.packages.values) {
      if (pkg.name != 'data') {
        continue;
      }
      for (final File file in _dartFiles(pkg.root)) {
        for (final String line in file.readAsLinesSync()) {
          if (bleImport.hasMatch(line)) {
            issues.add(
              GraphIssue(
                'ble_peer_session: legacy data/ usage — move to infrastructure/ (transitional)',
                isWarning: true,
              ),
            );
          }
        }
      }
    }
  }

  return issues;
}

List<GraphIssue> _checkCycles(_Workspace workspace) {
  final List<GraphIssue> issues = <GraphIssue>[];
  final Map<String, Set<String>> graph = <String, Set<String>>{};
  for (final _Package pkg in workspace.packages.values) {
    graph[pkg.name] = Set<String>.from(pkg.pathDependencies);
  }

  final Set<String> visited = <String>{};
  final Set<String> stack = <String>{};

  bool dfs(String node) {
    if (stack.contains(node)) {
      issues.add(GraphIssue('cycle: pubspec dependency cycle involving $node'));
      return true;
    }
    if (visited.contains(node)) {
      return false;
    }
    visited.add(node);
    stack.add(node);
    for (final String next in graph[node] ?? const <String>{}) {
      if (graph.containsKey(next)) {
        dfs(next);
      }
    }
    stack.remove(node);
    return false;
  }

  for (final String node in graph.keys) {
    dfs(node);
  }
  return issues;
}

Iterable<File> _dartFiles(Directory packageRoot) sync* {
  if (!packageRoot.existsSync()) {
    return;
  }
  final Directory libDir = Directory('${packageRoot.path}/lib');
  if (!libDir.existsSync()) {
    return;
  }
  for (final FileSystemEntity entity in libDir.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) {
      continue;
    }
    yield entity;
  }
}

bool _shouldSkipPath(String path) {
  return path.contains('/.dart_tool/') ||
      path.contains('/build/') ||
      path.contains('.freezed.dart') ||
      path.contains('.gr.dart') ||
      path.contains('.config.dart') ||
      path.contains('.module.dart');
}

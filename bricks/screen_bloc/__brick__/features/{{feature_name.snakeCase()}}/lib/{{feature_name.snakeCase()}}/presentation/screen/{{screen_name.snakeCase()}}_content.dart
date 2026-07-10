import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}/presentation/bloc/{{screen_name.snakeCase()}}_bloc.dart';

class {{screen_name.pascalCase()}}Content extends StatelessWidget {
  const {{screen_name.pascalCase()}}Content({
    super.key,
    required this.isLoading,
    required this.error,
  });

  final bool isLoading;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final {{screen_name.pascalCase()}}Bloc bloc = context.read<{{screen_name.pascalCase()}}Bloc>();

    return AppScaffold(
      isLoading: isLoading,
      errorText: error,
      onRefresh: () => bloc.add(const {{screen_name.pascalCase()}}Event.refreshRequested()),
      body: const Center(
        child: Text('{{screen_name.pascalCase()}}'),
      ),
    );
  }
}

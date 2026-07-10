import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}/presentation/bloc/{{screen_name.snakeCase()}}_bloc.dart';
import 'package:{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}/presentation/screen/{{screen_name.snakeCase()}}_content.dart';
import 'package:navigation_api/navigation_api.dart';

@RoutePage()
class {{screen_name.pascalCase()}}Screen extends StatelessWidget {
  const {{screen_name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return BlocProvider<{{screen_name.pascalCase()}}Bloc>(
      create: (_) => appLocator<{{screen_name.pascalCase()}}Bloc>(),
      child: BlocConsumer<{{screen_name.pascalCase()}}Bloc, {{screen_name.pascalCase()}}State>(
        listenWhen: ({{screen_name.pascalCase()}}State previous, {{screen_name.pascalCase()}}State current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, {{screen_name.pascalCase()}}State state) {
          final {{screen_name.pascalCase()}}Effect? effect = state.effect;
          if (effect == null) return;

          effect.when(navigateBack: navigator.navigateBack);

          context.read<{{screen_name.pascalCase()}}Bloc>().add(const {{screen_name.pascalCase()}}Event.effectHandled());
        },
        builder: (BuildContext context, {{screen_name.pascalCase()}}State state) => {{screen_name.pascalCase()}}Content(
          isLoading: state.isLoading,
          error: state.error,
        ),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home/bloc/home_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.isLoading,
    required this.error,
  });

  final bool isLoading;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = context.read<HomeBloc>();

    return AppScaffold(
      isLoading: isLoading,
      errorText: error,
      onRefresh: () => bloc.add(const HomeEvent.refreshRequested()),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}

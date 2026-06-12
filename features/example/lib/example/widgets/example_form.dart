import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class ExampleForm extends StatelessWidget {
  final VoidCallback onNavigate;

  const ExampleForm({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onNavigate,
        child: Text(localization.example_action_navigateExample_title),
      ),
    );
  }
}

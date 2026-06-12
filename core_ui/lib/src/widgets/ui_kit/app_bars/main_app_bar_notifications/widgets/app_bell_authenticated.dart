import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

class AppBellAuthenticated extends StatelessWidget {
  const AppBellAuthenticated({super.key, this.unreadIndicator});

  final UnreadIndicator? unreadIndicator;

  @override
  Widget build(BuildContext context) {
    final AppIcon icon = unreadIndicator?.hasUnread ?? false
        ? AppIcons.appBarBellNotification
        : AppIcons.appBarBell;

    return SizedBox.square(
      dimension: 40,
      child: Center(
        child: icon.call(size: 40, onTap: () => appLocator<AppRouter>().navigateNotifications()),
      ),
    );
  }
}

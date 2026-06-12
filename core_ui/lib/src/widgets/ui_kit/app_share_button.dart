import 'package:core_ui/core_ui.dart';
import 'package:share_plus/share_plus.dart';

class AppShareButton extends StatelessWidget {
  const AppShareButton({super.key, required this.titleButton, this.textShare, this.titleShare});

  final String titleButton;
  final String? textShare;
  final String? titleShare;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      title: titleButton,
      onTap: () => SharePlus.instance.share(ShareParams(text: '$titleShare')),
    );
  }
}

part of 'extensions.dart';

extension AppToastContextExtension on BuildContext {
  AppToastMessenger get appToast => appLocator<AppToastMessenger>();

  void showErrorToast([String? message]) => appToast.showError(message);

  void showSuccessToast([String? message]) => appToast.showSuccess(message);

  void showWarningToast([String? message]) => appToast.showWarning(message);

  void showInfoToast([String? message]) => appToast.showInfo(message);
}

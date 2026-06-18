part of 'theme.dart';

abstract final class AppIcons {
  static const String _basePath = kIconsPath;
  static const String _appBarPath = '${kIconsPath}app_bar/';

  static const String _googleKey = '${_basePath}google.svg';
  static const AppIcon google = AppIcon.asset(_googleKey);

  static const String _appleKey = '${_basePath}apple.svg';
  static const AppIcon apple = AppIcon.asset(_appleKey);

  static const String _appBarChevronLeftKey = '${_appBarPath}chevron_left.svg';
  static const AppIcon appBarChevronLeft = AppIcon.asset(_appBarChevronLeftKey);

  static const String _appBarLogoKey = '${_appBarPath}logo.svg';
  static const AppIcon appBarLogo = AppIcon.asset(_appBarLogoKey);

  static const String _crossKey = '${_basePath}cross.svg';
  static const AppIcon cross = AppIcon.asset(_crossKey);

  static const String _searchKey = '${_basePath}search.svg';
  static const AppIcon search = AppIcon.asset(_searchKey);

  static const String _calendarKey = '${_basePath}calendar.svg';
  static const AppIcon calendar = AppIcon.asset(_calendarKey);

  static const String _checkedKey = '${_basePath}checked.svg';
  static const AppIcon checked = AppIcon.asset(_checkedKey);

  static const String _minusKey = '${_basePath}minus.svg';
  static const AppIcon minus = AppIcon.asset(_minusKey);

  static const String _plusKey = '${_basePath}plus.svg';
  static const AppIcon plus = AppIcon.asset(_plusKey);

  static const String _toastErrorKey = '${_basePath}toast_error.svg';
  static const AppIcon toastError = AppIcon.asset(_toastErrorKey);

  static const String _toastInfoKey = '${_basePath}toast_info.svg';
  static const AppIcon toastInfo = AppIcon.asset(_toastInfoKey);

  static const String _toastSuccessKey = '${_basePath}toast_success.svg';
  static const AppIcon toastSuccess = AppIcon.asset(_toastSuccessKey);

  static const String _toastWarningKey = '${_basePath}toast_warning.svg';
  static const AppIcon toastWarning = AppIcon.asset(_toastWarningKey);

  static const String _twNeutralFlagKey = '${_basePath}tw_neutral_flag.svg';
  static const AppIcon twNeutralFlag = AppIcon.asset(_twNeutralFlagKey);

  static const String _columnKey = '${_basePath}column.svg';
  static const AppIcon column = AppIcon.asset(_columnKey);

  static const String _confirmKey = '${_basePath}confirm.svg';
  static const AppIcon confirm = AppIcon.asset(_confirmKey);

  static const String _connectedKey = '${_basePath}connected.svg';
  static const AppIcon connected = AppIcon.asset(_connectedKey);

  static const String _declineKey = '${_basePath}decline.svg';
  static const AppIcon decline = AppIcon.asset(_declineKey);

  static const String _disconnectedKey = '${_basePath}disconnected.svg';
  static const AppIcon disconnected = AppIcon.asset(_disconnectedKey);

  static const String _gridKey = '${_basePath}grid.svg';
  static const AppIcon grid = AppIcon.asset(_gridKey);

  static const String _hostKey = '${_basePath}host.svg';
  static const AppIcon host = AppIcon.asset(_hostKey);

  static const String _moreKey = '${_basePath}more.svg';
  static const AppIcon more = AppIcon.asset(_moreKey);

  static const String _more2Key = '${_basePath}more_2.svg';
  static const AppIcon more2 = AppIcon.asset(_more2Key);

  static const String _editKey = '${_basePath}edit.svg';
  static const AppIcon edit = AppIcon.asset(_editKey);

  static const String _personKey = '${_basePath}person.svg';
  static const AppIcon person = AppIcon.asset(_personKey);

  static const String _qrScanKey = '${_basePath}qr_scan.svg';
  static const AppIcon qrScan = AppIcon.asset(_qrScanKey);

  static const String _seekKey = '${_basePath}seek.svg';
  static const AppIcon seek = AppIcon.asset(_seekKey);

  static const String _settingsKey = '${_basePath}settings.svg';
  static const AppIcon settings = AppIcon.asset(_settingsKey);

  static const String _btControllerDisabledKey = '${_basePath}bt_controller_disabled.svg';
  static const AppIcon btControllerDisabled = AppIcon.asset(_btControllerDisabledKey);

  static const String _btControllerEnabledKey = '${_basePath}bt_controller_enabled.svg';
  static const AppIcon btControllerEnabled = AppIcon.asset(_btControllerEnabledKey);

  static const String _btPermissionDeniedKey = '${_basePath}bt_permission_denied.svg';
  static const AppIcon btPermissionDenied = AppIcon.asset(_btPermissionDeniedKey);

  static const String _btPermissionGrantedKey = '${_basePath}bt_permission_granted.svg';
  static const AppIcon btPermissionGranted = AppIcon.asset(_btPermissionGrantedKey);
}

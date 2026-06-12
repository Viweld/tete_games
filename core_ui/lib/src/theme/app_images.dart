part of 'theme.dart';

abstract final class AppImages {
  static const String _basePath = kImagesPath;

  static const String _appLogoKey = '${_basePath}app_icon.png';
  static const AppImage appLogo = AppImage(_appLogoKey);

  static const String _mainPlugKey = '${_basePath}main_plug.png';
  static const AppImage mainPlug = AppImage(_mainPlugKey);
}

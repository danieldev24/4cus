part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const SETTINGS = _Paths.SETTINGS;
  static const WELCOME = _Paths.WELCOME;
  static const ONBOARD = _Paths.ONBOARD;
}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH_SCREEN = '/splash-screen';
  static const SETTINGS = '/settings';
  static const WELCOME = '/welcome';
  static const ONBOARD = '/onboard';
}
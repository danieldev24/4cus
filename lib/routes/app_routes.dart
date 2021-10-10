part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const SETTINGS = _Paths.SETTINGS;
  static const WELCOME = _Paths.WELCOME;
  static const ONBOARD = _Paths.ONBOARD;
  static const TASK_DETAILS = _Paths.TASK_DETAILS;
  static const DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH_SCREEN = '/splash-screen';
  static const SETTINGS = '/settings';
  static const DASHBOARD = '/dashboard';
  static const WELCOME = '/welcome';
  static const ONBOARD = '/onboard';
  static const TASK_DETAILS = "/task-details";
}
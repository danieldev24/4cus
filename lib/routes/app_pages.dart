import 'package:focus/presentation/ui/home/home_view.dart';
import 'package:focus/presentation/ui/onboard/onboard_binding.dart';
import 'package:focus/presentation/ui/splash/splash_screen_binding.dart';
import 'package:focus/presentation/ui/splash/splash_screen_view.dart';
import 'package:focus/presentation/ui/onboard/onboard_view.dart';
import 'package:focus/presentation/ui/welcome/welcome_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH_SCREEN,
        page: () => SplashScreenView(),
        binding: SplashScreenBinding()),

    GetPage(
        name: _Paths.ONBOARD,
        page: () => OnBoardView(),
        binding: OnboardBinding()),

    GetPage(name: _Paths.WELCOME, page:() => WelcomeView())
  ];
}

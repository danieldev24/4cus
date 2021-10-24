import 'package:focus/presentation/ui/home/home_binding.dart';
import 'package:focus/presentation/ui/home/home_view.dart';
import 'package:focus/presentation/ui/onboard/onboard_binding.dart';
import 'package:focus/presentation/ui/splash/splash_screen_binding.dart';
import 'package:focus/presentation/ui/splash/splash_screen_view.dart';
import 'package:focus/presentation/ui/onboard/onboard_view.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_binding.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_views.dart';
import 'package:focus/presentation/ui/task/task_details/task_detail_binding.dart';
import 'package:focus/presentation/ui/task/task_details/task_detail_view.dart';
import 'package:focus/presentation/ui/welcome/welcome_binding.dart';
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
    GetPage(
        name: _Paths.WELCOME,
        page: () => WelcomeView(),
        binding: WelcomeBinding()),
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding()),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashBoardView(),
      binding: DashBoardBinding(),
    ),
    GetPage(
        name: _Paths.TASK_DETAILS,
        page: () => TaskDetailView(),
        binding: TaskDetailBinding())
  ];
}

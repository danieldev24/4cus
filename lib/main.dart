import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/ui/home/home_binding.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_binding.dart';
import 'package:focus/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  MySize().init();
  DashBoardBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
        title: '4cus',
        theme: appThemeData[AppTheme.YellowLight],
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
    );
  }
}

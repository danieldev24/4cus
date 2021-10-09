import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_views.dart';
import 'package:focus/presentation/ui/welcome/welcome_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  setCurrentIndex(index) {
    this.currentIndex = index;
    update();
  }

  final userData = GetStorage();

  final List<Widget> homeViews = [DashBoardView(), WelcomeView()];

  Widget navBarSwitcher() {
    return homeViews.elementAt(currentIndex);
  }

  @override
  void onInit() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    super.onInit();
  }
}

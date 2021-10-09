import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/global_widgets/bottom_navigation.dart';
import 'package:focus/presentation/ui/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: controller.navBarSwitcher(),
            bottomNavigationBar: SoftBottomNavigation(controller: controller,),
          );
        });
  }
}

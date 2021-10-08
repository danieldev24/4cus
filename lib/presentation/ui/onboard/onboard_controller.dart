import 'package:flutter/cupertino.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardController extends GetxController{
  final userData = GetStorage();
  int currentIndex = 0;
  PageController pageController = PageController();

  changeIndex(index){
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    userData.write(Constant.IS_FIRST_TIME_KEY, false);
    super.onInit();
  }

  @override
  void onClose() async{
    pageController.dispose();
    super.onClose();
  }
  @override
  void onReady() async{
    super.onReady();
  }
}
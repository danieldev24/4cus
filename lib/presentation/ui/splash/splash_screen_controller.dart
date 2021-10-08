import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  final userData = GetStorage();

  late bool _isFirstTimeLaunch;
  late bool _isRegister;

  /*_setTheme() {
    var control = Get.put(SettingsController());
    int n = control.themes.indexOf(userData.read('theme'));
    Get.changeTheme(appThemeData.values.elementAt(n));
  }*/

  _checkFirstTimeLaunch() {
    _isFirstTimeLaunch = userData.read(Constant.IS_FIRST_TIME_KEY) ;
  }

  _checkIsRegister(){
    _isRegister = userData.read(Constant.IS_REGISTER);
  }

  @override
  void onInit() {
    super.onInit();
    userData.writeIfNull(Constant.IS_FIRST_TIME_KEY, true);
    userData.writeIfNull(Constant.IS_REGISTER, false);
    userData.writeIfNull(Constant.DRINK_WATER, false);
    userData.writeIfNull(Constant.THEME, "Yellow Light");

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.forward();
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    _checkFirstTimeLaunch();
    _checkIsRegister();

    Timer(
      Duration(milliseconds: 3300),
        () =>{
            if(_isFirstTimeLaunch){
              Get.offNamed(Routes.ONBOARD)
            }else if(_isRegister){
              Get.offNamed(Routes.HOME)
            }else if(!_isRegister){
              Get.offNamed(Routes.WELCOME)
            }
        }
    );
  }

  @override
  void onReady() async{
    super.onReady();
  }

  @override
  void onClose() async{
    super.onClose();
    animationController.dispose();
  }
}

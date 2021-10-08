import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/assets_path.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:focus/presentation/ui/splash/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GetBuilder<SplashScreenController>(
          init: SplashScreenController(),
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset(Assets.lottiePath + "/study.json",
                      controller: _.animationController,
                      frameRate: FrameRate(60),
                      repeat: true, onLoaded: (composition) {
                    _.animationController..duration = composition.duration;
                  }),
                ),
                SizedBox(height: 50.0),
                Text(
                  "4cus",
                  style: kHeadTextStyle.copyWith(color: primaryGrey),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

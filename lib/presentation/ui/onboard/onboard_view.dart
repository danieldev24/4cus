import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/onboard_content_model.dart';
import 'package:focus/presentation/ui/onboard/onboard_controller.dart';
import 'package:focus/presentation/ui/onboard/widget/app_bar_widget.dart';
import 'package:focus/presentation/ui/onboard/widget/progress_button.dart';
import 'package:focus/routes/app_pages.dart';
import 'package:focus/presentation/ui/onboard/widget/silde_widget.dart';
import 'package:get/get.dart';

class OnBoardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<OnboardController>(
        init: OnboardController(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: OnBoardingAppBar(
                  currentIndex: controller.currentIndex,
                  onPrevious: () {
                    if (controller.currentIndex > 0) {
                      controller.pageController.animateToPage(
                          controller.currentIndex - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  },
                  onSkip: () {
                    if (controller.currentIndex < contents.length) {
                      controller.pageController.animateToPage(contents.length,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    }
                  },
                ),
                flex: 2,
              ),
              Expanded(
                flex: 6,
                child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.changeIndex(index);
                    },
                    itemCount: contents.length,
                    itemBuilder: (context, index) => MySlide(
                        image: contents[index].image,
                        title: contents[index].title,
                        subtitle: contents[index].content)),
              ),
              Expanded(
                  flex: 2,
                  child: ProgressButton(
                      onNext: () {
                        if (controller.currentIndex < contents.length) {
                          controller.pageController.animateToPage(
                              controller.currentIndex + 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
                      },
                      onStart: () {
                        Get.offAllNamed(Routes.WELCOME);
                      },
                      initialPage: controller.currentIndex,
                      list: contents))
            ],
          );
        },
      ),
    );
  }
}

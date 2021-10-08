import 'package:focus/presentation/ui/onboard/onboard_controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
  }

}
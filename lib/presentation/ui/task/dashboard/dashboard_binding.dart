import 'package:focus/presentation/ui/task/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }

}
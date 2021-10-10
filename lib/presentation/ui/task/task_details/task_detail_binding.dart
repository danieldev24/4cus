import 'package:focus/presentation/ui/task/task_details/task_detail_controller.dart';
import 'package:get/get.dart';

class TaskDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TaskDetailController>(() => TaskDetailController());
  }

}
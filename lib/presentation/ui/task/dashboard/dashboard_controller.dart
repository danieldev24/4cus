import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/data/models/project_model.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DashBoardController extends GetxController {
  String username = "";

  // instance of Get Storage
  final userData = GetStorage();
  TextEditingController titleController = TextEditingController();
  IconData selectedIcon = Icons.alarm;
  int selectionColor = 0;
  int taskIds = 0;
  DateTime selectedDate = DateTime.now();
  List<Project> allTasks = [];
  List<IconData> icons = [
    Icons.alarm,
    Icons.free_breakfast,
    Icons.lunch_dining,
    Icons.event_note_outlined,
    Icons.settings,
    Icons.book_online,
    Icons.sports_basketball_rounded,
    Icons.shopping_cart,
    Icons.celebration,
    Icons.travel_explore
  ];

  List<Color> colors = [primaryYellow, primaryRed, primaryTeal, primaryGreen];

  changeDate(DateTime date) {
    selectedDate = date;
    update(["TaskTypeBottomSheet", true]);
  }

  changeIcon(IconData? newIcon) {
    selectedIcon = newIcon!;
    update(["TaskTypeBottomSheet", true]);
  }

  changeColor(int index) {
    selectionColor = index;
    update(["TaskTypeBottomSheet", true]);
  }

  controllerReset() {
    titleController.text = '';
    selectedDate = DateTime.now();
    selectedIcon = Icons.alarm;
    selectionColor = 0;
  }

  getUser() {
    username = userData.read(Constant.USER_NAME);
    update([7, true]);
  }

  Future<List<Project>> getTasks() async {
    var box = await Hive.openBox(Constant.TASK_TYPE_BOX);
    List<Project> taskList = [];
    for (int i = 0; i < box.length; i++) {
      var taskMap = box.getAt(i).map((k, e) => MapEntry(k.toString(), e));
      Project tmp = Project();
      tmp.title = taskMap['title'];
      tmp.tasks = taskMap['tasks'];
      tmp.deadline = taskMap['deadline'];
      taskList.add(tmp);
    }
    return taskList;
  }

  addTask() async {
    var tempTask = Project();
    var box = await Hive.openBox(Constant.TASK_TYPE_BOX);
    tempTask.title = titleController.text;
    tempTask.tasks = [];
    tempTask.deadline = selectedDate.toString();
    allTasks.add(tempTask);
    Map<String, dynamic> taskMap = tempTask.toJson();
    int idOfTask = await box.add(taskMap);
    taskIds = idOfTask;
    Hive.close();
    controllerReset();
    update([1, true]);
    Get.back();
  }

  @override
  Future<void> onInit() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    allTasks = await getTasks();
    update([1, true]);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
  }
}

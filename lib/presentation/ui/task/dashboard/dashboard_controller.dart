import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/data/models/task_type_model.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  Color selectionColor = primaryYellow10;
  DateTime selectedDate = DateTime.now();
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

  List<Color> colors = [

  ];

  changeDate(DateTime date){
    selectedDate = date;
    update(["TaskTypeBottomSheet",true]);
  }

  changeIcon(IconData? newIcon) {
    selectedIcon = newIcon!;
    update(["TaskTypeBottomSheet",true]);
  }

  getUser() {
    username = userData.read(Constant.USER_NAME);
    update([7, true]);
  }

  Future<List<TaskType>> getTasks() async {
    var box = await Hive.openBox(Constant.TASK_TYPE_BOX);
    List<TaskType> taskList = [];
    for (int i = 0; i < box.length; i++) {
      var taskMap = box.getAt(i).map((k, e) => MapEntry(k.toString(), e));
      taskList.add(TaskType.fromJson(taskMap));
    }
    return taskList;
  }

  @override
  Future<void> onInit() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    super.onInit();
  }
}
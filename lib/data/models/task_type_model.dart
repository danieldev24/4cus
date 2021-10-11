import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/task_model.dart';
import 'package:focus/presentation/theme/colors_theme.dart';

class TaskType {
  IconData? icon;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  int? done;
  List<Task>? desc;
  int? left;
  bool? isLast;

  TaskType(
      {this.icon,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.done,
      this.desc,
      this.left,
      this.isLast = false});

  TaskType.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        title = json['title'],
        bgColor = json['bgColor'],
        iconColor = json['iconColor'],
        btnColor = json['btnColor'],
        done = json['done'],
        desc = json['desc'],
        left = json['left'],
        isLast = json['isLast'];

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'title': title,
        'bgColor': bgColor,
        'iconColor': iconColor,
        'btnColor': btnColor,
        'done': done,
        'desc': desc,
        'left': left,
        'isLast': isLast,
      };

  static List<TaskType> fakeData() {
    return [
      TaskType(
          icon: Icons.person_rounded,
          title: "Personal",
          bgColor: primaryYellow.withOpacity(0.1),
          btnColor: primaryYellow.withOpacity(0.2),
          iconColor: primaryYellow.withOpacity(0.5),
          left: 3,
          done: 1,
          desc: [
            Task(
                taskTitle: "Go for a walk with dog",
                startTime: "14:00 PM",
                endTime: "15:00 PM",
                bgTask: primaryTeal.withOpacity(0.2)),
            Task(
                taskTitle: "Go for a walk with dog",
                startTime: "9:00 AM",
                endTime: "10:00 AM",
                bgTask: primaryYellow.withOpacity(0.2)),
            Task(
                taskTitle: "Go for a walk with dog",
                startTime: "11:00 AM",
                endTime: "12:00 AM",
                bgTask: primaryRed.withOpacity(0.2)),
            Task(
                taskTitle: "Go for a walk with dog",
                startTime: "14:00 PM",
                endTime: "15:00 PM",
                bgTask: primaryTeal.withOpacity(0.2))

          ]),
      TaskType(
        icon: Icons.person_rounded,
        title: "Work",
        bgColor: primaryRed.withOpacity(0.1),
        btnColor: primaryRed.withOpacity(0.2),
        iconColor: primaryRed.withOpacity(0.5),
        left: 3,
        done: 1,
      ),
      TaskType(
        icon: Icons.person_rounded,
        title: "Health",
        bgColor: primaryTeal.withOpacity(0.1),
        btnColor: primaryTeal.withOpacity(0.2),
        iconColor: primaryTeal.withOpacity(0.5),
        left: 3,
        done: 1,
      ),
      TaskType(isLast: true)
    ];
  }
}

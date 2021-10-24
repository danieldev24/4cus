import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/task_model.dart';
import 'package:focus/presentation/theme/colors_theme.dart';

class Project {
  String? title;
  List<dynamic>? tasks;
  String? deadline;

  Project(
      {
      this.title,
      this.tasks,
      this.deadline});

  Project.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        tasks = json['tasks'],
        deadline = json['deadline'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'tasks': tasks,
        'deadline' : deadline
      };

  static List<Project> fakeData() {
    return [
      Project(
          title: "Personal",
          tasks: [
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
      Project(
        title: "Work",
      ),
      Project(
        title: "Health",
      )
    ];
  }
}

import 'dart:ui';

class Task {
  Color? bgTask;
  String? taskTitle;
  String? taskDesc;
  String? startTime;
  String? endTime;
  DateTime? taskDate;
  bool? isRepeat;

  Task({
    this.bgTask,
    this.taskTitle,
    this.taskDesc,
    this.startTime,
    this.taskDate,
    this.endTime,
    this.isRepeat,
  });

  Task.fromJson(Map<String, dynamic> json)
      : bgTask = json['bgTask'],
        taskTitle = json['taskTitle'],
        taskDesc = json['taskDesc'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        taskDate = json['taskDate'],
        isRepeat = json['isRepeat'];

  Map<String, dynamic> toJson() => {
        'bgTask': bgTask,
        'taskTitle': taskTitle,
        'taskDesc': taskDesc,
        'startTime': startTime,
        'endTime': endTime,
        'taskDate': taskDate,
        'isRepeat': isRepeat,
      };
}

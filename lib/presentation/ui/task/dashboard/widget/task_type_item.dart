import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/project_model.dart';

import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/typo.dart';

class TasksItems extends StatelessWidget {
  final List<Project> taskType;
  final Function(Project _task)? onClickItem;
  final Function()? onAdd;

  const TasksItems({Key? key, required this.taskType, this.onClickItem, this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: taskType.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) => _buildTask(context, taskType[index]));
  }

  _buildTask(BuildContext context, Project taskType) {
    return GestureDetector(
      onTap:() => onClickItem!(taskType),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                taskType.title!,
                style: kTitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTaskStatus(Color bgColor, Color txtColor, String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        status,
        style: TextStyle(color: txtColor),
      ),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20),boxShadow: softEmbedConfig),
    );
  }
}

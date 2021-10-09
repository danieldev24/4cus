import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/task_type_model.dart';
import 'package:focus/presentation/theme/typo.dart';

class TasksItems extends StatelessWidget {
  final List<TaskType> taskType;
  final Function()? onClickItem;
  final Function()? onAdd;

  const TasksItems({Key? key, required this.taskType, this.onClickItem, this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: taskType.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) => taskType[index].isLast!
            ? _buildAddTask()
            : _buildTask(context, taskType[index]));
  }

  _buildAddTask() {
    return GestureDetector(
      onTap: onAdd,
      child: DottedBorder(
        borderType: BorderType.RRect,
          radius: Radius.circular(20),
          dashPattern: [10,10],
          color: Colors.grey,
          strokeWidth: 2,
          child: Center(
            child: Text("+ Add",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),),
    );
  }

  _buildTask(BuildContext context, TaskType taskType) {
    return GestureDetector(
      onTap: onClickItem,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: taskType.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              taskType.icon,
              color: taskType.iconColor,
              size: 35,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              taskType.title!,
              style: kTitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStatus(taskType.btnColor!, taskType.iconColor!,
                    '${taskType.done} done'),
                SizedBox(
                  width: 5,
                ),
                _buildTaskStatus(
                    Colors.white, taskType.iconColor!, '${taskType.left} left')
              ],
            )
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
          color: bgColor, borderRadius: BorderRadius.circular(20)),
    );
  }
}

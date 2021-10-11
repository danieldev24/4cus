import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/task_type_model.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/ui/task/task_details/widget/date_picker.dart';
import 'package:focus/presentation/ui/task/task_details/widget/task_detail_persistant_delegate.dart';
import 'package:focus/presentation/ui/task/task_details/widget/task_timeline.dart';
import 'package:focus/presentation/ui/task/task_details/widget/task_title.dart';
import 'package:get/get.dart';

class TaskDetailView extends StatelessWidget {
  final TaskType? taskType;

  const TaskDetailView({this.taskType});

  @override
  Widget build(BuildContext context) {
    final detailList = taskType!.desc;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: DelegatePersistent(
              expandedHeight: 150,
              taskType: taskType!,
              rounded: 20,
          )),
          //_buildAppBar(context, taskType!),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [DateTimePicker(), TaskTitle()],
              ),
            ),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'No Task today',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (_, index) => TaskTimeLine(
                            detail: detailList[index],
                          ),
                      childCount: detailList.length),
                )
        ],
      ),
    );
  }

  _buildAppBar(BuildContext context, TaskType taskType) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 20,
          color: Colors.white,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskType.title!,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You have ${taskType.left} tasks left for today!',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

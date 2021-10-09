import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/ui/task/task_details/widget/date_picker.dart';
import 'package:focus/presentation/ui/task/task_details/widget/task_title.dart';
import 'package:get/get.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    DateTimePicker(),
                    TaskTitle()

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed:() => Get.back(),
        icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),
      ),
      actions: [
        Icon(Icons.more_vert,size: 20,color: Colors.white,)
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal Task',style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white),),
            SizedBox(height: 5,),
            Text('You have 3 tasks left for today!',style: TextStyle(
              fontSize: 12,
              color: Colors.grey
            ),)
          ],
        ),
      ),
    );
  }
}

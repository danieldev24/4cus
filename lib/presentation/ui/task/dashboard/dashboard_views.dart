import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/task_type_model.dart';
import 'package:focus/presentation/theme/assets_path.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:focus/presentation/ui/task/dashboard/widget/go_premium_widget.dart';
import 'package:focus/presentation/ui/task/dashboard/widget/task_type_item.dart';
import 'package:focus/presentation/ui/task/task_details/task_detail_view.dart';
import 'package:get/get.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppbar("Test"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Tasks",
                style:
                kTitle.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
              )),
          Expanded(child: TasksItems(taskType: TaskType.fakeData(),
          onClickItem: (){
            Get.to(TaskDetailView());
          },))
        ],
      ),
    );
  }

  _buildAppbar(String name) {
    return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
              Image.asset(Assets.baseImagesPath + 'onboarding_image_1.png'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Hi, $name!",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}

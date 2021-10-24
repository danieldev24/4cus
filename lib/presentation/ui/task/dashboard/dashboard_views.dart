import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus/data/models/project_model.dart';
import 'package:focus/global_widgets/glass_container.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/ui/task/dashboard/widget/add_task_type_bottom_sheet.dart';
import 'package:focus/presentation/theme/assets_path.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_controller.dart';
import 'package:focus/presentation/ui/task/dashboard/widget/dashboard_glass_appbar.dart';
import 'package:focus/presentation/ui/task/dashboard/widget/task_type_item.dart';
import 'package:focus/presentation/ui/task/task_details/task_detail_view.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DashBoardView extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      id: 1,
      builder: (controller) {
        return Scaffold(
          appBar: _buildAppbar(controller.username),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [primaryPurple, primaryBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: GlassmorphicContainer(
                    height: MySize.screenHeight,
                    borderRadius: 0.0,
                    border: 0.0,
                    linearGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.05)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff),
                        Color((0xFFFFFFFF)),
                      ],
                    ),
                    width: MySize.screenWidth,
                    blur: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MySize.screenHeight *.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Tasks",
                              style: kTitle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            )),
                        Expanded(
                          child: TasksItems(
                            taskType: Project.fakeData(),
                            onClickItem: (taskType) {
                              Get.to(TaskDetailView(taskType: taskType));
                            },
                            onAdd: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return TaskTypeBottomSheetContent(
                                        onSubmit: () {},
                                        buttonText: "Create Task Type");
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildAppbar(String name) {
    return AppBar(
      backgroundColor: Colors.white,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/project_model.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/ui/task/task_details/widget/task_title.dart';
import 'package:get/get.dart';

import 'date_picker.dart';

class DelegatePersistent extends SliverPersistentHeaderDelegate {
  final Project taskType;
  final double expandedHeight;
  final double rounded;

  DelegatePersistent(
      {required this.taskType,
      required this.expandedHeight,
      required this.rounded});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
            width: MySize.screenWidth,
            color: Colors.black,
            height: expandedHeight),
        AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskType.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: expandedHeight - rounded - shrinkOffset,
            child: Container(
              width: MySize.screenWidth,
              height: rounded,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            )),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/data/models/task_model.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Task detail;

  const TaskTimeLine({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeLine(detail.bgTask!),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detail.startTime!),
              _buildCard(detail.bgTask!, detail.taskTitle!, detail.startTime!,
                  detail.endTime!)
            ],
          ))
        ],
      ),
    );
  }

  _buildTimeLine(Color color) {
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
            indicatorXY: 0,
            width: 15,
            indicator: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: color)),
            )),
        afterLineStyle: LineStyle(thickness: 2, color: color),
      ),
    );
  }

  _buildCard(Color color, String title, String startTime, String endTime) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                startTime,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '-',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                endTime,
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

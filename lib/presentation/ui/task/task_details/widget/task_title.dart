import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Task",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 22
          ),),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Text('Time line',style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold
                ),),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          )
        ],
      ),
    );
  }
}

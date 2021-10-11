import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/app_themes.dart';

class GoPremium extends StatelessWidget {
  const GoPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.star_rate_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[800], shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Go Premium",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get unlimited access\nto all our features!",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(bottom: 15, right: 15, child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Icon(Icons.forward,color: Colors.white,),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/colors_theme.dart';

class OnBoardingAppBar extends StatelessWidget {
  final int currentIndex;
  final Function()? onPrevious;
  final Function()? onSkip;

  const OnBoardingAppBar(
      {Key? key, this.onPrevious, this.onSkip, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          currentIndex > 0
              ? GestureDetector(
                  onTap: onPrevious,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )
              : Container(),
          currentIndex != 3 ? TextButton(
            onPressed: onSkip,
            child: Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: primaryTeal,
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

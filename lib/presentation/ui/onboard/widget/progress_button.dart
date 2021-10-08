import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/onboard_content_model.dart';
import 'package:focus/global_widgets/button.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:focus/presentation/theme/size.dart';

class ProgressButton extends StatelessWidget {
  final Function()? onNext;
  final Function()? onStart;
  final int initialPage;
  final List<OnBoarding> list;

  const ProgressButton(
      {Key? key,
      required this.onNext,
      required this.initialPage,
      required this.list,
      this.onStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MySize.size80,
      height: MySize.size80,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: initialPage + 1 != list.length
          ? Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryYellow),
                      value: (initialPage + 1) / (list.length),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: onNext,
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: primaryYellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          : Stack(alignment: Alignment.center,children: [
              MyButton(
                label: "Get Started",
                onTap: onStart,
                bgColor: primaryYellow,
                height: 60,
                width: 180,
                radius: 20,
              ),
            ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/data/models/onboard_content_model.dart';
import 'package:focus/global_widgets/soft_button.dart';
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
      margin: EdgeInsets.symmetric(vertical: 12),
      child: initialPage + 1 != list.length
          ? Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(-3, -3),
                            color: Colors.white.withOpacity(.7)),
                        BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(.15))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryTeal),
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
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(-3, -3),
                              color: Colors.white.withOpacity(.7)),
                          BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(3, 3),
                              color: Colors.black.withOpacity(.15))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryTeal,
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
                bgColor: Colors.white,
                textColor: primaryTeal,
                height: 60,
                width: 180,
                radius: 20,
              ),
            ]),
    );
  }
}

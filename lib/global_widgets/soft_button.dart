import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/size.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color bgColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final double? height;

  const MyButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.bgColor,
      this.radius,
      this.width,
      this.height, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height:height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: softConfig,
            borderRadius: BorderRadius.circular(radius ?? 0), color: bgColor),
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.white,fontSize: MySize.getSizeHeight(16)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

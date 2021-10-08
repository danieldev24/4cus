import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/theme/typo.dart';

class MyTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color bgColor;

  const MyTextButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: kBodyText,
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
        ),
      ),
    );
  }
}

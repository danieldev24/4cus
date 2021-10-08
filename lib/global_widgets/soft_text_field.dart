import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final String?Function(String?)? validate;
  final Widget? widget;

  const MyInputField(
      {Key? key,
        required this.label,
        required this.hint,
        this.controller,
        this.widget, this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: kTitle),
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: widget == null
                ? EdgeInsets.only(left: 10, right: 10)
                : EdgeInsets.only(left: 10),
            height: 52,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                      spreadRadius: 1.0
                  ),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-3, -3),
                      blurRadius: 4.0,
                      spreadRadius: 1.0
                  )
                ],
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                      controller: controller,
                      style: kTitle,
                      validator: validate,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: kSubHeadTextStyle,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor, width: 0)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor, width: 0)),
                      ),
                    )),
                widget == null ? Container() : Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}

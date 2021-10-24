import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/app_themes.dart';
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
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  boxShadow: softConfig,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: widget == null ? false : true,
                        autofocus: false,
                        textCapitalization: TextCapitalization.sentences,
                        cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                        controller: controller,
                        style: kTitle,
                        validator: validate,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: kBodyText,
                          errorStyle: TextStyle(color: Colors.red),
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                  widget == null ? Container() : Container(child: widget)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

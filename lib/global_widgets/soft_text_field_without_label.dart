import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:get/get.dart';

class MyInputFieldWithoutLabel extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Color? hintTextColor;
  final Color? contentTextColor;
  final Color? textFieldColor;
  final double? width;
  final bool? isEnabled;
  final String?Function(String?)? validator;
  const MyInputFieldWithoutLabel({
    Key? key,
    required this.hint,
    this.controller,
    this.hintTextColor,
    this.contentTextColor,
    this.textFieldColor,
    this.width,
    this.isEnabled,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      decoration: BoxDecoration(
        color: textFieldColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: softEmbedConfig
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        enabled: isEnabled,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: kSub2HeadTextStyle.copyWith(
            color: contentTextColor ?? Color(0xff3a4750), fontSize: 16),
        cursorHeight: 18,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: kSub2HeadTextStyle.copyWith(
            fontSize: 16,
            color: hintTextColor ?? Color(0xff8E8E8E),
          ),
          errorStyle: TextStyle(color: Colors.red),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/global_widgets/soft_button.dart';
import 'package:focus/global_widgets/soft_text_field.dart';
import 'package:focus/global_widgets/soft_text_field_without_label.dart';
import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/theme/typo.dart';
import 'package:focus/presentation/ui/task/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskTypeBottomSheetContent extends GetView<DashBoardController> {
  final Function()? onSubmit;
  final String buttonText;

  const TaskTypeBottomSheetContent(
      {required this.onSubmit, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: Get.height * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Theme.of(context).primaryColorLight,
      ),
      child: GetBuilder(
          id: "TaskTypeBottomSheet",
          init: DashBoardController(),
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Choose your icon",
                      style: kTitle,
                    ),
                    SizedBox(
                      width: MySize.screenWidth * 0.1,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: softEmbedConfig),
                      child: DropdownButton(
                        iconSize: 0,
                        elevation: 2,
                        value: controller.selectedIcon,
                        underline: Container(color: Colors.transparent),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Icon(
                            controller.icons.first,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        items: controller.icons.map(
                          (IconData value) {
                            return DropdownMenuItem<IconData>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Container(
                                  width: 40,
                                  child: Icon(value,
                                      size: 40,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: controller.changeIcon,
                        dropdownColor: Theme.of(context).primaryColorLight,
                      ),
                    )
                  ],
                ),
                SizedBox(height: Get.height * 0.01),
                MyInputField(
                  hint: 'Enter your title',
                  label: 'Title',
                  controller: controller.titleController,
                ),
                SizedBox(height: Get.height * 0.01),
                _colorPalette(),
                SizedBox(height: Get.height * 0.03),
                Center(
                  child: MyButton(
                    width: MySize.screenWidth * 0.4,
                    height: MySize.screenHeight * 0.066,
                    label: buttonText,
                    radius: 20,
                    bgColor: Theme.of(context).primaryColor.withOpacity(0.9),
                    onTap: onSubmit,
                  ),
                ),
              ],
            );
          }),
    );
  }

  _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: kTitle),
        SizedBox(
          height: 8.0,
        ),
        Wrap(
          children: List<Widget>.generate(controller.colors.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.changeColor(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: softEmbedConfig
                  ),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: controller.colors[index],
                    child: controller.selectionColor == index
                        ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                        : Container(),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}

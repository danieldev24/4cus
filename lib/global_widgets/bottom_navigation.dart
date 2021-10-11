import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:focus/presentation/theme/app_themes.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/ui/home/home_controller.dart';

class SoftBottomNavigation extends StatelessWidget {
  final HomeController controller;
  const SoftBottomNavigation({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init();
    var displayWidth = MySize.screenWidth;
    List<IconData> listOfIcons = [
      Icons.home_rounded,
      Icons.favorite_rounded,
      Icons.settings_rounded,
      Icons.person_rounded,
    ];

    List<String> listOfStrings = [
      'Home',
      'Favorite',
      'Settings',
      'Account',
    ];
    return Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: softConfig,
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.setCurrentIndex(index);
              HapticFeedback.lightImpact();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == controller.currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == controller.currentIndex ? displayWidth * .12 : 0,
                      width: index == controller.currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: softEmbedConfig,
                      ),
                    ),
                  ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == controller.currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                            index == controller.currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == controller.currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == controller.currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                            index == controller.currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == controller.currentIndex
                                ? Theme.of(context).primaryColor
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

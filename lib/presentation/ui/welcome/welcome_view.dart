import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus/global_widgets/soft_button.dart';
import 'package:focus/global_widgets/soft_text_field.dart';
import 'package:focus/presentation/theme/colors_theme.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:focus/presentation/theme/typo.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    MySize().init();
    return Scaffold(
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        padding: EdgeInsets.only(
            top: MySize.getSizeHeight(50),
            left: MySize.getSizeWidth(15),
            right: MySize.getSizeWidth(15)),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Professionals\' life is a Mess',
              style: kHeadTextStyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: primaryDGrey,
              ),
            ),
            SizedBox(height: MySize.getSizeHeight(10)),
            Text(
              'Get Organized',
              style: kSub2HeadTextStyle.copyWith(
                color: primaryDGrey,
              ),
            ),
            SizedBox(height: MySize.getSizeHeight(20)),
            MyInputField(label: "Your name", hint: "Enter your name"),
            SizedBox(height: MySize.getSizeHeight(20)),
            Center(
              child: MyButton(label: "Confirm", onTap: (){

              }, bgColor: primaryTeal,width: 150,height: 40,radius: 20,),
            )

          ],
        ),
      ),
    );
  }
}

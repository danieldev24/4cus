import 'package:flutter/cupertino.dart';
import 'package:focus/presentation/theme/typo.dart';

class MySlide extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const MySlide(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Image.asset(image)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: kBodyText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

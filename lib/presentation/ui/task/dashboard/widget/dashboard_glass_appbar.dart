import 'dart:ui';

import 'package:flutter/material.dart';

class GlassAppBar extends StatefulWidget {
  //
  final double? height;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final double? blurStrengthX;
  final double? blurStrengthY;
  //constructor
  GlassAppBar({
    this.height,
    this.actions,
    this.blurStrengthX,
    this.blurStrengthY,
    this.color,
    this.leading,
    this.title,
  });
  //
  @override
  _GlassAppBarState createState() => _GlassAppBarState();
}

class _GlassAppBarState extends State<GlassAppBar> {
  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            // will be 10 by default if not provided
            sigmaX: widget.blurStrengthX ?? 10,
            sigmaY: widget.blurStrengthY ?? 10,
          ),
          child: Container(
            color: widget.color, //test
            alignment: Alignment.center,
            width: scrSize.width,
            height: widget.height ?? 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 56,
                  color: Colors.transparent,
                  child: widget.leading,
                ),
                Expanded(
                  child: widget.title ?? Container(),
                ),
                Row(
                  children: widget.actions ??
                      [
                        Container(
                          width: 50,
                        )
                      ],
                ),
              ],
            ),
          ),
        ),
      ), // to clip the container
    );
  }
}

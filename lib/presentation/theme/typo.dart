import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/size.dart';
import 'package:google_fonts/google_fonts.dart';

var kHeadTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    height: 1.2,
  ),
);
var kSubHeadTextStyle = GoogleFonts.raleway(
  textStyle: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.2,
  ),
);

var kSub2HeadTextStyle = GoogleFonts.raleway(
  textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.2,
  ),
);

final kTitle =GoogleFonts.raleway(
  textStyle: TextStyle(
    fontSize: MySize.size20,
    fontWeight: FontWeight.w600,
  )
);

final kBodyText =GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: MySize.size18,
      fontWeight: FontWeight.w600,
    )
);

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 0),
  blurRadius: 20,
  color: Colors.black26,
);

const kLightShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
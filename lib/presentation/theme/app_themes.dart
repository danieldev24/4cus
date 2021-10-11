import 'package:flutter/material.dart';
import 'package:focus/presentation/theme/colors_theme.dart';

enum AppTheme {
  YellowLight,
  YellowDark,
  RedLight,
  RedDark,
  TealLight,
  TealDark,
  GreenLight,
  GreenDark,
}

final softConfig = [
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
];

final softEmbedConfig = [
  BoxShadow(
    color: Colors.white.withOpacity(.7),
    offset: Offset(3, 3),
    blurRadius: 5,
  ),
  BoxShadow(
    color: Colors.black.withOpacity(.15),
    offset: Offset(-3, -3),
    blurRadius: 5,
  ),
];

final appThemeData = {
  AppTheme.YellowLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryYellow,
    scaffoldBackgroundColor: white1,
    primaryColorLight: Colors.grey[100],
    primaryColorDark: secondaryGrey,
    colorScheme: ColorScheme.light(
      primary: primaryYellow,
    ),
  ),
  AppTheme.YellowDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: secondaryYellow,
    scaffoldBackgroundColor: primaryGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryGrey,
    colorScheme: ColorScheme.dark(
      primary: secondaryYellow,
    ),
  ),
  AppTheme.RedLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryDBlue,
    colorScheme: ColorScheme.light(
      primary: primaryRed,
    ),
  ),
  AppTheme.RedDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: primaryDBlue,
    primaryColorDark: white2,
    primaryColorLight: secondaryDBlue,
    colorScheme: ColorScheme.dark(
      primary: primaryRed,
    ),
  ),
  AppTheme.TealLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryTeal,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryDGrey,
    colorScheme: ColorScheme.light(
      primary: primaryTeal,
    ),
  ),
  AppTheme.TealDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryTeal,
    scaffoldBackgroundColor: primaryDGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryDGrey,
    colorScheme: ColorScheme.dark(
      primary: primaryTeal,
    ),
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryBGrey,
    colorScheme: ColorScheme.light(
      primary: primaryGreen,
    ),
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: primaryBGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryBGrey,
    colorScheme: ColorScheme.dark(
      primary: primaryGreen,
    ),
  ),
};

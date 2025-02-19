import 'package:flutter/material.dart';

class MyTheme {
  static Color mainColor = const Color(0xff004182);
  static Color textColor = const Color(0xff06004F);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff000000);

  static ThemeData lightMode = ThemeData(
      textTheme: TextTheme(
    titleLarge:
        TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: whiteColor),
    titleMedium:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: whiteColor),
    titleSmall:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: whiteColor),
  ));
}

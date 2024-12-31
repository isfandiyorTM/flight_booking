import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color textBlack = Color(0xFF0A0A0A);
  static const Color textGray = Color(0xff808080);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF0064D2);
  static const Color bgLight = Color(0xFFF2F3F6);
  static const Color lightGray = Color(0xFFEAEAEA);
  static const Color borderColor = Color(0xFFE6E8E9);



  //Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9e9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

}

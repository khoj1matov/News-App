import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class MyTextStyleComp {
  static TextStyle myTextStyle({
    Color color = Colors.black,
    double fontSize = 14,
    FontWeight weight = FontWeight.w500,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
      );

  static get signUpTextFieldTitle => TextStyle(
        color: ColorConst.cFFFFFF,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
}

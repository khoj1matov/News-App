import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class ToBackButton {
  static IconButton toBackButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      icon: Icon(
        Icons.chevron_left_rounded,
        color: ColorConst.cFFFFFF,
        size: 35,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

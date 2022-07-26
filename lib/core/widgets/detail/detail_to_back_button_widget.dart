import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/widgets/toBackButton_widget.dart';

class DetailToBackButtonWidget {
  static Container detailToBackButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 25),
      child: ToBackButton.toBackButton(context, ColorConst.c000000),
      decoration: BoxDecoration(
        color: ColorConst.cF5F5F5_05,
        borderRadius: BorderRadius.circular(17),
      ),
    );
  }
}

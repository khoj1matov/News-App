import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/toBackButton_widget.dart';

class HotUpdatesWidget {
  static Row hotUpdates(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ToBackButton.toBackButton(context, ColorConst.c000000),
        Text(
          "Hot Updates",
          style: MyTextStyleComp.myTextStyle(
            color: ColorConst.cFF3A44,
            fontSize: 18,
            weight: FontWeight.w600,
          ),
        ),
        SizedBox(width: context.w * 0.1),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';

class DividerWidget {
  static Container divider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 1,
      width: context.w,
      color: ColorConst.cFFFFFF,
    );
  }
}

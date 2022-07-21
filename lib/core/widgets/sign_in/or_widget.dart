import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';

class OrWidget {
  static Padding or(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: ColorConst.cFFFFFF,
            width: context.w * 0.39,
            height: 2,
          ),
          Text("OR", style: MyTextStyleComp.signUpTextFieldTitle),
          Container(
            color: ColorConst.cFFFFFF,
            width: context.w * 0.39,
            height: 2,
          ),
        ],
      ),
    );
  }
}

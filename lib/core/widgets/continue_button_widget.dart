import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';

class ContinueButtonWidget {
  static Padding continueButton({
    required BuildContext context,
    required function,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConst.cFFFFFF,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          child: SizedBox(
            height: context.h * 0.07,
            width: context.w,
            child: Center(
              child: Text(
                title,
                style: MyTextStyleComp.myTextStyle(
                  color: ColorConst.cFF3A44,
                  fontSize: 25,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),
          onPressed: function),
    );
  }
}

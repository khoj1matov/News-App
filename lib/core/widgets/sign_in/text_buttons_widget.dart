import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class TextButtonsWidget {
  static Padding forgotPassword({required onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            ColorConst.cFF8086_1,
          ),
        ),
        child: Text(
          "Forgot Password?",
          style: MyTextStyleComp.myTextStyle(
            color: ColorConst.cFFE600,
            fontSize: 17,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  static Padding doNotHaveAccount({required onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            "Don't Have An Account? ",
            style: MyTextStyleComp.myTextStyle(
              color: ColorConst.cFFFFFF,
              fontSize: 17,
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                ColorConst.cFF8086_1,
              ),
            ),
            child: Text(
              "Sing Up",
              style: MyTextStyleComp.myTextStyle(
                color: ColorConst.cFFE600,
                fontSize: 17,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

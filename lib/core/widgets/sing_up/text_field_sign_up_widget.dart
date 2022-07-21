import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class TextFieldWidget {
  static Padding textField({
    required BuildContext context,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 20),
      child: TextFormField(
        style: MyTextStyleComp.signUpTextFieldTitle,
        controller: controller,
        cursorColor: ColorConst.cFFFFFF,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyleComp.myTextStyle(color: ColorConst.cFFFFFF),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ColorConst.cFFFFFF, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ColorConst.cFFFFFF, width: 2),
          ),
        ),
      ),
    );
  }

  static Padding textFieldPassword({
    required BuildContext context,
    required String hintText,
    required TextEditingController controller,
    required Widget suffixIcon,
    required bool obscureText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 20),
      child: TextFormField(
        obscureText: obscureText,
        style: MyTextStyleComp.signUpTextFieldTitle,
        controller: controller,
        cursorColor: ColorConst.cFFFFFF,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: MyTextStyleComp.myTextStyle(color: ColorConst.cFFFFFF),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ColorConst.cFFFFFF, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ColorConst.cFFFFFF, width: 2),
          ),
        ),
      ),
    );
  }
}

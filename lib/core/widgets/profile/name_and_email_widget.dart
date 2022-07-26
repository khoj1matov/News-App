import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';

class NameAndEmailWidget {
  static Container nameAndEmail(BuildContext context, {required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      width: context.w,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: ColorConst.cFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: MyTextStyleComp.signUpTextFieldTitle),
    );
  }
}

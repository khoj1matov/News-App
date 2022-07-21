import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/components/text_style_comp.dart';

class TextFieldTitleWidget {
  static Padding textFieldTitle({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(text, style: MyTextStyleComp.signUpTextFieldTitle),
    );
  }
}

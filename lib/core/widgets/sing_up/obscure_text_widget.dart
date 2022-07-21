import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/provider/sign_up/obscure_text_provider.dart';
import 'package:provider/provider.dart';


class ObscureTextWidget {
  static IconButton obscureText(BuildContext context) {
    return IconButton(
      icon: context.watch<ObscureTextProvider>().isChecked
          ? Icon(
              Icons.remove_red_eye,
              color: ColorConst.cFFFFFF,
              size: 25,
            )
          : Icon(
              Icons.remove_red_eye_outlined,
              color: ColorConst.cFFFFFF,
              size: 25,
            ),
      onPressed: () {
        context.read<ObscureTextProvider>().onChecked();
      },
    );
  }
}

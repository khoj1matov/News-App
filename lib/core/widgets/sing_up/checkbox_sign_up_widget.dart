import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:provider/provider.dart';

import '../../../provider/sign_up/check_box_provider.dart';


class CheckboxSignUpWidget {
  static Padding checkbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Checkbox(
        side: BorderSide(
          color: ColorConst.cFFFFFF,
          width: 2,
        ),
        activeColor: ColorConst.cFFFFFF,
        checkColor: ColorConst.cFF3A44,
        value: context.watch<CheckBoxProvider>().isChecked,
        onChanged: (v) {
          context.read<CheckBoxProvider>().onChecked(v!);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';

class BottomContainerWidget {
  static Container bottomContainer(BuildContext context, Article getData) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: context.h,
      width: context.w,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: context.h * 0.55,
        width: context.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: ColorConst.cFFFFFF,
        ),
        child: Column(
          children: [
            SizedBox(height: context.h * 0.1),
            _text(getData),
            const SizedBox(height: 20),
            _text(getData),
            const SizedBox(height: 20),
            _text(getData),
          ],
        ),
      ),
    );
  }

  static Text _text(Article getData) {
    return Text(
      getData.description ?? "Not Found",
      style: MyTextStyleComp.myTextStyle(
        color: ColorConst.c2E0505,
        fontSize: 16,
        weight: FontWeight.w900,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

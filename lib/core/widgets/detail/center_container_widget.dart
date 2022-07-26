import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';

class CenterContainerWidget {
  static Center centerContainer(BuildContext context, Article getData) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 80),
        padding: const EdgeInsets.all(20),
        height: context.h * 0.18,
        width: context.w * 0.83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: ColorConst.cF5F5F5_05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getData.publishedAt.toString().substring(0, 10),
              style: MyTextStyleComp.myTextStyle(
                color: ColorConst.c2E0505,
                fontSize: 12,
                weight: FontWeight.w600,
              ),
            ),
            Text(
              getData.title ?? "Not Found",
              style: MyTextStyleComp.myTextStyle(
                color: ColorConst.c2E0505,
                fontSize: 16,
                weight: FontWeight.w700,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Published by ${getData.author ?? "Not Found"}",
              style: MyTextStyleComp.myTextStyle(
                color: ColorConst.c2E0505,
                fontSize: 10,
                weight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

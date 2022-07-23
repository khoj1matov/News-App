import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class LatestNewsWidget {
  static Padding latestNews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest News",
            style: MyTextStyleComp.myTextStyle(
              color: ColorConst.c000000,
              fontSize: 18,
              weight: FontWeight.w700,
            ),
          ),
          TextButton(
            child: const Text("See All"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/provider/home/selected_index_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidget {
  static Padding categories(BuildContext context, List<String> categories) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 20,
      ),
      child: SizedBox(
        width: context.w,
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (_, index) => Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorConst.cFF3A44_1, ColorConst.cFF8086_1],
              ),
            ),
            child: InkWell(
              child: Text(
                categories[index],
                style: MyTextStyleComp.myTextStyle(
                  color: ColorConst.cFFFFFF,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
              ),
              onTap: () {
                context.read<SelectedIndexProvider>().onSelected(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

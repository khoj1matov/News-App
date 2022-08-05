import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/components/check_image_comp.dart';
import 'package:newsapp/core/components/launch_url_comp.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/provider/notification/expanded_provider.dart';
import 'package:provider/provider.dart';

class BuildResultsWidget {
  static SizedBox buildResult(BuildContext context, List<Article> data) {
    return SizedBox(
      height: context.h * 0.9114,
      width: context.w,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: context.h * 0.15,
                  width: context.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CheckImageComp.checkImage(data[index].urlToImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data[index].publishedAt.toString().substring(0, 10),
                  style: MyTextStyleComp.myTextStyle(
                    color: ColorConst.c2E0505,
                    fontSize: 13,
                    weight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  data[index].title!,
                  style: MyTextStyleComp.myTextStyle(
                    color: ColorConst.c121212,
                    fontSize: 15,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                ExpandableText(
                  data[index].description!,
                  expanded: context.watch<ExpandedProvider>().expanded,
                  expandText: "Read More",
                  onExpandedChanged: (value) {
                    context.read<ExpandedProvider>().onExpanded(value);
                    LaunchUrlComp.launcherUrl(Uri.parse(data[index].url!));
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Published by ${data[index].author}",
                  style: MyTextStyleComp.myTextStyle(
                    color: ColorConst.c2E0505,
                    fontSize: 12,
                    weight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

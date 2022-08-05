import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/components/check_image_comp.dart';
import 'package:newsapp/core/components/launch_url_comp.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/search/build_results_widget.dart';
import 'package:newsapp/core/widgets/toBackButton_widget.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/provider/notification/expanded_provider.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:provider/provider.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
          color: ColorConst.c000000,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return ToBackButton.toBackButton(context, ColorConst.c000000);
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: NewsService.getSearchDetail(query: query),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: ColorConst.cFFFFFF,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0XFF8E8CAC),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Error",
            ),
          );
        } else {
          var data = NewsService.results;
          print("${data.length}!!!!!!!!!!!!!!!!!!!!");
          return BuildResultsWidget.buildResult(context, data);
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: NewsService.getApple(),
      builder: (_, AsyncSnapshot<NewsModel> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: ColorConst.cFFFFFF,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0XFF8E8CAC),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Error",
            ),
          );
        } else {
          var data = snapshot.data!.articles!;
          return SizedBox(
            height: context.h * 0.9114,
            width: context.w,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: context.h * 0.15,
                        width: context.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CheckImageComp.checkImage(
                                data[index].urlToImage),
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
                          LaunchUrlComp.launcherUrl(
                              Uri.parse(data[index].url!));
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
      },
    );
  }
}

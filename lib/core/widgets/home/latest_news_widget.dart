import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/views/detail/detail_view.dart';

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

class LatestNewsChildWidget {
  static Padding latestNewsChild(BuildContext context, NewsModel data) {
    var getData = data.articles!;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        width: context.w,
        height: context.h * 0.32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getData.length,
          itemBuilder: (__, index) => InkWell(
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 5),
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              width: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getData[index].urlToImage!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "by ${getData[index].source!.name}",
                        style: MyTextStyleComp.myTextStyle(
                          color: ColorConst.cFFFFFF,
                          fontSize: 13,
                          weight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        getData[index].title!,
                        style: MyTextStyleComp.myTextStyle(
                          color: ColorConst.cFFFFFF,
                          fontSize: 18,
                          weight: FontWeight.w700,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    getData[index].description!,
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorConst.cFFFFFF,
                      fontSize: 12,
                      weight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(data: getData[index], index: index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

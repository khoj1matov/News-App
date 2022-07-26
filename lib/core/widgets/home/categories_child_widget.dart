import 'package:flutter/material.dart';
import 'package:newsapp/core/components/check_image_comp.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/views/detail/detail_view.dart';

class CategoriesChildWidget {
  static String img = "https://bitsofco.de/content/images/2018/12/broken-1.png";
  static SizedBox categoriesChild(BuildContext context, NewsModel data) {
    var getData = data.articles!;
    return SizedBox(
      height: context.h * 0.4069,
      width: context.w,
      child: ListView.builder(
        itemCount: getData.length,
        itemBuilder: (_, index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              height: context.h * 0.15,
              width: context.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CheckImageComp.checkImage(getData[index].urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getData[index].title!,
                      style: MyTextStyleComp.myTextStyle(
                        color: ColorConst.cFFFFFF,
                        fontSize: 15,
                        weight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.w * 0.4,
                          child: Text(
                            getData[index].source!.name!,
                            style: MyTextStyleComp.myTextStyle(
                              color: ColorConst.cFFFFFF,
                              fontSize: 12,
                              weight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          getData[index].publishedAt.toString(),
                          style: MyTextStyleComp.myTextStyle(
                            color: ColorConst.cFFFFFF,
                            fontSize: 12,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(
                    data: getData[index],
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

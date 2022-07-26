import 'package:flutter/material.dart';
import 'package:newsapp/core/components/check_image_comp.dart';
import 'package:newsapp/core/components/favorite_list_comp.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/views/detail/detail_view.dart';

class FavoriteCartView extends StatefulWidget {
  const FavoriteCartView({Key? key}) : super(key: key);

  @override
  State<FavoriteCartView> createState() => _FavoriteCartViewState();
}

class _FavoriteCartViewState extends State<FavoriteCartView> {
  @override
  Widget build(BuildContext context) {
    List<Article> data = FavoriteListComp.list;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: context.h,
          width: context.w,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              // List<Article> data = getData[index].articles!;
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  height: context.h * 0.15,
                  width: context.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CheckImageComp.checkImage(data[index].urlToImage),
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
                          data[index].title!,
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
                                data[index].source!.name!,
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
                              data[index].publishedAt.toString(),
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
                onLongPress: () {
                  setState(
                    () {
                      FavoriteListComp.remove(
                        data: data[index],
                      );
                    },
                  );
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(
                        data: FavoriteListComp.list[index],
                        index: index,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

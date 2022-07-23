import 'package:flutter/material.dart';
import 'package:newsapp/core/components/categories_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/home/latest_news_widget.dart';
import 'package:newsapp/core/widgets/home/search_widget.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/provider/home/selected_index_provider.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:provider/provider.dart';

class HomeCartView extends StatefulWidget {
  const HomeCartView({Key? key}) : super(key: key);

  @override
  State<HomeCartView> createState() => _HomeCartViewState();
}

class _HomeCartViewState extends State<HomeCartView> {
  Future<NewsModel>? getNewsLatest;
  Future<NewsModel>? getNewsCategory;

  Future<NewsModel> _getNewsLatest() async {
    return await NewsService.getApple();
  }

  Future<NewsModel> _getNewsCategories() async {
    return await CategoriesComp
        .future[context.watch<SelectedIndexProvider>().selectedIndex];
  }

  // Future<void> _updatePage() async {
  //   setState(() {
  //     getNews = _getNews();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getNewsLatest = _getNewsLatest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.cFFFFFF,
        body: Column(
          children: [
            HomeSearchWidget.search(context),
            LatestNewsWidget.latestNews(),
            FutureBuilder(
              future: getNewsLatest,
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
                    width: context.w,
                    height: context.h * 0.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (__, index) => Container(),
                      itemCount: data.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

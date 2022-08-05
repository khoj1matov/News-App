import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/widgets/home/categories_child_widget.dart';
import 'package:newsapp/core/widgets/home/categories_widget.dart';
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
  List future = [];

  final List<String> categories = [
    'Apple',
    'Tesla',
    'Top Business',
    'TechCrunch',
    'Wall Street Journal',
  ];

  @override
  void initState() {
    super.initState();
    future = [
      NewsService.getApple(),
      NewsService.getTesla(),
      NewsService.getBusiness(),
      NewsService.getTechCrunch(),
      NewsService.getWallStreet(),
    ];
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
                  return LatestNewsChildWidget.latestNewsChild(
                    context,
                    snapshot.data!,
                  );
                }
              },
            ),
            CategoriesWidget.categories(context, categories),
            FutureBuilder(
              future:
                  future[context.watch<SelectedIndexProvider>().selectedIndex],
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
                  return CategoriesChildWidget.categoriesChild(
                    context,
                    snapshot.data!,
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

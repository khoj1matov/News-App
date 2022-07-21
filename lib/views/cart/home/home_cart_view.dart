import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class HomeCartView extends StatefulWidget {
  const HomeCartView({Key? key}) : super(key: key);

  @override
  State<HomeCartView> createState() => _HomeCartViewState();
}

class _HomeCartViewState extends State<HomeCartView> {
  Future<NewsModel>? getNews;

  Future<NewsModel> _getNews() async {
    return await NewsService.getData();
  }

  Future<void> _updatePage() async {
    setState(() {
      getNews = _getNews();
    });
  }

  @override
  void initState() {
    super.initState();

    getNews = _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews,
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
            return _child(snapshot: snapshot.data!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: _updatePage,
      ),
    );
  }

  Widget _child({
    required NewsModel snapshot,
  }) {
    var data = snapshot.articles!;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text(data[index].source!.name!),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

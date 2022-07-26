import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/widgets/notification/hot_updates_widget.dart';
import 'package:newsapp/core/widgets/notification/notification_child_widget.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HotUpdatesWidget.hotUpdates(context),
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
                  return NotificationChildWidget.categoriesChild(
                    context,
                    snapshot.data!.articles!,
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

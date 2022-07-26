import 'package:newsapp/models/news_model.dart';

class FavoriteListComp {
  static List<Article> list = [];

  static void add({required Article data}) {
    list.add(data);
    print("ADD!!!!!!!!!!!");
  }

  static void remove({required Article data}) {
    list.remove(data);
    print("DELETE!!!!!!!!");
  }
}

import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier {
  bool favorite = false;

  onFavorite() {
    favorite = !favorite;
    notifyListeners();
  }
}

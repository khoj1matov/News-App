import 'package:flutter/cupertino.dart';

class SelectedIndexProvider extends ChangeNotifier {
  int selectedIndex = 0;

  onSelected(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

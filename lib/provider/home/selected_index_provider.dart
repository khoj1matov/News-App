import 'package:flutter/cupertino.dart';

class SelectedIndexProvider extends ChangeNotifier {
  int selectedIndex = 1;

  onSelected(int index) {
    selectedIndex = index;
    notifyListeners();
    print(selectedIndex);
  }
}

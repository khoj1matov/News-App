import 'package:flutter/foundation.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool isChecked = false;
  List<bool> checkContinue = [false, false, false, false, false];

  void onChecked(bool bool) {
    isChecked = bool;
    notifyListeners();
  }

  void onCheckContinue(bool bool, int index) {
    checkContinue[index] = bool;
    notifyListeners();
  }
}
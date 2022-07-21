import 'package:flutter/cupertino.dart';

class ObscureTextProvider extends ChangeNotifier {
  bool isChecked = true;

  void onChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }
}

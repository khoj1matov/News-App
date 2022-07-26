import 'package:flutter/cupertino.dart';

class ExpandedProvider extends ChangeNotifier {
  bool expanded = false;

  onExpanded(bool onExpanded) {
    expanded = onExpanded;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class CheckImageComp extends ChangeNotifier {
  static String img = "https://bitsofco.de/content/images/2018/12/broken-1.png";

  static ImageProvider checkImage(getImage) {
    if (getImage != null) {
      try {
        return NetworkImage(getImage);
      } catch (e) {
        return NetworkImage(img);
      }
    } else {
      return NetworkImage(img);
    }
  }
}

import 'package:flutter/material.dart';

class ToBackButton {
  static IconButton toBackButton(BuildContext context, Color color) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      icon: Icon(
        Icons.chevron_left_rounded,
        color: color,
        size: 35,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

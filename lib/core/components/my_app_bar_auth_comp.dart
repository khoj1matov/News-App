import 'package:flutter/material.dart';

class MyAppBarAuthComp {
  static AppBar myAppBarAuth(BuildContext context, titleText) {
    return AppBar(
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        titleText,
        // style: MyTextStyleComp.myTextStyle(
        //   fontSize: 18,
        //   weight: FontWeight.w500,
        // ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:newsapp/services/firebase_service.dart';
import 'package:provider/provider.dart';

class ListTileWidget {
  static ListTile listTile(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 27,
        backgroundColor: ColorConst.cFFFFFF,
      ),
      title: Text(
        "Welcome",
        style: MyTextStyleComp.myTextStyle(
          color: ColorConst.cFFE600,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        FireService.auth.currentUser!.displayName ??
            context.watch<SignUpProvider>().nameController.text,
        style: MyTextStyleComp.myTextStyle(
          color: ColorConst.cFFFFFF,
          fontSize: 20,
          weight: FontWeight.bold,
        ),
      ),
      trailing: CircleAvatar(
        backgroundColor: ColorConst.cFFFFFF,
        child: IconButton(
          icon: Icon(Icons.logout, color: ColorConst.cFF3A44),
          onPressed: () {
            context.read<SignUpProvider>().signOut(context);
          },
        ),
      ),
    );
  }
}

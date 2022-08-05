import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/continue_button_widget.dart';
import 'package:newsapp/core/widgets/profile/divider_widget.dart';
import 'package:newsapp/core/widgets/profile/list_tile_widget.dart';
import 'package:newsapp/core/widgets/profile/name_and_email_widget.dart';
import 'package:newsapp/core/widgets/sign_in/text_buttons_widget.dart';
import 'package:newsapp/core/widgets/sing_up/text_field_title_sign_up_widget.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:newsapp/services/firebase_service.dart';
import 'package:provider/provider.dart';

class ProfileCartView extends StatelessWidget {
  const ProfileCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: context.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorConst.cFF8086_1, ColorConst.cFF3A44_1],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ListTileWidget.listTile(context),
              DividerWidget.divider(context),
              const SizedBox(height: 15),
              TextFieldTitleWidget.textFieldTitle(text: "Name"),
              NameAndEmailWidget.nameAndEmail(
                context,
                text: FireService.auth.currentUser!.displayName ?? "Not Found",
              ),
              const SizedBox(height: 20),
              TextFieldTitleWidget.textFieldTitle(text: "Email"),
              NameAndEmailWidget.nameAndEmail(
                context,
                text: FireService.auth.currentUser!.email ?? "Not Found",
              ),
              TextButtonsWidget.forgotPassword(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
              ),
              const SizedBox(height: 20),
              ContinueButtonWidget.continueButton(
                context: context,
                title: "Delete Account",
                function: () {
                  context.read<FirebaseProvider>().deleteAccount(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

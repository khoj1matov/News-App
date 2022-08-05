import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/continue_button_widget.dart';
import 'package:newsapp/core/widgets/sing_up/text_field_sign_up_widget.dart';
import 'package:newsapp/core/widgets/sing_up/text_field_title_sign_up_widget.dart';
import 'package:newsapp/core/widgets/toBackButton_widget.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordAuthView extends StatelessWidget {
  const ForgotPasswordAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cFF3A44,
      body: SingleChildScrollView(
        child: Container(
          height: context.h,
          padding: const EdgeInsets.only(top: 20, bottom: 35),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToBackButton.toBackButton(context, ColorConst.cFFFFFF),
                  Text(
                    'Forgot Password',
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorConst.cFFFFFF,
                      fontSize: 25,
                      weight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: HeightWidthContext(context).w * 0.1),
                ],
              ),
              const SizedBox(height: 15),
              TextFieldTitleWidget.textFieldTitle(text: "Email"),
              TextFieldWidget.textField(
                context: context,
                hintText: "Your Email",
                controller: context.watch<FirebaseProvider>().emailController,
              ),
              ContinueButtonWidget.continueButton(
                context: context,
                title: "Reset Password",
                function: () {
                  context.read<FirebaseProvider>().forgotPassword(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/continue_button_widget.dart';
import 'package:newsapp/core/widgets/sign_in/google_and_facebook_widget.dart';
import 'package:newsapp/core/widgets/sign_in/or_widget.dart';
import 'package:newsapp/core/widgets/sign_in/text_buttons_widget.dart';
import 'package:newsapp/core/widgets/sing_up/obscure_text_widget.dart';
import 'package:newsapp/core/widgets/sing_up/text_field_sign_up_widget.dart';
import 'package:newsapp/core/widgets/sing_up/text_field_title_sign_up_widget.dart';
import 'package:newsapp/core/widgets/toBackButton_widget.dart';
import 'package:newsapp/provider/sign_up/obscure_text_provider.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignInAuthView extends StatelessWidget {
  const SignInAuthView({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ToBackButton.toBackButton(context, ColorConst.cFFFFFF),
                      Text(
                        'Sign In',
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
                    controller:
                        context.watch<FirebaseProvider>().emailController,
                  ),
                  TextFieldTitleWidget.textFieldTitle(text: "Password"),
                  TextFieldWidget.textFieldPassword(
                    context: context,
                    hintText: "Your Password",
                    obscureText: context.watch<ObscureTextProvider>().isChecked,
                    controller:
                        context.watch<FirebaseProvider>().passwordController,
                    suffixIcon: ObscureTextWidget.obscureText(context),
                  ),
                  TextButtonsWidget.forgotPassword(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                  ),
                  TextButtonsWidget.doNotHaveAccount(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                  OrWidget.or(context),
                  GoogleAndFacebookWidget.googleAndFacebook(context),
                ],
              ),
              ContinueButtonWidget.continueButton(
                context: context,
                title: "Sign In",
                function: () {
                  context
                      .read<FirebaseProvider>()
                      .signInWithEmailPassword(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

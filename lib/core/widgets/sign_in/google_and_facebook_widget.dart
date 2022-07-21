import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class GoogleAndFacebookWidget {
  static Row googleAndFacebook(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: ColorConst.cFFFFFF,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset("assets/icons/google.svg"),
            ),
          ),
          onTap: () {
            context.read<SignUpProvider>().signInWithGoogle(context);
          },
        ),
        InkWell(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: ColorConst.cFFFFFF,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset("assets/icons/facebook.svg"),
            ),
          ),
          onTap: () {
            context.read<SignUpProvider>().signInWithFacebook(context);
          },
        ),
        InkWell(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: ColorConst.cFFFFFF,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset("assets/icons/apple.svg"),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

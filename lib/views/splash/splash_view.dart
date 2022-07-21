import 'package:flutter/material.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorConst.cFF8086_1, ColorConst.cFF3A44_1],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NEWS APP",
                style: MyTextStyleComp.myTextStyle(
                  color: ColorConst.cFFFFFF,
                  fontSize: 25,
                  weight: FontWeight.bold,
                ),
              ),
              Center(
                child: SizedBox(
                  child: Image.asset(
                    "assets/images/telephone.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Hello and welcome here!",
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorConst.cFFFFFF,
                      fontSize: 25,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Keep on top of popular news and videos from across the country, regularly updated throughout the day",
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorConst.cFFFFFF,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      "Sign In",
                      style: MyTextStyleComp.myTextStyle(
                        color: ColorConst.cFFFFFF,
                        fontSize: 25,
                        weight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_in');
                    },
                  ),
                  TextButton(
                    child: Text(
                      "Sign Up",
                      style: MyTextStyleComp.myTextStyle(
                        color: ColorConst.cFFFFFF,
                        fontSize: 25,
                        weight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

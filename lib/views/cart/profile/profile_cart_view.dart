import 'package:flutter/material.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class ProfileCartView extends StatelessWidget {
  const ProfileCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SignUpProvider>().deleteAccount(context);
        Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
      }),
    );
  }
}

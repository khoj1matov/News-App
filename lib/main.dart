import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/sign_up/obscure_text_provider.dart';
import 'package:newsapp/provider/sign_up/sign_up_provider.dart';
import 'package:newsapp/routes/routes.dart';
import 'package:provider/provider.dart';

import 'provider/sign_up/check_box_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (_) => ObscureTextProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News APP',
      onGenerateRoute: MyRoutes.instanse.onGenerate,
      initialRoute: '/splash',
    );
  }
}

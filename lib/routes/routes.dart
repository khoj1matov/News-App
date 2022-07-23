import 'package:flutter/material.dart';
import 'package:newsapp/views/auth/forgot_password_auth_view.dart';
import 'package:newsapp/views/auth/sign_in_auth_view.dart';
import 'package:newsapp/views/auth/sign_up_auth_view.dart';
import 'package:newsapp/views/cart/cart_view.dart';
import 'package:newsapp/views/cart/favorite/favorite_cart_view.dart';
import 'package:newsapp/views/cart/home/home_cart_view.dart';
import 'package:newsapp/views/cart/profile/profile_cart_view.dart';
import 'package:newsapp/views/detail/detail_view.dart';
import 'package:newsapp/views/notification/notification_view.dart';
import 'package:newsapp/views/search/search_view.dart';
import 'package:newsapp/views/splash/splash_view.dart';

class MyRoutes {
  static final MyRoutes _instanse = MyRoutes.init();
  static MyRoutes get instanse => MyRoutes._instanse;
  MyRoutes.init();

  Route<dynamic> onGenerate(RouteSettings s) {
    if (s.name == '/home') {
      return MaterialPageRoute(builder: (_) => HomeCartView());
    } else if (s.name == '/favorite') {
      return MaterialPageRoute(builder: (_) => const FavoriteCartView());
    } else if (s.name == '/profile') {
      return MaterialPageRoute(builder: (_) => const ProfileCartView());
    } else if (s.name == '/detail') {
      return MaterialPageRoute(builder: (_) => const DetailView());
    } else if (s.name == '/notification') {
      return MaterialPageRoute(builder: (_) => const NotificationView());
    } else if (s.name == '/search') {
      return MaterialPageRoute(builder: (_) => const SearchView());
    } else if (s.name == '/splash') {
      return MaterialPageRoute(builder: (_) => const SplashView());
    } else if (s.name == '/sign_in') {
      return MaterialPageRoute(builder: (_) => const SignInAuthView());
    } else if (s.name == '/sign_up') {
      return MaterialPageRoute(builder: (_) => const SignUpAuthView());
    } else if (s.name == '/forgot_password') {
      return MaterialPageRoute(builder: (_) => const ForgotPasswordAuthView());
    } else if (s.name == '/cart') {
      return MaterialPageRoute(builder: (_) => const CartView());
    } else {
      return MaterialPageRoute(builder: (_) => HomeCartView());
    }
  }
}

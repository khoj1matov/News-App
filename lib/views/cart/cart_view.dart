import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/views/cart/favorite/favorite_cart_view.dart';
import 'package:newsapp/views/cart/home/home_cart_view.dart';
import 'package:newsapp/views/cart/profile/profile_cart_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConst.cFFFFFF,
        body: const TabBarView(
          children: [
            HomeCartView(),
            FavoriteCartView(),
            ProfileCartView(),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(30),
          height: context.h * 0.1,
          width: context.w * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorConst.cFFFFFF,
          ),
          child: TabBar(
            indicatorColor: ColorConst.transparent,
            tabs: <Widget>[
              Tab(
                icon: SvgPicture.asset("assets/icons/home.svg"),
              ),
              Tab(
                icon: SvgPicture.asset("assets/icons/favorite.svg"),
              ),
              Tab(
                icon: SvgPicture.asset("assets/icons/profile.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
*/

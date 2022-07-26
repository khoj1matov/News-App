import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/views/cart/favorite/favorite_cart_view.dart';
import 'package:newsapp/views/cart/home/home_cart_view.dart';
import 'package:newsapp/views/cart/profile/profile_cart_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with TickerProviderStateMixin {
  TabController? _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.cFFFFFF,
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              const HomeCartView(),
              const FavoriteCartView(),
              ProfileCartView(),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: context.h,
            width: context.w,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              height: context.h * 0.09,
              width: context.w * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorConst.cFFFFFF,
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: ColorConst.transparent,
                tabs: <Widget>[
                  Tab(
                    icon: index != 0
                        ? SvgPicture.asset("assets/icons/home.svg")
                        : SvgPicture.asset(
                            "assets/icons/home.svg",
                            color: ColorConst.cFF3A44,
                          ),
                  ),
                  Tab(
                    icon: index != 1
                        ? SvgPicture.asset("assets/icons/favorite.svg")
                        : SvgPicture.asset(
                            "assets/icons/favorite.svg",
                            color: ColorConst.cFF3A44,
                          ),
                  ),
                  Tab(
                    icon: index != 2
                        ? SvgPicture.asset("assets/icons/profile.svg")
                        : SvgPicture.asset(
                            "assets/icons/profile.svg",
                            color: ColorConst.cFF3A44,
                          ),
                  ),
                ],
                onTap: (tabIndex) {
                  setState(() {
                    index = tabIndex;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

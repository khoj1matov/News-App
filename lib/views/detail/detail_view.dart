import 'package:flutter/material.dart';
import 'package:newsapp/core/components/favorite_list_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/core/widgets/detail/bottom_container_widget.dart';
import 'package:newsapp/core/widgets/detail/center_container_widget.dart';
import 'package:newsapp/core/widgets/detail/detail_to_back_button_widget.dart';
import 'package:newsapp/core/widgets/detail/image_container_widget.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/provider/detail/favorite_provider.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    this.data,
    this.index,
  }) : super(key: key);

  final Article? data;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final bool favorite = context.watch<FavoriteProvider>().favorite;
    var getData = data!;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.h,
          width: context.w,
          child: Stack(
            children: [
              ImageContainerWidget.imageContainer(context, getData),
              BottomContainerWidget.bottomContainer(context, getData),
              CenterContainerWidget.centerContainer(context, getData),
              DetailToBackButtonWidget.detailToBackButton(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConst.cFF3A44,
        child: favorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          context.read<FavoriteProvider>().onFavorite();
          if (favorite) {
            return FavoriteListComp.remove(data: data!);
          } else {
            return FavoriteListComp.add(data: data!);
          }
        },
      ),
    );
  }
}

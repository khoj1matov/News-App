import 'package:flutter/material.dart';
import 'package:newsapp/core/components/check_image_comp.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/models/news_model.dart';

class ImageContainerWidget {
  static Container imageContainer(BuildContext context, Article getData) {
    return Container(
      height: context.h * 0.5,
      width: context.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CheckImageComp.checkImage(getData.urlToImage!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

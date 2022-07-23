import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class CategoriesComp {
  static final List future = [
    NewsService.getApple(),
    NewsService.getTesla(),
    NewsService.getBusiness(),
    NewsService.getTechCrunch(),
    NewsService.getWallStreet(),
  ];

  static final List<String> categories = [
    'Apple',
    'Tesla',
    'Top Business',
    'TechCrunch',
    'Wall Street Journal',
  ];

  static AsyncSnapshot<NewsModel>? getData;
}

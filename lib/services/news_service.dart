import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:newsapp/core/constants/api_url_const.dart';
import 'package:newsapp/models/news_model.dart';

class NewsService {
  static var data = [];
  static List<Article> results = [];
  static Future<List<Article>> getSearchDetail({String? query}) async {
    Response res = await Dio().get(ApiUrlConst.appleApi);
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.data);
        results = data.map((e) => Article.fromJson(e)).toList();
        if (query != null) {
          print("!!!!!!!!!!!!!!!!!$query");
          results = results
              .where((element) =>
                  element.author!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print("API ERROR");
      }
    } on Exception catch (e) {
      print("ERROR: $e");
    }
    return results;
  }

  static Future<NewsModel> getApple() async {
    Response res = await Dio().get(ApiUrlConst.teslaApi);
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        if (e is DioError) {}
        throw Exception("ERROR: $e");
      }
    } else if (res.statusCode == 404) {
      throw Exception("404 PAGE NOT FOUND");
    } else {
      throw Exception("SERVER ERROR !!!");
    }
  }

  static Future<NewsModel> getTesla() async {
    Response res = await Dio().get(ApiUrlConst.teslaApi);
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        if (e is DioError) {}
        throw Exception("ERROR: $e");
      }
    } else if (res.statusCode == 404) {
      throw Exception("404 PAGE NOT FOUND");
    } else {
      throw Exception("SERVER ERROR !!!");
    }
  }

  static Future<NewsModel> getBusiness() async {
    Response res = await Dio().get(ApiUrlConst.businessApi);
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        if (e is DioError) {}
        throw Exception("ERROR: $e");
      }
    } else if (res.statusCode == 404) {
      throw Exception("404 PAGE NOT FOUND");
    } else {
      throw Exception("SERVER ERROR !!!");
    }
  }

  static Future<NewsModel> getTechCrunch() async {
    Response res = await Dio().get(ApiUrlConst.techCrunchApi);
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        if (e is DioError) {}
        throw Exception("ERROR: $e");
      }
    } else if (res.statusCode == 404) {
      throw Exception("404 PAGE NOT FOUND");
    } else {
      throw Exception("SERVER ERROR !!!");
    }
  }

  static Future<NewsModel> getWallStreet() async {
    Response res = await Dio().get(ApiUrlConst.wallStreetApi);
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        if (e is DioError) {}
        throw Exception("ERROR: $e");
      }
    } else if (res.statusCode == 404) {
      throw Exception("404 PAGE NOT FOUND");
    } else {
      throw Exception("SERVER ERROR !!!");
    }
  }
}

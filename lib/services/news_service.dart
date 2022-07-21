import 'package:dio/dio.dart';
import 'package:newsapp/core/constants/api_url_const.dart';
import 'package:newsapp/models/news_model.dart';

class NewsService {
  static Future<NewsModel> getData() async {
    print("!!!!!!!!!!!!!!!!");
    Response res = await Dio().get(ApiUrlConst.businessApi);
    print("222222222222222222");
    if (res.statusCode == 200) {
      try {
        return NewsModel.fromJson(res.data);
      } catch (e) {
        print("ERROR: $e");
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

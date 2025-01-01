import 'package:dio/dio.dart';
import 'package:todoapp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseUrl {
  Dio dio = Dio(BaseOptions(baseUrl: ipAddress));
  BaseUrl() {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(responseBody: true, request: true));
    setHeader();
  }

  setHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      dio.options.headers['Authorization'] = '';
    }
  }
}

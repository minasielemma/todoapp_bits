import 'package:dio/dio.dart';
import 'package:todoapp/apis/base_apis.dart';

class LoginApis extends BaseUrl {
  Future<Response> login(var data) async {
    return await dio.post('/auth/token/', data: data);
  }
}

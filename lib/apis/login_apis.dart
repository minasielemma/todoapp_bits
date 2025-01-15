import 'package:dio/dio.dart';
import 'package:todoapp/apis/base_apis.dart';
import 'package:todoapp/networking/network_error.dart';

class LoginApis extends BaseUrl {
  login(var data) async {
    try {
      return await dio.post('/auth/token/', data: data);
    } on DioException catch (e) {
      NetworkError.handleError(e);
    }
  }
}

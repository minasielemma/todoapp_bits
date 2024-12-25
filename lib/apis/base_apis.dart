import 'package:dio/dio.dart';
import 'package:todoapp/utils/constant.dart';

class BaseUrl {
  Dio dio = Dio(BaseOptions(baseUrl: ipAddress));
}

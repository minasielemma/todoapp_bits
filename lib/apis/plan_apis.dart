import 'package:dio/dio.dart';
import 'package:todoapp/apis/base_apis.dart';

class PlanApis extends BaseUrl {
  Future<Response> createPlan(var data) async {
    return await dio.post('/to_do_app/plan/create/', data: data);
  }

  Future<Response> getPlan() async {
    await setHeader();
    return await dio.get('/to_do_app/');
  }
}

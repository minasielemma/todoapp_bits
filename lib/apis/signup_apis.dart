import 'package:todoapp/apis/base_apis.dart';

class SignupApis extends BaseUrl {
  signupApi(var data) async {
    return await dio.post("/auth/register/", data: data);
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/apis/login_apis.dart';
import 'package:todoapp/model/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final apis = LoginApis();

  login() async {
    UserAccount user = UserAccount(
        username: usernameController.text, password: passwordController.text);
    var res = await apis.login(user.toJson());
    if (res.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", res.data["access"]);
      Get.toNamed("/plan");
    } else {
      Get.snackbar("Error", "Login Failed");
    }
  }
}

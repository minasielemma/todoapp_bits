import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/user_account.dart';
import 'package:todoapp/apis/signup_apis.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final signupApi = SignupApis();

  signup() async {
    UserAccount user = UserAccount(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        first_name: firstNameController.text,
        last_name: lastNameController.text,
        password2: confirmPasswordController.text);

    var response = await signupApi.signupApi(user.toJson());
  }
}

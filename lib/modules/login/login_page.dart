import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/modules/login/login_controller.dart';
import 'package:todoapp/utils/helper_widget.dart';
import 'package:todoapp/utils/my_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFormField(
                  hintText: "Username",
                  controller: controller.usernameController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                  obscureText: false),
              columnHight,
              MyTextFormField(
                  hintText: "Password",
                  controller: controller.passwordController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  obscureText: true),
              columnHight,
              ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      );
    });
  }
}

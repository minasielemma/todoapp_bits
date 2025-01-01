import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/sign_up/signup_controller.dart';
import 'package:todoapp/utils/helper_widget.dart';
import 'package:todoapp/utils/my_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SignupController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextFormField(
                  hintText: "Username",
                  controller: controller.usernameController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                MyTextFormField(
                  hintText: "Email",
                  controller: controller.emailController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                MyTextFormField(
                  hintText: "First Name",
                  controller: controller.firstNameController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                MyTextFormField(
                  hintText: "Last Name",
                  controller: controller.lastNameController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                MyTextFormField(
                  hintText: "Password",
                  controller: controller.passwordController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                MyTextFormField(
                  hintText: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "confirm password is required";
                    }
                    if (value != controller.passwordController.text) {
                      return "passwords do not match";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                columnHight,
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.signup();
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Text("Do you have user account?"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}

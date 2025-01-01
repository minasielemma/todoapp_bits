import 'package:get/get.dart';
import 'package:todoapp/modules/login/login_bindings.dart';
import 'package:todoapp/modules/login/login_page.dart';
import 'package:todoapp/modules/sign_up/signup_binding.dart';
import 'package:todoapp/modules/sign_up/signup_page.dart';
import 'package:todoapp/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.signup,
        page: () => SignUpPage(),
        binding: SignupBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBindings()),
  ];
}

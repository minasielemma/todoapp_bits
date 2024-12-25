import 'package:get/get.dart';
import 'package:todoapp/modules/sign_up/signup_binding.dart';
import 'package:todoapp/modules/sign_up/signup_page.dart';
import 'package:todoapp/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.signup,
        page: () => SignUpPage(),
        binding: SignupBinding()),
  ];
}

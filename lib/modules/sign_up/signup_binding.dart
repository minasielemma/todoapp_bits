import 'package:get/get.dart';
import 'package:todoapp/modules/sign_up/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

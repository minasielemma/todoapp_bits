import 'package:get/get.dart';
import 'package:todoapp/modules/plan/plan_controller.dart';

class PlanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanController>(() => PlanController());
  }
}

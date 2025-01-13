import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/apis/plan_apis.dart';
import 'package:todoapp/model/plan.dart';

class PlanController extends GetxController {
  final planNameController = TextEditingController();
  Rx<DateTime> startTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> endTime = Rx<DateTime>(DateTime.now());
  RxList<Plan> plans = <Plan>[].obs;
  final planApi = PlanApis();

  @override
  void onInit() {
    fetchPlanList();
    super.onInit();
  }

  fetchPlanList() async {
    var res = await planApi.getPlan();
    if (res.statusCode == 200) {
      res.data.forEach((element) {
        plans.add(Plan.fromMap(element)!);
      });
    }
    print(plans.length);
  }

  createPlan() {
    Plan plan = Plan(
      plan_name: planNameController.text,
      start_time: startTime.value,
      end_time: endTime.value,
    );
    planApi.createPlan(plan.toMap());
  }
}

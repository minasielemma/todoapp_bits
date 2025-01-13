import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/modules/plan/plan_controller.dart';
import 'package:todoapp/utils/helper_widget.dart';
import 'package:todoapp/utils/my_text_form_field.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Plan'),
        ),
        body: Center(
          child: Text('Plan Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showPlanCreateDialog(context, controller);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}

_showPlanCreateDialog(BuildContext context, PlanController controller) {
  Get.defaultDialog(
      title: "Create Plan",
      content: Column(
        children: [
          Row(
            children: [
              const Text("Plan Name"),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyTextFormField(
                    hintText: "Plan Name",
                    controller: controller.planNameController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter plan name";
                      } else if (value.length < 3) {
                        return "Plan name must be at least 3 characters";
                      } else {
                        return null;
                      }
                    },
                    obscureText: false),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Start time"),
              const SizedBox(
                width: 20,
              ),
              TextButton(onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true,
                    onChanged: (date) {
                  controller.startTime.value = date;
                }, onConfirm: (date) {
                  controller.startTime.value = date;
                }, currentTime: DateTime.now());
              }, child: Obx(() {
                return Text(_convertDatetime(controller.startTime.value));
              }))
            ],
          ),
          Row(children: [
            Text("End time"),
            const SizedBox(width: 20),
            TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    controller.endTime.value = date;
                  }, onConfirm: (date) {
                    controller.endTime.value = date;
                  }, currentTime: DateTime.now());
                },
                child: Text(_convertDatetime(controller.endTime.value))),
          ]),
          columnHight,
          TextButton(
              onPressed: () {
                controller.createPlan();
                Get.back();
              },
              child: const Text("Create"))
        ],
      ));
}

String _convertDatetime(DateTime date) {
  return "${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}";
}

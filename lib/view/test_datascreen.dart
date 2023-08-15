/* import 'package:e_commerce/controller/test_datacontroller.dart';
import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(TestDataController());

    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
          title: Text("testdata"),
          backgroundColor: Appcolors.primarycolor,
        ),
        body: GetBuilder<TestDataController>(builder: (controller) {
          return HandlinDataView(
              requeststat: controller.requeststate,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text("${controller.data}");
                },
              ));
        }));
  }
}
 */
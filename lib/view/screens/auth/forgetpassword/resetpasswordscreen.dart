import 'package:e_commerce/core/class/handlingdatview.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/core/functions/vaildator.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpasswordcontrollers/ressetpasswordcontroller.dart';

class RessetPasswordScreen extends StatelessWidget {
  const RessetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RessetPasswordControllerImp());
    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
          backgroundColor: Appcolors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "44".tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
          ),
        ),
        body: GetBuilder<RessetPasswordControllerImp>(
            builder: (controller) => HandlinDataRequest(
                  requeststat: controller.requeststate,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(
                          Appimageassets.newlogo,
                          height: 100,
                        ),
                        const SizedBox(height: 30),
                        CustomTitleAuth(title: "45".tr),
                        const SizedBox(height: 20),
                        CustomBodyAuth(body: "46".tr),
                        const SizedBox(height: 30),
                        GetBuilder<RessetPasswordControllerImp>(
                          builder: (controller) => Form(
                              key: controller.ressetPasswordformstate,
                              child: Column(
                                children: [
                                  CustomTextFormAuth(
                                    isobscure: controller.ispasswordhidden,
                                    ontapicon: () {
                                      controller.hidepassword();
                                    },
                                    valid: (val) {
                                      return ValidInput(val!, 5, 20, "password".tr);
                                    },
                                    hint: "14".tr,
                                    label: "47".tr,
                                    icon: Icons.lock_outline,
                                    textformcontroller: controller.password1,
                                  ),
                                  const SizedBox(height: 30),
                                  CustomTextFormAuth(
                                    isobscure: controller.ispasswordhidden2,
                                    ontapicon: () {
                                      controller.hidepassword2();
                                    },
                                    valid: (val) {
                                      return ValidInput(val!, 5, 20, "password".tr);
                                    },
                                    hint: "48".tr,
                                    label: "47".tr,
                                    icon: Icons.lock_outline,
                                    textformcontroller: controller.password2,
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              )),
                        ),
                        const SizedBox(height: 10),
                        CustomButtonAuth(
                          text: "49".tr,
                          tap: () {
                            controller.gotosucessressetpassword();
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )));
  }
}

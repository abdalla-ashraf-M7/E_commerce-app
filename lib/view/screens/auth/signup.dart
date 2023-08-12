import 'package:e_commerce/controller/auth/signupcontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customrowsignupauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/vaildator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "18".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomTitleAuth(title: "19".tr),
            const SizedBox(height: 20),
            CustomBodyAuth(body: "20".tr),
            const SizedBox(height: 40),
            Form(
                key: controller.signupformstate,
                child: Column(
                  children: [
                    CustomTextFormAuth(
                      isnumber: false,
                      valid: (val) {
                        return ValidInput(val!, 5, 20, "username".tr);
                      },
                      hint: "22".tr,
                      label: "21".tr,
                      icon: Icons.person,
                      textformcontroller: controller.username,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      isnumber: false,
                      valid: (val) {
                        return ValidInput(val!, 5, 20, "email".tr);
                      },
                      hint: "14".tr,
                      label: "13".tr,
                      icon: Icons.email_outlined,
                      textformcontroller: controller.email,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      isnumber: true,
                      valid: (val) {
                        return ValidInput(val!, 9, 11, "phone".tr);
                      },
                      hint: "24".tr,
                      label: "23".tr,
                      icon: Icons.phone_android,
                      textformcontroller: controller.phone,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      isnumber: false,
                      valid: (val) {
                        return ValidInput(val!, 5, 20, "password".tr);
                      },
                      hint: "14".tr,
                      label: "15".tr,
                      icon: Icons.lock_outline,
                      textformcontroller: controller.password,
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            CustomButtonAuth(
              text: "8".tr,
              tap: () {
                controller.gotoverifyemailsignup();
              },
            ),
            const SizedBox(height: 20),
            CustomRowSignAuth(
              text1: "25".tr,
              text2: "26".tr,
              tap: () {
                controller.gotologin();
              },
            )
          ],
        ),
      ),
    );
  }
}

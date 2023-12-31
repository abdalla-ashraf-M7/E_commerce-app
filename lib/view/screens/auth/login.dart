import 'package:e_commerce/controller/auth/logincontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customforgetpassauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customrowsignupauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LogInControllerImp controller = Get.put(LogInControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "9".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Image.asset(Appimageassets.newlogo, height: 100),
            const SizedBox(height: 30),
            CustomTitleAuth(
              title: '10'.tr,
            ),
            const SizedBox(height: 30),
            CustomBodyAuth(body: "11".tr),
            const SizedBox(height: 30),
            Form(
                key: controller.loginformstate,
                child: Column(
                  children: [
                    CustomTextFormAuth(
                      hint: "12".tr,
                      label: "13".tr,
                      icon: Icons.email_outlined,
                      textformcontroller: controller.email,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormAuth(
                      hint: "14".tr,
                      label: "15".tr,
                      icon: Icons.lock_outline,
                      textformcontroller: controller.password,
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            CustomForgetAuth(
              tap: () {
                controller.gotoforgetpassword();
              },
            ),
            const SizedBox(height: 20),
            CustomButtonAuth(text: "8".tr),
            const SizedBox(height: 20),
            CustomRowSignAuth(
              text1: "17".tr,
              text2: "18".tr,
              tap: () {
                controller.gotosignup();
              },
            )
          ],
        ),
      ),
    );
  }
}

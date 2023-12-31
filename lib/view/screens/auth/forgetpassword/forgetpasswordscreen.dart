import 'package:e_commerce/controller/auth/forgetpasswordcontrollers/forgetpasswordcontroller.dart';
import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imageassets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "35".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              Appimageassets.newlogo,
              height: 100,
            ),
            const SizedBox(height: 20),
            CustomTitleAuth(title: "36".tr),
            const SizedBox(height: 20),
            CustomBodyAuth(body: "37".tr),
            const SizedBox(height: 30),
            Form(
                child: Column(
              children: [
                CustomTextFormAuth(
                  hint: "39".tr,
                  label: "38".tr,
                  icon: Icons.email_outlined,
                  textformcontroller: controller.email,
                ),
                const SizedBox(height: 30),
              ],
            )),
            const SizedBox(height: 10),
            CustomButtonAuth(
              text: "40".tr,
              tap: () {
                Get.toNamed(Approutes.verifycode);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

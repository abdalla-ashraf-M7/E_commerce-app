import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
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
    RessetPasswordControllerImp controller = Get.put(RessetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Email Verified",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
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
            const CustomTitleAuth(title: "Resset Password"),
            const SizedBox(height: 20),
            const CustomBodyAuth(body: "Success Email Verification, Enter Your New Password "),
            const SizedBox(height: 30),
            Form(
                child: Column(
              children: [
                CustomTextFormAuth(
                  hint: "Enter Your Password",
                  label: "New password",
                  icon: Icons.lock_outline,
                  textformcontroller: controller.password1,
                ),
                const SizedBox(height: 30),
                CustomTextFormAuth(
                  hint: "Repeat Your Password",
                  label: "New password",
                  icon: Icons.lock_outline,
                  textformcontroller: controller.password1,
                ),
                const SizedBox(height: 30),
              ],
            )),
            const SizedBox(height: 10),
            CustomButtonAuth(
              text: "Save",
              tap: () {
                controller.gotosucessressetpassword();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

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
          "Log in",
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
            const CustomTitleAuth(
              title: 'Welcome Back',
            ),
            const SizedBox(height: 30),
            const CustomBodyAuth(body: "Log In With Your Email And Password OR Continue With Social Media"),
            const SizedBox(height: 30),
            Form(
                key: controller.loginformstate,
                child: Column(
                  children: [
                    CustomTextFormAuth(
                      hint: "Enter Your Email",
                      label: "Email",
                      icon: Icons.email_outlined,
                      textformcontroller: controller.email,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormAuth(
                      hint: "Enter Your Password",
                      label: "Password",
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
            const CustomButtonAuth(text: "Continue"),
            const SizedBox(height: 20),
            CustomRowSignAuth(
              text1: "Don't Have An Account?",
              text2: " Sign Up",
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

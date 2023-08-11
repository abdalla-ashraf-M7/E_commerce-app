import 'package:e_commerce/controller/auth/signupcontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombodyauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customrowsignupauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtextformauth.dart';
import 'package:e_commerce/view/widgets/authwidgets/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          "Sign Up",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CustomTitleAuth(title: "Welcome"),
            const SizedBox(height: 20),
            const CustomBodyAuth(body: "Sign Up With Your Email And Password OR Continue With Social Media"),
            const SizedBox(height: 40),
            Form(
                key: controller.signupformstate,
                child: Column(
                  children: [
                    CustomTextFormAuth(
                      hint: "Enter Your Username",
                      label: "Username",
                      icon: Icons.person,
                      textformcontroller: controller.username,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      hint: "Enter Your Email",
                      label: "Email",
                      icon: Icons.email_outlined,
                      textformcontroller: controller.email,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      hint: "Enter Your Phone",
                      label: "Phone",
                      icon: Icons.phone_android,
                      textformcontroller: controller.phone,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                      hint: "Enter Your Password",
                      label: "Password",
                      icon: Icons.lock_outline,
                      textformcontroller: controller.password,
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            CustomButtonAuth(
              text: "Continue",
              tap: () {
                controller.gotoverifyemailsignup();
              },
            ),
            const SizedBox(height: 20),
            CustomRowSignAuth(
              text1: " Have An Account?",
              text2: " Log In",
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

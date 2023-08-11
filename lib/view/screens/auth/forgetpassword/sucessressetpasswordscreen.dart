import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpasswordcontrollers/successressetpasswordcontroller.dart';

class ScuccessRessetPasswordScreen extends StatelessWidget {
  const ScuccessRessetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessRessetPasswordControllerImp controller = Get.put(SuccessRessetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "RessetPassword Completed",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: Appcolors.primarycolor,
            ),
            Text(
              "Congratolations!!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 30),
            Text(
              "It Is Done! Now You Can LogIn Your Page And Have All Our Services, Again!",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButtonAuth(
              text: "Login",
              tap: () {
                controller.gotologin();
              },
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}

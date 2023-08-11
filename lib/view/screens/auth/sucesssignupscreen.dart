import 'package:e_commerce/controller/auth/sucesssignupcontroller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widgets/authwidgets/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScuccessSignUpScreen extends StatelessWidget {
  const ScuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2, fontSize: 25),
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
              "33".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 30),
            Text(
              "34".tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButtonAuth(
              text: "26".tr,
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

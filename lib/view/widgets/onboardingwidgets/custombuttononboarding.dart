import 'package:e_commerce/controller/onboardingcontrollers/onboardingcontroller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Container(
        height: 50,
        width: 300,
        margin: const EdgeInsets.only(top: 130),
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                backgroundColor: const MaterialStatePropertyAll(Appcolors.primarycolor)),
            onPressed: () {
              controller.next();
            },
            child: Text(
              controller.pagenumber == onboardingdatasource.length - 1 ? "Log In" : "Continue",
              style: Theme.of(context).textTheme.labelLarge,
            )),
      ),
    );
  }
}

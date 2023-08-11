import 'package:e_commerce/controller/onboardingcontrollers/onboardingcontroller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:get/get.dart';

class CustomControllerOnBoarding extends StatelessWidget {
  const CustomControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onboardingdatasource.length,
                (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 6),
                    width: index == controller.pagenumber ? 20 : 5,
                    height: 5,
                    decoration: BoxDecoration(color: Appcolors.primarycolor, borderRadius: BorderRadius.circular(10)),
                    duration: const Duration(milliseconds: 600)))
          ],
        );
      },
    );
  }
}

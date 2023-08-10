import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:get/get.dart';

class CustomSliderOnBOarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBOarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.slide(value);
        },
        itemCount: onboardingdatasource.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  "${onboardingdatasource[i].title}",
                  style: const TextStyle(color: appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "${onboardingdatasource[i].body}",
                  style: const TextStyle(color: appcolors.grey, fontSize: 16, wordSpacing: 3, height: 1.4),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "${onboardingdatasource[i].image}",
                  fit: BoxFit.fill,
                  height: 300,
                  width: 300,
                )
              ],
            ));
  }
}

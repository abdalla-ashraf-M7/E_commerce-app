import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
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
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "${onboardingdatasource[i].body}",
                  style: Theme.of(context).textTheme.bodyLarge,
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

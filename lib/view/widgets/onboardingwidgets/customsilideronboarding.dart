import 'package:e_commerce/controller/onboardingcontrollers/onboardingcontroller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

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
                  style: const TextStyle(
                      color: Appcolors.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          30), //we don't use theme here as if we do when changing the theme with changing the language it will need any move to refresh then it will take the theme so with out any move the first page always will take the old theme untill you make any move ,that is why we use textstyle here so we don't need a refresh so when the app start the first page will take the specific theme and so ther other pages
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${onboardingdatasource[i].body}",
                    style: const TextStyle(color: Appcolors.grey4, fontSize: 18, wordSpacing: 3, height: 1.4),
                  ),
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

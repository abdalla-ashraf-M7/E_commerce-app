import 'package:e_commerce/core/constant/approutes.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  slide(int index);
  next();
}

class OnBoardingControllerImp extends OnBoardingController {
  int pagenumber = 0;
  PageController? pageController;
  @override
  next() {
    if (pagenumber == onboardingdatasource.length - 1) {
      Get.offAllNamed(Approutes.login);
    } else {
      pagenumber++;
      pageController!.animateToPage(pagenumber, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  slide(int index) {
    pagenumber = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

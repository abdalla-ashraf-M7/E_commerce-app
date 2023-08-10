import 'package:e_commerce/view/widgets/onboardingwidgets/custombuttononboarding.dart';
import 'package:e_commerce/view/widgets/onboardingwidgets/customcontrolleronbording.dart';
import 'package:e_commerce/view/widgets/onboardingwidgets/customsilideronboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboardingcontroller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp(), permanent: true);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          minimum: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Expanded(flex: 2, child: CustomSliderOnBOarding()),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [CustomControllerOnBoarding(), CustomButtonOnBoarding()],
                  )),
            ],
          )),
    );
  }
}
